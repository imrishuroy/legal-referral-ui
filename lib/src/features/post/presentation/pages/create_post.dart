import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/constants/icon_string_constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final TextEditingController _thoughtsController = TextEditingController();
  PostCondition? _post = PostCondition.anyone;
  late List<File?> imageFiles = [];
  bool pdfReady = false;
  // late PDFViewController _pdfViewController;
  // int _totalPages = 0;
  // final int _currentPage = 0;

  // void _nextPage() {
  //   if (_currentPage < _totalPages - 1) {
  //     _pdfViewController.setPage(_currentPage + 1);
  //   }
  // }

  // void _prevPage() {
  //   if (_currentPage > 0) {
  //     _pdfViewController.setPage(_currentPage - 1);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              Row(
                children: [
                  const CustomAvatar(imageUrl: null),
                  SizedBox(
                    width: 8.h,
                  ),
                  CustomTextButton(
                    text: 'Anyone',
                    onPressed: () {
                      CustomBottomSheet.show(
                        borderRadius: true,
                        maxWidth: double.infinity,
                        isDismissible: true,
                        context: context,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 24.h,
                            ),
                            Text(
                              'Who can see your post?',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            RadioListTile<PostCondition>(
                              activeColor: LegalReferralColors.borderBlue100,
                              title: Text(
                                'Anyone',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              value: PostCondition.anyone,
                              groupValue: _post,
                              onChanged: (PostCondition? value) {
                                setState(() {
                                  _post = value;
                                });
                              },
                            ),
                            const Divider(
                              height: 1,
                            ),
                            RadioListTile<PostCondition>(
                              activeColor: LegalReferralColors.borderBlue100,
                              title: Text(
                                'Connection only',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              value: PostCondition.connectionOnly,
                              groupValue: _post,
                              onChanged: (PostCondition? value) {
                                setState(() {
                                  _post = value;
                                });
                              },
                            ),
                            const Divider(
                              height: 1,
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            CustomOutlinedButton(
                              textColor: LegalReferralColors.borderBlue100,
                              borderColor: LegalReferralColors.borderBlue100,
                              height: 57,
                              text: 'Done',
                              onPressed: () {},
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const Spacer(),
                  SvgButton(
                    imagePath: IconStringConstants.picture,
                    onPressed: () async {
                      final result = await FilePickerUtil.pickFile(
                        allowedExtensions: [
                          FileExtension.pdf,
                          FileExtension.jpg,
                          FileExtension.jpeg,
                          FileExtension.png,
                        ],
                      );
                      imageFiles = result;
                      print('resultoffile $result');
                    },
                    height: 24.h,
                    width: 24.w,
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  SvgButton(
                    imagePath: IconStringConstants.cross2,
                    onPressed: () {},
                    height: 24.h,
                    width: 24.w,
                  ),
                ],
              ),
              CustomTextField(
                fillColor: Colors.transparent,
                borderColor: Colors.transparent,
                controller: _thoughtsController,
                hintText: 'Share your thoughts',
              ),
              if (imageFiles.isNotEmpty)
                Expanded(
                  child: imageFiles.first!.path.endsWith('.pdf')
                      ? Expanded(
                          child: GestureDetector(
                            onLongPress: () {
                              //add for removal of element
                              if (imageFiles.isNotEmpty) {
                                imageFiles = [];
                              } 

                            },
                            child: PDFView(
                              filePath: imageFiles.first!.path,
                              // swipeHorizontal: true,
                              // onRender: (pages) {
                              //   setState(() {
                              //     _totalPages = pages!;
                              //     pdfReady = true;
                              //   });
                              // },
                              // onViewCreated: (PDFViewController vc) {
                              //   setState(() {
                              //     _pdfViewController = vc;
                              //   });
                              // },
                              // onPageChanged: (page, total) {
                              //   setState(() {
                              //     _currentPage = page!;
                              //   });
                              // },
                              // onError: (e) {
                              //   // Show some error message or UI
                              // },
                              // onPageError: (page, e) {
                              //   // Show some error message or UI
                              // },
                            ),
                          ),
                        )
                      : imageFiles.length == 1
                          ? Column(
                              children: [
                                Image.file(
                                  imageFiles.first!,
                                  fit: BoxFit.fitWidth,
                                  width: double.infinity,
                                ),
                                const Spacer(),
                              ],
                            )
                          : GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 4,
                                mainAxisSpacing: 4,
                              ),
                              itemCount: imageFiles.length,
                              itemBuilder: (context, index) {
                                return Image.file(
                                  imageFiles[index]!,
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                ),

             

              SizedBox(
                height: 8.h,
              ),

              CustomElevatedButton(
                text: 'Post',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum PostCondition { anyone, connectionOnly }
