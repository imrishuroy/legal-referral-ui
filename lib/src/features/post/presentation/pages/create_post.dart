import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/config/file_size_calulate.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/constants/icon_string_constants.dart';
import 'package:legal_referral_ui/src/features/post/presentation/bloc/post_bloc.dart';
import 'package:path/path.dart' as path;

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final TextEditingController _thoughtsController = TextEditingController();
  PostCondition? _post = PostCondition.anyone;

  final _postBloc = getIt<PostBloc>();
  late bool containsPdf = false;

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
                    style: Theme.of(context).textTheme.titleMedium,
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
                    onPressed: () {
                      _postBloc.add(AddedFile());
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
                maxLines: null,
                keyboardType: TextInputType.multiline,
                fillColor: Colors.transparent,
                borderColor: Colors.transparent,
                controller: _thoughtsController,
                hintText: 'Share your thoughts',
              ),
              SingleChildScrollView(
                child: BlocBuilder<PostBloc, PostState>(
                  bloc: _postBloc,
                  builder: (context, state) {
                    if (state.documentType == DocumentType.document &&
                        state.filePath != null) {
                      final fileName = path.basename(state.filePath!.path);
                      final fileSize =
                          formatBytes(state.filePath!.lengthSync(), 2);
                      return state.filePath == null
                          ? const SizedBox.shrink()
                          : Card(
                              elevation: 2,
                              child: ListTile(
                                horizontalTitleGap: 10,
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                minVerticalPadding: 4,
                                minLeadingWidth: 10,
                                visualDensity: VisualDensity.standard,
                                title: Text(
                                  fileName,
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                subtitle: Text(
                                  fileSize,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(color: Colors.grey),
                                ),
                                leading: SvgPicture.asset(
                                  IconStringConstants.pdfIcon,
                                ),
                                trailing: SvgButton(
                                  width: 20,
                                  height: 20,
                                  imagePath: IconStringConstants.cross2,
                                  onPressed: () {
                                    _postBloc.add(const RemovedFile());
                                  },
                                ),
                              ),
                            );
                    } else if (state.documentType == DocumentType.image) {
                      return Expanded(
                        child: state.filePath == null
                            ? const SizedBox.shrink()
                            : Stack(
                                children: [
                                  Image.file(
                                    state.filePath!,
                                    fit: BoxFit.fitWidth,
                                    width: double.infinity,
                                  ),
                                  Positioned(
                                    top: 10,
                                    right: 10,
                                    child: SvgButton(
                                      height: 20.h,
                                      width: 20.w,
                                      imagePath: IconStringConstants.cross,
                                      onPressed: () {
                                        if (state.filePath != null) {
                                          _postBloc.add(const RemovedFile());
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                      );
                    } else if (state.documentType == DocumentType.multiImage) {
                      return GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        itemCount: state.documentFile.length,
                        itemBuilder: (context, index) {
                          final imageFile = state.documentFile;
                          return Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.r),
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Image.file(
                                    imageFile[index]!,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 10,
                                right: 10,
                                child: SvgButton(
                                  height: 20.h,
                                  width: 20.w,
                                  imagePath: IconStringConstants.cross,
                                  onPressed: () {
                                    _postBloc.add(RemovedFile(index: index));
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
              const Spacer(),
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
