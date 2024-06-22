import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/core/validators/validators.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/wizard/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

class SocialAvatarPage extends StatefulWidget {
  const SocialAvatarPage({
    super.key,
  });

  static const name = 'SocialAvatarPage';

  @override
  State<SocialAvatarPage> createState() => _SocialAvatarPageState();
}

class _SocialAvatarPageState extends State<SocialAvatarPage> {
  final _formKey = GlobalKey<FormState>();
  File? _file;
  final _createPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _authBloc = getIt<AuthBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LegalReferralColors.primaryBackground,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: LegalReferralColors.primaryBackground,
        title: Text(
          'Social Avatar',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.h),
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        bloc: _authBloc,
        listener: (context, state) {
          if (state.authStatus == AuthStatus.signedUp) {
            context.goNamed(WizardInspectionPage.name);
          } else if (state.authStatus == AuthStatus.failure) {
            ToastUtil.showToast(
              context,
              type: ToastificationType.error,
              description: state.failure?.message ?? 'something went wrong',
              title: 'Error',
            );
            context.goNamed(SignInPage.name);
          }
        },
        builder: (context, state) {
          return state.authStatus == AuthStatus.loading
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CustomLoadingIndicator(),
                      SizedBox(height: 8.h),
                      const Text('Account is being created, please wait...'),
                    ],
                  ),
                )
              : SafeArea(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 8.w,
                            ),
                            GestureDetector(
                              onTap: () async {
                                if (_file != null) {
                                  await _showAvatarEditSheet();
                                  return;
                                }
                                await _pickMedia(context);
                              },
                              child: _file == null
                                  ? CircleAvatar(
                                      radius: 86.r,
                                      backgroundColor:
                                          LegalReferralColors.containerWhite500,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 81.h,
                                            width: 81.w,
                                            child: SvgPicture.asset(
                                              'assets/icons/avatar.svg',
                                            ),
                                          ),
                                          Text(
                                            'ADD PROFILE\nPICTURE',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 12.h,
                                              fontWeight: FontWeight.w500,
                                              color: LegalReferralColors
                                                  .textBlue100,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : GestureDetector(
                                      onTap: _showAvatarEditSheet,
                                      child: CircleAvatar(
                                        radius: 86,
                                        backgroundImage: FileImage(_file!),
                                      ),
                                    ),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            CustomTextField(
                              controller: _createPasswordController,
                              hintText: '*************',
                              labelText: 'Create Password',
                              obscureText: true,
                              validator: (value) => Validator.validatePassword(
                                value,
                              ),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            CustomTextField(
                              controller: _confirmPasswordController,
                              hintText: '*************',
                              labelText: 'Confirm Password',
                              obscureText: true,
                              validator: (value) => Validator.validatePassword(
                                value,
                              ),
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            CustomElevatedButton(
                              onTap: _save,
                              text: 'Save and Proceed',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }

  Future _pickMedia(BuildContext context) async {
    final mediaLocation = await ImageUtil.showMediaOptionSheet(context);
    if (mediaLocation == MediaLocation.gallery) {
      final pickedFile = await FilePickerUtil.pickFiles(
        allowedExtensions: [
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

  Future<void> _showAvatarEditSheet() async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) {
        return EditProfileAvatar(
          image: _file,
          onEdit: () async {
            setState(() {
              _file = null;
            });
            context.pop();
            final file = await ImageUtil.pickImage(
              cropStyle: CropStyle.circle,
            );
            if (file != null) {
              setState(() {
                _file = file;
              });
            }
          },
          onTakePhoto: () async {
            setState(() {
              _file = null;
            });
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
            if (context.mounted) {
              context.pop();
            }
          },
          onDelete: () {
            setState(() {
              _file = null;
            });
            context.pop();
          },
        );
      },
    );
  }

  void _save() {
    if (_file == null) {
      ToastUtil.showToast(
        context,
        type: ToastificationType.warning,
        description: 'Please select a profile picture',
        title: 'Alert',
      );
      return;
    }

    if (_formKey.currentState!.validate()) {
      if (_createPasswordController.text != _confirmPasswordController.text) {
        ToastUtil.showToast(
          context,
          type: ToastificationType.error,
          description: 'Password do not match',
          title: 'Error',
        );

        return;
      }

      _authBloc.add(
        AuthSignedUp(
          password: _createPasswordController.text,
          userImageFile: XFile(_file!.path),
        ),
      );
    }
  }

  @override
  void dispose() {
    _createPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
