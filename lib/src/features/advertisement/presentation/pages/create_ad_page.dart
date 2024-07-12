import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:legal_referral_ui/src/core/common_widgets/gap.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/constants/icon_string_constants.dart';
import 'package:legal_referral_ui/src/features/advertisement/presentation/bloc/advertisement_bloc.dart';
import 'package:legal_referral_ui/src/features/advertisement/presentation/pages/preview_ad_page.dart';
import 'package:legal_referral_ui/src/features/advertisement/presentation/widgets/ad_type_card.dart';

class CreateAdPage extends StatefulWidget {
  const CreateAdPage({super.key});

  static const name = 'CreateAdPage';

  @override
  State<CreateAdPage> createState() => _CreateAdPageState();
}

class _CreateAdPageState extends State<CreateAdPage> {
  final _advertisementBloc = getIt<AdvertisementBloc>();
  final TextEditingController _title = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _link = TextEditingController();
  String uploadFileHint = 'Upload Image';
  int? selectedCardIndex = 0;

  List<File> _file = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title:
            Text('Ad Start', style: Theme.of(context).textTheme.headlineLarge),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<AdvertisementBloc, AdvertisementState>(
          bloc: _advertisementBloc,
          builder: (context, state) {
            _file = state.fileType;
            return Column(
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
                          children: [
                            AdTypeCard(
                              onPressed: () {
                                setState(() {
                                  selectedCardIndex = 0;
                                  uploadFileHint = 'Upload Image';
                                });
                              },
                              adTitle: 'Advertise with image',
                              isSelected: selectedCardIndex == 0,
                            ),
                            const Gap(width: 8),
                            AdTypeCard(
                              onPressed: () {
                                setState(() {
                                  selectedCardIndex = 1;
                                  uploadFileHint = 'Upload Video';
                                });
                              },
                              adTitle: 'Adverise with Video',
                              isSelected: selectedCardIndex == 1,
                            ),
                            const Gap(width: 8),
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
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
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
                        absorbing: _file.isNotEmpty,
                        child: GestureDetector(
                          onTap: () {
                            switch (uploadFileHint) {
                              case 'Upload Image':
                                _advertisementBloc.add(
                                  const AdSelected(
                                    advertiseType: AdvertiseType.image,
                                  ),
                                );
                                break;
                              case 'Upload Video':
                                _advertisementBloc.add(
                                  const AdSelected(
                                    advertiseType: AdvertiseType.video,
                                  ),
                                );
                                break;
                              default:
                            }
                          },
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
                            child: _file.isEmpty
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
                                        '$uploadFileHint\n25 MB max',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 12.h,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              LegalReferralColors.textGrey400,
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
                      if (state.advertiseType == AdvertiseType.loading)
                        ListTile(
                          title: Text(
                            'Uploading...',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          subtitle: const LinearProgressIndicator(
                            color: LegalReferralColors.borderBlue100,
                          ),
                        ),
                      if (state.advertiseType == AdvertiseType.success &&
                          _file.isNotEmpty)
                        ListTile(
                          title: Text(
                            'File Uploaded',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          trailing: SvgButton(
                            height: 24.h,
                            width: 24.w,
                            imagePath: IconStringConstants.deleteIcon,
                            onPressed: () {
                              _advertisementBloc.add(FileRemoved());
                            },
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
            );
          },
        ),
      ),
    );
  }
}
