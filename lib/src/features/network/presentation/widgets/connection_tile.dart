import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/network/domain/domain.dart';

class ConnectionTile extends StatelessWidget {
  const ConnectionTile({
    required this.connection,
    super.key,
  });

  final Connection? connection;
  @override
  Widget build(BuildContext context) {
  
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: 8.w,
      ),
      leading: CustomAvatar(
        radius: 22,
        imageUrl: connection?.avatarUrl,
      ),
      title: Row(
        children: [
          Expanded(
            child: Text(
              '${connection?.firstName ?? ''} ${connection?.lastName ?? ''}',
              style: Theme.of(context).textTheme.headlineSmall,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          CustomIconButton(
            icon: SvgPicture.asset(
              IconStringConstants.threeDots,
            ),
            onTap: () {
              CustomBottomSheet.show(
                isDismissible: true,
                isScrollControlled: false,
                context: context,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    HorizontalIconButton(
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: LegalReferralColors.textGrey500,
                          ),
                      text: 'Message',
                      icon: IconStringConstants.message,
                      onTap: () {},
                    ),
                    const Divider(),
                    HorizontalIconButton(
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: LegalReferralColors.textGrey500,
                          ),
                      text: 'Remote Connection',
                      icon: IconStringConstants.removeConnection,
                      onTap: () {},
                    ),
                    const Divider(),
                    SizedBox(
                      height: 24.h,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            connection?.about ?? '',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: LegalReferralColors.textGrey500,
                ),
          ),
          Text(
            'Connected ${DateTimeUtil.timeAgo(connection?.createdAt)}',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: LegalReferralColors.textGrey500,
                ),
          ),
        ],
      ),
    );
  }
}
