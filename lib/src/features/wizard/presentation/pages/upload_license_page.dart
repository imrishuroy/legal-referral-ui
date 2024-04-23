import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_bottom_sheet.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_button.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_loading_indicator.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_snackbar.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/wizard/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

class UploadLicensePage extends StatefulWidget {
  const UploadLicensePage({
    required this.wizardBloc,
    super.key,
  });
  static const String name = 'uploadLicensePage';

  final WizardBloc wizardBloc;

  @override
  State<UploadLicensePage> createState() => _UploadLicensePageState();
}

class _UploadLicensePageState extends State<UploadLicensePage> {
  final _authBloc = getIt<AuthBloc>();
  String? pdfFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LegalReferralColors.primaryBackground,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: LegalReferralColors.primaryBackground,
        title: Text(
          'Upload License',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.h),
        ),
      ),
      body: BlocBuilder<WizardBloc, WizardState>(
        // bloc: widget.wizardBloc,
        builder: (context, state) {
          return state.wizardStatus == WizardStatus.loading
              ? const CustomLoadingIndicator()
              : SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          AbsorbPointer(
                            absorbing: pdfFile != null,
                            child: GestureDetector(
                              onTap: () {
                                _chooseLicenseUploadFile(context);
                              },
                              child: Container(
                                height: 150.h,
                                width: double.infinity,
                                color: LegalReferralColors.containerWhite500,
                                child: pdfFile == null
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 24.h,
                                            width: 24.w,
                                            child: SvgPicture.asset(
                                              ImageStringsUtil.uploadIcon,
                                            ),
                                          ),
                                          Text(
                                            'Upload license .pdf\n2 MB max',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 12.h,
                                              fontWeight: FontWeight.w400,
                                              color: LegalReferralColors
                                                  .textGrey400,
                                            ),
                                          ),
                                        ],
                                      )
                                    : Center(
                                        child: SizedBox(
                                          height: 50.h,
                                          width: 50.w,
                                          child: SvgPicture.asset(
                                            ImageStringsUtil.file,
                                          ),
                                        ),
                                      ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          // uploaded file status
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'UPLOADED FILES',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: LegalReferralColors.textGrey500,
                                ),
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                              Container(
                                color: LegalReferralColors.containerWhite500,
                                height: 44.h,
                                width: double.infinity,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.w),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        ImageStringsUtil.file,
                                      ),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      Text(
                                        'License.pdf',
                                        style: TextStyle(
                                          fontSize: 14.h,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              LegalReferralColors.textGrey500,
                                        ),
                                      ),
                                      const Spacer(),
                                      if (pdfFile != null)
                                        CustomIconButton(
                                          onTap: () {
                                            setState(() {
                                              pdfFile = null;
                                            });
                                          },
                                          icon: SvgPicture.asset(
                                            ImageStringsUtil.deleteIcon,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          CustomElevatedButton(
                            onTap: _save,
                            text: 'Save and proceed',
                          ),
                        ],
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }

  Future<void> _chooseLicenseUploadFile(context) async {
    await CustomBottomSheet.show(
      isDismissible: true,
      context: context,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 20.h,
          ),
          HorizontalIconButon(
            iconColor: LegalReferralColors.buttonPrimary,
            icon: ImageStringsUtil.file,
            text: 'Upload License from Gallery',
            onTap: () => _uploadLicenseFromGallery(context),
          ),
          Divider(
            height: 20.h,
          ),
          HorizontalIconButon(
            iconColor: LegalReferralColors.buttonPrimary,
            icon: ImageStringsUtil.camera,
            text: 'Capture License',
            onTap: () => _pickFile(ImageSource.camera),
          ),
          Divider(
            height: 20.h,
          ),
        ],
      ),
    );
  }

  Future<void> _uploadLicenseFromGallery(BuildContext context) async {
    final filePicker = FilePicker.platform;
    final pickedFile = await filePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg'],
    );

    if (pickedFile != null) {
      final file = pickedFile.files.first;
      final fileSize = file.size;

      if (fileSize <= 2 * 1024 * 1024) {
        setState(() {
          pdfFile = file.path;
        });
      } else {
        if (context.mounted) {
          CustomSnackbar.showToast(
            context,
            type: ToastificationType.error,
            description: 'File size exceeds 2 MB.',
            title: 'Error',
          );
        }
      }
    }
  }

  Future _pickFile(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source, imageQuality: 75);
    if (pickedFile != null) {
      AppLogger.info('pickedFile: ${pickedFile.path}');
      setState(() {
        pdfFile = pickedFile.path;
      });
    } else {
      AppLogger.info('No image selected');
    }
  }

  void _save() {
    if (pdfFile == null) {
      CustomSnackbar.showToast(
        context,
        type: ToastificationType.warning,
        description: 'Please upload License',
        title: 'Alert',
      );
    } else {
      if (_authBloc.state.user != null) {
        widget.wizardBloc.add(
          LicenseUploaded(
            userId: _authBloc.state.user!.userId!,
            filePath: pdfFile!,
          ),
        );
      } else {
        CustomSnackbar.showToast(
          context,
          type: ToastificationType.warning,
          description: 'User not found',
          title: 'Error',
        );
      }
    }
  }
}
