import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/core/validators/validators.dart';
import 'package:legal_referral_ui/src/features/profile/domain/domain.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

class AddUpdateSocialPageArgs {
  AddUpdateSocialPageArgs({
    required this.profileBloc,
    this.social,
  });
  final ProfileBloc profileBloc;
  final Social? social;
}

class AddUpdateSocialPage extends StatefulWidget {
  const AddUpdateSocialPage({
    required this.arg,
    super.key,
  });

  final AddUpdateSocialPageArgs arg;

  static const String name = 'AddUpdateSocialPage';

  @override
  State<AddUpdateSocialPage> createState() => _AddUpdateSocialPageState();
}

class _AddUpdateSocialPageState extends State<AddUpdateSocialPage> {
  final _formKey = GlobalKey<FormState>();
  final _platformController = TextEditingController();
  final _linkController = TextEditingController();

  @override
  void initState() {
    final social = widget.arg.social;
    if (social?.socialId != null && social?.platform != null) {
      _platformController.text = _getSocialPlatformName(social!.platform);
    }

    _linkController.text = social?.link ?? '';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final profileBloc = widget.arg.profileBloc;
    final social = widget.arg.social;

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
        bloc: profileBloc,
        listener: (context, state) {
          if (state.socialStatus == SocialStatus.success) {
            context.pop();
          } else if (state.socialStatus == SocialStatus.failure) {
            ToastUtil.showToast(
              context,
              title: 'Error',
              description: state.failure?.message ?? 'something went wrong',
              type: ToastificationType.error,
            );
          }
        },
        builder: (context, state) {
          return state.socialStatus == SocialStatus.loading
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
                                  selectedValue: _platformController.text == ''
                                      ? null
                                      : _platformController.text,
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
                                  hintText: _hintText(
                                    _getSocialPlatform(
                                      _platformController.text,
                                    ),
                                  ),
                                  labelText: 'Link',
                                  validator: Validator.validateURL,
                                ),
                                SizedBox(height: 16.h),
                              ],
                            ),
                          ),
                          SizedBox(height: 12.h),
                          if (social?.socialId != null)
                            Center(
                              child: TextButton(
                                onPressed: () {
                                  final socialId = social?.socialId;

                                  if (socialId != null) {
                                    profileBloc.add(
                                      SocialDeleted(
                                        socialId: socialId,
                                      ),
                                    );
                                  }
                                },
                                child: const Text(
                                  'Delete Social',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                          SizedBox(height: 24.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.h),
                            child: CustomElevatedButton(
                              onTap: () => _addEditSocial(
                                profileBloc: profileBloc,
                              ),
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

  void _addEditSocial({required ProfileBloc profileBloc}) {
    if (_formKey.currentState!.validate()) {
      final social = Social(
        entityType: EntityType.user,
        platform: _getSocialPlatform(_platformController.text),
        link: _linkController.text,
      );

      final socialId = widget.arg.social?.socialId;

      if (socialId != null) {
        profileBloc.add(
          SocialUpdated(
            social: social,
            socialId: socialId,
          ),
        );
      } else {
        profileBloc.add(SocialAdded(social: social));
      }
    }
  }

  SocialPlatform _getSocialPlatform(String platform) {
    switch (platform) {
      case 'Facebook':
        return SocialPlatform.facebook;
      case 'Twitter':
        return SocialPlatform.twitter;
      case 'Instagram':
        return SocialPlatform.instagram;
      case 'LinkedIn':
        return SocialPlatform.linkedin;
      default:
        return SocialPlatform.snapchat;
    }
  }

  String _getSocialPlatformName(SocialPlatform platform) {
    AppLogger.info('Platform to check: $platform');
    switch (platform) {
      case SocialPlatform.facebook:
        return 'Facebook';
      case SocialPlatform.twitter:
        return 'Twitter';
      case SocialPlatform.instagram:
        return 'Instagram';
      case SocialPlatform.linkedin:
        return 'LinkedIn';
      case SocialPlatform.snapchat:
        return 'Snapchat';
      default:
        return '';
    }
  }

  String _hintText(SocialPlatform platform) {
    switch (platform) {
      case SocialPlatform.facebook:
        return 'https://www.facebook.com';
      case SocialPlatform.twitter:
        return 'https://www.twitter.com';
      case SocialPlatform.instagram:
        return 'https://www.instagram.com';
      case SocialPlatform.linkedin:
        return 'https://www.linkedin.com';
      case SocialPlatform.snapchat:
        return 'https://www.snapchat.com';
      default:
        return '';
    }
  }

  @override
  void dispose() {
    _platformController.dispose();
    _linkController.dispose();
    super.dispose();
  }
}
