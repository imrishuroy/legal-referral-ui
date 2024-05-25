import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/features/referral/domain/domain.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/presentation.dart';

class ActiveProjectCard extends StatelessWidget {
  const ActiveProjectCard({
    required this.project,
    required this.onTapAction,
    super.key,
  });

  final Project? project;
  final VoidCallback onTapAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: SizedBox(
        height: 130.h,
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 14.w),
          child: Row(
            children: [
              StatusIndicator(status: project?.status),
              SizedBox(width: 12.w),
              Expanded(
                child: ProjectDetails(
                  project: project,
                  onTapAction: onTapAction,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StatusIndicator extends StatelessWidget {
  const StatusIndicator({required this.status, super.key});

  final ProjectStatus? status;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 4.w,
      decoration: BoxDecoration(
        color: _statusTextColor(status ?? ProjectStatus.active),
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(4.r),
          bottomStart: Radius.circular(4.r),
        ),
      ),
    );
  }

  Color _statusTextColor(ProjectStatus status) {
    switch (status) {
      case ProjectStatus.active:
      case ProjectStatus.accepted:
        return const Color(0xffEB4848);
      case ProjectStatus.started:
      case ProjectStatus.completeInitiated:
        return const Color(0XFF31940E);
      case ProjectStatus.completed:
        return const Color(0XFF5E9FD6);
      case ProjectStatus.cancelled:
      default:
        return Colors.grey.shade100;
    }
  }
}

class ProjectDetails extends StatelessWidget {
  const ProjectDetails({
    required this.project,
    required this.onTapAction,
    super.key,
  });

  final Project? project;
  final VoidCallback onTapAction;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ProjectStatusChip(
          status: project?.status ?? ProjectStatus.active,
          startedAt: project?.startedAt,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12.h),
            Text(
              project?.title ?? '',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: 8.h),
            AttorneyDetails(
              attorneyName: '${project?.user?.firstName ?? ''} '
                  '${project?.user?.lastName ?? ''}',
              attorneyType: project?.user?.practiceArea ?? '',
              profileImage: project?.user?.avatarUrl,
              radius: 15,
            ),
            SizedBox(height: 8.h),
            ProjectActionBtn(
              project: project,
              onPressed: onTapAction,
            ),
          ],
        ),
      ],
    );
  }
}

class ProjectStatusChip extends StatelessWidget {
  const ProjectStatusChip({required this.status, super.key, this.startedAt});

  final ProjectStatus status;
  final DateTime? startedAt;

  @override
  Widget build(BuildContext context) {
    int? daysSinceStarted;
    if (startedAt != null) {
      daysSinceStarted = DateTime.now().difference(startedAt!).inDays;
      if (daysSinceStarted == 0) {
        daysSinceStarted = 1;
      }
    }

    return Positioned(
      right: status == ProjectStatus.started ? 8.w : 0.w,
      top: status == ProjectStatus.started ? 44.h : 0.h,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
        height: status == ProjectStatus.started ? 28.h : 24.h,
        decoration: BoxDecoration(
          color: _statusContainerColor(status),
          borderRadius: status == ProjectStatus.started
              ? BorderRadius.circular(4.r)
              : BorderRadiusDirectional.only(topEnd: Radius.circular(4.r)),
        ),
        child: Row(
          children: [
            if (_statusIconPath(status) != null &&
                status != ProjectStatus.completed)
              SvgPicture.asset(
                _statusIconPath(status)!,
                colorFilter: ColorFilter.mode(
                  _statusTextColor(status),
                  BlendMode.srcIn,
                ),
                height: status == ProjectStatus.started ? 16.h : 12.h,
                width: status == ProjectStatus.started ? 16.h : 12.h,
              ),
            SizedBox(width: 2.w),
            Text(
              daysSinceStarted != null &&
                      (status == ProjectStatus.started ||
                          status == ProjectStatus.completeInitiated)
                  ? '$daysSinceStarted days'
                  : _statusLabel(status),
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: _statusTextColor(status)),
            ),
          ],
        ),
      ),
    );
  }

  Color _statusContainerColor(ProjectStatus status) {
    switch (status) {
      case ProjectStatus.active:
      case ProjectStatus.accepted:
        return const Color(0XFFFFD6D0);
      case ProjectStatus.started:
      case ProjectStatus.completeInitiated:
        return const Color(0XFFD1E7CA);
      case ProjectStatus.completed:
        return const Color(0XFFC8F0FB);
      case ProjectStatus.cancelled:
      default:
        return Colors.grey.shade100;
    }
  }

  String? _statusIconPath(ProjectStatus status) {
    switch (status) {
      case ProjectStatus.active:
      case ProjectStatus.accepted:
      case ProjectStatus.completed:
      case ProjectStatus.cancelled:
        return IconStringConstants.star;
      case ProjectStatus.started:
      case ProjectStatus.completeInitiated:
        return IconStringConstants.historyIcon;
      default:
        return null;
    }
  }

  String _statusLabel(ProjectStatus status) {
    switch (status) {
      case ProjectStatus.active:
      case ProjectStatus.accepted:
        return 'New';
      case ProjectStatus.started:
      case ProjectStatus.completeInitiated:
        return 'In Progress';
      case ProjectStatus.completed:
        return 'Completed';
      case ProjectStatus.cancelled:
      default:
        return 'Cancelled';
    }
  }

  Color _statusTextColor(ProjectStatus status) {
    switch (status) {
      case ProjectStatus.active:
      case ProjectStatus.accepted:
        return const Color(0xffEB4848);
      case ProjectStatus.started:
      case ProjectStatus.completeInitiated:
        return const Color(0xff31940E);
      case ProjectStatus.completed:
        return const Color(0XFF5E9FD6);
      case ProjectStatus.cancelled:
      default:
        return Colors.grey.shade100;
    }
  }
}

class ProjectActionBtn extends StatelessWidget {
  const ProjectActionBtn({
    required this.project,
    required this.onPressed,
    super.key,
  });

  final Project? project;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12.w, bottom: 8.h),
      child: Align(
        alignment: Alignment.centerRight,
        child: CustomTextButton(
          text: _actionLabel(project?.status ?? ProjectStatus.active),
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: LegalReferralColors.textBlue100,
              ),
          onPressed: onPressed,
        ),
      ),
    );
  }

  String _actionLabel(ProjectStatus status) {
    switch (status) {
      case ProjectStatus.active:
      case ProjectStatus.accepted:
        return 'Start Project';
      case ProjectStatus.started:
      case ProjectStatus.completeInitiated:
        return 'View Details';
      case ProjectStatus.completed:
        return 'Acknowledge';
      case ProjectStatus.cancelled:
        return 'View';
      default:
        return '';
    }
  }
}
