import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';
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
  File? _file;

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
        bloc: widget.wizardBloc,
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
                            absorbing: _file != null,
                            child: GestureDetector(
                              onTap: () => _pickMedia(context),
                              child: Container(
                                height: 150.h,
                                width: double.infinity,
                                color: LegalReferralColors.containerWhite500,
                                child: _file == null
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 24.h,
                                            width: 24.w,
                                            child: SvgPicture.asset(
                                              IconStringConstants.uploadIcon,
                                            ),
                                          ),
                                          Text(
                                            'Upload license file',
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
                                            IconStringConstants.file,
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
                          if (_file != null)
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
                                if (_file != null)
                                  SizedBox(
                                    height: 12.h,
                                  ),
                                if (_file != null)
                                  Container(
                                    color:
                                        LegalReferralColors.containerWhite500,
                                    height: _getFileName(_file).length > 50
                                        ? 120.h
                                        : 70.h,
                                    width: double.infinity,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.w),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            IconStringConstants.file,
                                          ),
                                          SizedBox(
                                            width: 8.w,
                                          ),
                                          Expanded(
                                            child: Text(
                                              _getFileName(_file),
                                              style: TextStyle(
                                                fontSize: 14.h,
                                                fontWeight: FontWeight.w400,
                                                color: LegalReferralColors
                                                    .textGrey500,
                                              ),
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          const Spacer(),
                                          if (_file != null)
                                            CustomIconButton(
                                              onTap: () {
                                                setState(() {
                                                  _file = null;
                                                });
                                              },
                                              icon: SvgPicture.asset(
                                                IconStringConstants.deleteIcon,
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

  String _getFileName(File? file) {
    final path = file?.path;
    if (path != null) {
      final splitPath = path.split('/');
      return splitPath.isNotEmpty ? splitPath.last : 'No file uploaded';
    } else {
      return 'No file uploaded';
    }
  }

  Future _pickMedia(BuildContext context) async {
    final mediaLocation = await ImageUtil.showMediaOptionSheet(context);
    if (mediaLocation == MediaLocation.gallery) {
      final pickedFile = await FilePickerUtil.pickFiles(
        allowedExtensions: [
          FileExtension.pdf,
          FileExtension.jpg,
          FileExtension.jpeg,
          FileExtension.png,
        ],
      );

      setState(() {
        _file = pickedFile.first;
      });
    } else if (mediaLocation == MediaLocation.camera) {
      if (context.mounted) {
        await context.pushNamed<CameraPageArgs?>(
          CameraPage.name,
          extra: CameraPageArgs(
            cropStyle: CropStyle.rectangle,
            onImageCaptured: (filePath) {
              if (filePath != null) {
                setState(() {
                  _file = File(filePath);
                });
              }
            },
          ),
        );
      }
    }
  }

  void _save() {
    if (_file == null) {
      ToastUtil.showToast(
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
            file: _file!,
          ),
        );
      } else {
        ToastUtil.showToast(
          context,
          type: ToastificationType.warning,
          description: 'User not found',
          title: 'Error',
        );
      }
    }
  }
}
