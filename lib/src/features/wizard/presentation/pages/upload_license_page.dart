import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_button.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_icon_button.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/wizard/presentation/presentation.dart';

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
        title: const Text(
          'Upload License',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
      body: BlocBuilder<WizardBloc, WizardState>(
        bloc: widget.wizardBloc,
        builder: (context, state) {
          return state.wizardStatus == WizardStatus.loading
              ? const Center(child: CircularProgressIndicator())
              : SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          AbsorbPointer(
                            absorbing: pdfFile != null,
                            child: GestureDetector(
                              onTap: () => _uploadLicense(context),
                              child: Container(
                                height: 150,
                                width: double.infinity,
                                color: LegalReferralColors.containerWhite500,
                                child: pdfFile == null
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 24,
                                            width: 24,
                                            child: SvgPicture.asset(
                                              ImageStringsUtil.uploadIcon,
                                            ),
                                          ),
                                          const Text(
                                            'Upload license .pdf\n2 MB max',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: LegalReferralColors
                                                  .textGrey400,
                                            ),
                                          ),
                                        ],
                                      )
                                    : Center(
                                        child: SizedBox(
                                          height: 50,
                                          width: 50,
                                          child: SvgPicture.asset(
                                            ImageStringsUtil.pdfIcon,
                                          ),
                                        ),
                                      ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 24,
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
                              const SizedBox(
                                height: 12,
                              ),
                              Container(
                                color: LegalReferralColors.containerWhite500,
                                height: 44,
                                width: double.infinity,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        ImageStringsUtil.pdfIcon,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      const Text(
                                        'License.pdf',
                                        style: TextStyle(
                                          fontSize: 14,
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
                          const SizedBox(
                            height: 24,
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

  Future<void> _uploadLicense(BuildContext context) async {
    final filePicker = FilePicker.platform;
    final pickedFile = await filePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
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
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('File size exceeds 2 MB.'),
            ),
          );
        }
      }
    }
  }

  void _save() {
    if (pdfFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please upload license.'),
        ),
      );
    } else {
      if (_authBloc.state.user != null) {
        widget.wizardBloc.add(
          LicenseUploaded(
            userId: _authBloc.state.user!.id!,
            filePath: pdfFile!,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('User not found.'),
          ),
        );
      }
    }
  }
}
