import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/constants/social_constants.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_button.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_dropdown.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_loading_indicator.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_snackbar.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_textfield.dart';
import 'package:legal_referral_ui/src/features/profile/domain/domain.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

class AddSocialPage extends StatefulWidget {
  const AddSocialPage({super.key});

  static const String name = 'AddSocialPage';

  @override
  State<AddSocialPage> createState() => _AddSocialPageState();
}

class _AddSocialPageState extends State<AddSocialPage> {
  final _formKey = GlobalKey<FormState>();
  final _profileBloc = getIt<ProfileBloc>();
  final _platformController = TextEditingController();
  final _linkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.h,
        shadowColor: const Color.fromRGBO(0, 0, 0, 0.08),
        title: Text(
          'Social',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        bloc: _profileBloc,
        listener: (context, state) {
          if (state.profileStatus == ProfileStatus.success) {
            context.pop();
          } else if (state.profileStatus == ProfileStatus.failure) {
            CustomSnackbar.showToast(
              context,
              title: 'Error',
              description: state.failure?.message ?? 'something went wrong',
              type: ToastificationType.error,
            );
          }
        },
        builder: (context, state) {
          return state.profileStatus == ProfileStatus.loading
              ? const CustomLoadingIndicator()
              : SafeArea(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            margin: EdgeInsets.symmetric(vertical: 16.h),
                            color: LegalReferralColors.containerWhite500,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 12.h),
                                CustomDropDown(
                                  items: SocialMediaConstants.socialMediaList,
                                  onChange: (value) {
                                    if (value != null) {
                                      _platformController.text = value;
                                    }
                                  },
                                  hintText: 'Select social media',
                                  labelText: 'Social Media',
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please select a social media';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 16.h),
                                CustomTextField(
                                  controller: _linkController,
                                  hintText: 'https://www.linkedin.com',
                                  labelText: 'Link',
                                ),
                                SizedBox(height: 16.h),
                              ],
                            ),
                          ),
                          SizedBox(height: 28.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.h),
                            child: CustomElevatedButton(
                              onTap: _addSocial,
                              text: 'Save and Proceed',
                            ),
                          ),
                          SizedBox(height: 12.h),
                        ],
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }

  void _addSocial() {
    if (_formKey.currentState!.validate()) {
      final social = Social(
        entityType: EntityType.user,
        platform: _getSocialPlatform(_platformController.text),
        link: _linkController.text,
      );

      _profileBloc.add(SocialAdded(social: social));
    }
  }

  SocialPlatform _getSocialPlatform(String platform) {
    switch (platform) {
      case 'Facebook':
        return SocialPlatform.facebook;
      case 'Twitter':
        return SocialPlatform.twitter;
      case 'Instagram':
        return SocialPlatform.linkedin;
      case 'LinkedIn':
        return SocialPlatform.instagram;

      default:
        return SocialPlatform.snapchat;
    }
  }

  @override
  void dispose() {
    _platformController.dispose();
    _linkController.dispose();
    super.dispose();
  }
}
