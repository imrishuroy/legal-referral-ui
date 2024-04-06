import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_button.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_snackbar.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_textfield.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/wizard/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

class SocialAvatarPage extends StatefulWidget {
  const SocialAvatarPage({
    required this.wizardBloc,
    super.key,
  });

  final WizardBloc wizardBloc;

  @override
  State<SocialAvatarPage> createState() => _SocialAvatarPageState();
}

class _SocialAvatarPageState extends State<SocialAvatarPage> {
  final _formKey = GlobalKey<FormState>();
  File? _image;
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
      body: BlocBuilder<WizardBloc, WizardState>(
        bloc: widget.wizardBloc,
        builder: (context, state) {
          return state.wizardStatus == WizardStatus.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SafeArea(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: _pickFile,
                              child: _image == null
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
                                              //LegalReferralImg.personIcon,
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
                                  : CircleAvatar(
                                      radius: 86,
                                      backgroundImage: FileImage(_image!),
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
                              // validator: (value)
                              //  => Validators.validatePassword(value),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            CustomTextField(
                              controller: _confirmPasswordController,
                              hintText: '*************',
                              labelText: 'Confirm Password',
                              obscureText: true,
                              // validator: (value)
                              // => Validators.validateConfirmPassword(
                              //   value,
                              //   _confirmPassword.text,
                              // ),
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

  Future<void> _pickFile() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      AppLogger.info('pickedFile: ${pickedFile.path}');
      setState(() {
        _image = File(pickedFile.path);
      });
    } else {
      AppLogger.info('No image selected');
    }
  }

  void _save() {
    if (_image == null) {
      CustomSnackbar.showToast(
        context,
        type: ToastificationType.warning,
        description: 'Please select a profile picture',
        title: 'Alert',
      );
      return;
    }

    if (_formKey.currentState!.validate()) {
      if (_createPasswordController.text != _confirmPasswordController.text) {
        CustomSnackbar.showToast(
          context,
          type: ToastificationType.error,
          description: 'Password do not match',
          title: 'Error',
        );
        return;
      }

      if (_authBloc.state.user?.userId == null ||
          _authBloc.state.user?.email == null) {
        CustomSnackbar.showToast(
          context,
          type: ToastificationType.error,
          description: 'User not found.Please signIn again',
          title: 'Error',
        );
        return;
      }

      widget.wizardBloc.add(
        SocialSaved(
          userId: _authBloc.state.user!.userId!,
          email: _authBloc.state.user!.email,
          password: _createPasswordController.text,
          file: XFile(_image!.path),
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
