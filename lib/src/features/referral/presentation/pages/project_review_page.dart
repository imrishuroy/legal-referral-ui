import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/referral/domain/domain.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

class ProjectReviewPage extends StatefulWidget {
  const ProjectReviewPage({
    super.key,
    this.project,
  });

  final Project? project;

  static const String name = 'ProjectReviewPage';

  @override
  State<ProjectReviewPage> createState() => _ProjectReviewPageState();
}

class _ProjectReviewPageState extends State<ProjectReviewPage> {
  final _authBloc = getIt<AuthBloc>();
  final _referralBloc = getIt<ReferralBloc>();
  final _experienceController = TextEditingController();
  double _rating = 0;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final project = widget.project;

    final name = '${project?.user?.firstName} '
        '${project?.user?.lastName}';
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        shadowColor: Colors.grey[100],
        title: Text(
          'Write Review',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: BlocConsumer<ReferralBloc, ReferralState>(
        bloc: _referralBloc,
        listener: (context, state) {
          if (state.status == ReferralStatus.failure) {
            ToastUtil.showToast(
              context,
              title: 'Error',
              description: state.failure?.message ?? '',
              type: ToastificationType.error,
            );
          } else if (state.status == ReferralStatus.success) {
            context.pushNamed(ReferralPage.name);
          }
        },
        builder: (context, state) {
          if (state.status == ReferralStatus.loading) {
            return const CustomLoadingIndicator();
          }
          return Form(
            key: _formKey,
            child: Column(
              children: [
                Card(
                  margin: EdgeInsets.only(left: 16.w, right: 16.w, top: 8.h),
                  elevation: 2,
                  color: LegalReferralColors.containerYellow255,
                  child: ListTile(
                    minVerticalPadding: 12.h,
                    contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
                    leading: SvgPicture.asset(IconStringConstants.alert),
                    title: const Text(
                      'The case will be closed upon '
                      'Confirmation by the referred attorney',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 12.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  color: LegalReferralColors.containerWhite500,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Rate your experience working with',
                        style: textTheme.headlineMedium,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      AttorneyDetails(
                        attorneyName: name,
                        attorneyType: project?.user?.practiceArea ?? '',
                        profileImage: project?.user?.avatarUrl,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        'How much do you rate out of 5?',
                        style: textTheme.bodyLarge,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          RatingBar.builder(
                            glow: false,
                            unratedColor: LegalReferralColors.borderGrey200,
                            initialRating: _rating,
                            minRating: 1,
                            allowHalfRating: true,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: LegalReferralColors.buttonYellow255,
                            ),
                            onRatingUpdate: (rating) {
                              setState(() {
                                _rating = rating;
                              });
                            },
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Text(
                            '$_rating',
                            style: textTheme.headlineLarge,
                          ),
                        ],
                      ),
                      CustomTextField(
                        controller: _experienceController,
                        hintText: 'Brief your experience with the Tim Van Hain',
                        labelText: '',
                        maxLines: 5,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomElevatedButton(
                        text: 'Share Review',
                        onTap: _submitReview,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _submitReview() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final userId = _authBloc.state.user?.userId;
    final projectId = widget.project?.projectId;
    if (userId != null && projectId != null) {
      _referralBloc.add(
        ProjectReviewed(
          projectReview: ProjectReview(
            userId: userId,
            projectId: projectId,
            rating: _rating,
            review: _experienceController.text,
          ),
        ),
      );
    }
  }
}
