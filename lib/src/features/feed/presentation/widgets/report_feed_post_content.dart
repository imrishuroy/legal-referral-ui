import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/extensions.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/feed/presentation/presentation.dart';

enum ReportType {
  spam,
  inappropriate,
  hateSpeech,
  violence,
  harassment,
  other,
}

class ReportFeedPostContent extends StatefulWidget {
  const ReportFeedPostContent({
    required this.feedBloc,
    required this.postId,
    super.key,
  });

  final FeedBloc feedBloc;
  final int postId;

  @override
  State<ReportFeedPostContent> createState() => _ReportFeedPostContentState();
}

class _ReportFeedPostContentState extends State<ReportFeedPostContent> {
  FeedBloc get _feedBloc => widget.feedBloc;
  final _authBloc = getIt<AuthBloc>();
  final _textController = TextEditingController();
  ReportType? _reportType;

  @override
  void initState() {
    final userId = _authBloc.state.user?.userId;
    if (userId != null) {
      _feedBloc.add(
        IsFeedPostReported(
          postId: widget.postId,
          userId: userId,
        ),
      );
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedBloc, FeedState>(
      bloc: _feedBloc,
      builder: (context, state) {
        if (state.feedActionStatus == FeedActionStatus.loading) {
          return const SizedBox(
            height: 360,
            child: CustomLoadingIndicator(
              lineWidth: 2.4,
            ),
          );
        }
        if (state.isPostReported) {
          return SizedBox(
            height: 360,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'You have already reported this post',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: context.pop,
                  child: Text(
                    'Go Back',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: LegalReferralColors.textBlue100,
                        ),
                  ),
                ),
              ],
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 12,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Text(
                    'Report Post',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: context.pop,
                  ),
                ],
              ),
              const Divider(),
              const SizedBox(height: 8),
              for (final type in ReportType.values)
                CheckboxListTile(
                  value: _reportType == type,
                  onChanged: (value) {
                    _textController.clear();
                    setState(() {
                      _reportType = value == true ? type : null;
                    });
                  },
                  title: Text(type.toString().split('.').last.capitalized),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  checkColor: Colors.blue,
                ),
              if (_reportType == ReportType.other)
                CustomTextField(
                  controller: _textController,
                  hintText: 'Enter reason',
                ),
              const SizedBox(height: 12),
              CustomElevatedButton(
                onTap: _submitReport,
                text: 'Report',
              ),
            ],
          ),
        );
      },
    );
  }

  void _submitReport() {
    final userId = _authBloc.state.user?.userId;
    if (userId != null) {
      widget.feedBloc.add(
        FeedPostReported(
          reportedBy: userId,
          postId: widget.postId,
          reason: _reportType == ReportType.other
              ? _textController.text
              : _reportType.toString().split('.').last.capitalized,
        ),
      );
      context.pop();
    }
  }
}
