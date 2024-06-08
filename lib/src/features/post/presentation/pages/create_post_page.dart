import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/feed/presentation/pages/feeds_page.dart';
import 'package:legal_referral_ui/src/features/post/presentation/bloc/post_bloc.dart';
import 'package:legal_referral_ui/src/features/post/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

enum PostCondition { anyone, connectionOnly }

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});
  static const name = 'CreatePostPage';

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final TextEditingController _thoughtsController = TextEditingController();
  PostCondition? _post = PostCondition.anyone;

  final _postBloc = getIt<PostBloc>();
  final _authBloc = getIt<AuthBloc>();
  late bool containsPdf = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostBloc, PostState>(
      bloc: _postBloc,
      listener: (context, state) {
        if (state.status == PostStatus.failure) {
          ToastUtil.showToast(
            context,
            title: 'Error',
            description: state.failure?.message ?? 'something went wrong',
            type: ToastificationType.error,
          );
        } else if (state.status == PostStatus.success) {
          ToastUtil.showToast(
            context,
            title: 'Success',
            description: 'Post created successfully',
            type: ToastificationType.success,
          );
          context.pushReplacementNamed(FeedsPage.name);
        }
      },
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            child: CustomElevatedButton(
              text: 'Post',
              onTap: () {
                final userId = _authBloc.state.user?.userId;
                if (userId != null) {
                  _postBloc.add(
                    PostCreated(
                      ownerId: userId,
                      title: _thoughtsController.text,
                    ),
                  );
                }
              },
              isLoading: state.status == PostStatus.loading,
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                children: [
                  Row(
                    children: [
                      CustomAvatar(
                        imageUrl: _authBloc.state.user?.avatarUrl,
                      ),
                      SizedBox(
                        width: 8.h,
                      ),
                      TextButton.icon(
                        onPressed: _chooseConnection,
                        label: Text(
                          'Anyone',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          size: 24.sp,
                        ),
                        iconAlignment: IconAlignment.end,
                      ),
                      const Spacer(),
                      SvgButton(
                        imagePath: IconStringConstants.picture,
                        onPressed: () {
                          _postBloc.add(FileAdded());
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
                  Expanded(
                    child: SingleChildScrollView(
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
                          BlocBuilder<PostBloc, PostState>(
                            bloc: _postBloc,
                            builder: (context, state) {
                              return ImagePost(
                                files: state.files,
                                onRemove: (index) => _postBloc.add(
                                  FileRemoved(index: index),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _chooseConnection() {
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
            onPressed: () {
              context.pop();
            },
          ),
          SizedBox(
            height: 24.h,
          ),
        ],
      ),
    );
  }
}
