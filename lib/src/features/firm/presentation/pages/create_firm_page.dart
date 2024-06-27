import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:legal_referral_ui/src/core/common_widgets/gap.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/constants/social_constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/firm/presentation/pages/preview_firm.dart';
import 'package:legal_referral_ui/src/features/firm/presentation/widgets/add_social_link.dart';

class CreateFirmPage extends StatefulWidget {
  const CreateFirmPage({super.key});

  @override
  State<CreateFirmPage> createState() => _CreateFirmPageState();
}

class _CreateFirmPageState extends State<CreateFirmPage> {
  final List<AddSocialLink> _socialLinkList = [];
  final _platformController = TextEditingController();
  final _firmNameController = TextEditingController();
  final _organisationController = TextEditingController();
  final _website = TextEditingController();
  final _location = TextEditingController();
  final _about = TextEditingController();
  File? _file;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text('Create a Firm Page', style: textTheme.headlineLarge),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          margin: EdgeInsets.symmetric(vertical: 8.h),
          color: LegalReferralColors.containerWhite500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                controller: _firmNameController,
                hintText: 'Firm Name',
                labelText: 'Firm Name',
              ),
              const Gap(
                height: 16,
              ),
              Text(
                'Logo',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const Gap(height: 8),
              AbsorbPointer(
                absorbing: _file != null,
                child: GestureDetector(
                  onTap: () => _pickMedia(context),
                  child: Container(
                    height: 150.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: LegalReferralColors.containerWhite500,
                      border: Border.all(
                        color: LegalReferralColors.borderBlue300,
                      ),
                    ),
                    child: _file == null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 24.h,
                                width: 24.w,
                                child: SvgPicture.asset(
                                  IconStringConstants.uploadIcon,
                                ),
                              ),
                              Text(
                                'Choose file( .png, .jpeg)\n2 MB max',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12.h,
                                  fontWeight: FontWeight.w400,
                                  color: LegalReferralColors.textGrey400,
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
              const Gap(
                height: 16,
              ),
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
                hintText: 'Select type',
                labelText: 'Organition Type',
                validator: (value) {
                  if (value == null) {
                    return 'Please select an Organisation type';
                  }
                  return null;
                },
              ),
              const Gap(
                height: 16,
              ),
              CustomTextField(
                controller: _website,
                hintText: 'http://',
                labelText: 'Website',
              ),
              const Gap(
                height: 16,
              ),
              CustomTextField(
                controller: _location,
                hintText: 'location',
                labelText: 'Location',
              ),
              const Gap(
                height: 16,
              ),
              CustomTextField(
                keyboardType: TextInputType.multiline,
                controller: _about,
                hintText: 'Share more about your firm',
                labelText: 'About',
                maxLines: 5,
                minLines: 5,
              ),
              const Gap(
                height: 16,
              ),
              Text(
                'Social Media',
                style: textTheme.headlineSmall,
              ),
              //social widget dynamically
              const AddSocialLink(),
              ..._socialLinkList.map((e) {
                return e;
              }),
              if (_socialLinkList.isNotEmpty)
                Column(
                  children: [
                    Gap(height: 16.h),
                    HorizontalIconButton(
                      style: textTheme.titleSmall?.copyWith(color: Colors.red),
                      text: 'Remove',
                      icon: IconStringConstants.reply,
                      iconColor: Colors.red,
                      onTap: () {
                        setState(() {
                          _socialLinkList.removeAt(_socialLinkList.length - 1);
                        });
                      },
                    ),
                  ],
                ),
              Gap(height: 16.h),
              HorizontalIconButton(
                style: textTheme.titleSmall
                    ?.copyWith(color: LegalReferralColors.textBlue100),
                text: 'Add Social Media',
                icon: IconStringConstants.addIcon,
                iconColor: LegalReferralColors.borderBlue100,
                onTap: () {
                  setState(() {
                    _socialLinkList.add(const AddSocialLink());
                  });
                },
              ),

              Gap(height: 16.h),
              CustomElevatedButton(
                text: 'Create Page',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PreviewFirmPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future _pickMedia(BuildContext context) async {
  final pickedImg = await ImageUtil.pickImage(cropStyle: CropStyle.circle);
  debugPrint('multipleImage $pickedImg');
}
