import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:legal_referral_ui/src/core/common_widgets/gap.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/constants/icon_string_constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/advertisement/presentation/pages/preview_ad_page.dart';
import 'package:legal_referral_ui/src/features/advertisement/presentation/widgets/ad_type_card.dart';

class CreateAdPage extends StatefulWidget {
  const CreateAdPage({super.key});

  @override
  State<CreateAdPage> createState() => _CreateAdPageState();
}

class _CreateAdPageState extends State<CreateAdPage> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _link = TextEditingController();

  File? _file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title:
            Text('Ad Start', style: Theme.of(context).textTheme.headlineLarge),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(height: 8),
            // select advertisement type
            Container(
              padding: EdgeInsets.only(left: 16.w),
              color: LegalReferralColors.containerWhite500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select advertisement type',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  SizedBox(
                    height: 270.h,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: const [
                        AdTypeCard(),
                        Gap(width: 8),
                        AdTypeCard(),
                        Gap(width: 8),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Gap(height: 8),
            // Ad Details
            Container(
              color: LegalReferralColors.containerWhite500,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    controller: _title,
                    hintText: 'Give title for your ad',
                    labelText: 'Title',
                  ),
                  const Gap(
                    height: 16,
                  ),
                  CustomTextField(
                    keyboardType: TextInputType.multiline,
                    controller: _description,
                    hintText: 'Write your ad',
                    labelText: 'Description',
                    maxLines: 5,
                    minLines: 5,
                  ),
                  const Gap(
                    height: 16,
                  ),
                  CustomTextField(
                    controller: _link,
                    hintText: 'http://',
                    labelText: 'Link',
                  ),
                  const Gap(
                    height: 16,
                  ),
                  Text(
                    'Add File',
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
                                    'Upload Images\n25 MB max',
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
                  ListTile(
                    title: Text(
                      'File Name',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    subtitle: Text(
                      'file Size --> Slider',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: LegalReferralColors.textGrey400),
                    ),
                    trailing: SvgButton(
                      height: 24.h,
                      width: 24.w,
                      imagePath: IconStringConstants.deleteIcon,
                      onPressed: () {},
                    ),
                  ),
                  const Gap(
                    height: 16,
                  ),
                  CustomElevatedButton(
                    text: 'Preview',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const PreviewAdPage(
                            title: 'Welcome to our new store',
                            description: 'Nam pellentesque magna ac ex'
                                ' convallis yet ehe as ullamcorper. '
                                'Mauris iaculis semper ',
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _pickMedia(BuildContext context) async {
    final multipleImage = await ImageUtil.pickMultipleImages();
  debugPrint('multipleImage $multipleImage');
    final pickedVideo = await FilePickerUtil.pickVideo();
    debugPrint('video $pickedVideo');
  }
}
