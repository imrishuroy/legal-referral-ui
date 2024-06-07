import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/config/file_size_calulate.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/constants/icon_string_constants.dart';
import 'package:legal_referral_ui/src/features/post/presentation/bloc/post_bloc.dart';
import 'package:legal_referral_ui/src/features/post/presentation/widgets/widgets.dart';
import 'package:path/path.dart' as path;

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final TextEditingController _thoughtsController = TextEditingController();
  final TextEditingController _linkController = TextEditingController();

  final _postBloc = getIt<PostBloc>();
  bool isLinkVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.transparent,
        surfaceTintColor: LegalReferralColors.containerBlue50,
        backgroundColor: LegalReferralColors.containerBlue50,
        leading: const CustomAvatar(
          imageUrl: null,
          backgroundColor: Colors.transparent,
        ),
        title: CustomTextButton(
          text: 'Anyone',
          style: Theme.of(context).textTheme.titleMedium,
          onPressed: () {
            _showBottomSheet(
              context,
            );
          },
        ),
        actions: [
          SvgButton(
            imagePath: IconStringConstants.link,
            onPressed: () {
              setState(() {
                isLinkVisible = !isLinkVisible;
              });
              if (!isLinkVisible) {
                _linkController.clear();
              }
            },
            height: 24.h,
            width: 24.w,
          ),
          SizedBox(
            width: 16.w,
          ),
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
          SizedBox(
            width: 16.w,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
          bottom: 16.h,
        ),
        child: Column(
          children: [
            CustomTextField(
              maxLines: null,
              keyboardType: TextInputType.multiline,
              fillColor: Colors.transparent,
              borderColor: Colors.transparent,
              controller: _thoughtsController,
              hintText: 'Share your thoughts',
            ),
            if (isLinkVisible)
              CustomTextField(
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: LegalReferralColors.textBlue100),
                maxLines: 2,
                keyboardType: TextInputType.multiline,
                fillColor: Colors.transparent,
                borderColor: Colors.transparent,
                controller: _linkController,
                hintText: 'Attach Url',
              )
            else
              const SizedBox.shrink(),
            BlocBuilder<PostBloc, PostState>(
              bloc: _postBloc,
              builder: (context, state) {
                if (state.documentType == DocumentType.document &&
                    state.filePath != null) {
                  final fileName = path.basename(state.filePath!.path);
                  final fileSize = formatBytes(state.filePath!.lengthSync(), 2);
                  return state.filePath == null
                      ? const SizedBox.shrink()
                      : DocumentPost(
                          fileName: fileName,
                          fileSize: fileSize,
                          postBloc: _postBloc,
                        );
                } else if (state.documentType == DocumentType.image) {
                  return SingleImagePost(
                    postBloc: _postBloc,
                    filePath: state.filePath,
                  );
                } else if (state.documentType == DocumentType.multiImage) {
                  return MultipleImagePost(
                    postBloc: _postBloc,
                    documentFile: state.documentFile,
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            const Spacer(),
            CustomElevatedButton(
              text: 'Post',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

enum PostCondition { anyone, connectionOnly }

void _showBottomSheet(BuildContext context) {
  const post = PostCondition.anyone;
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
          groupValue: post,
          onChanged: (PostCondition? value) {
            // setState(() {
            //   post = value;
            // });
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
          groupValue: post,
          onChanged: (PostCondition? value) {
            // setState(() {
            //   post = value;
            // });
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
}
