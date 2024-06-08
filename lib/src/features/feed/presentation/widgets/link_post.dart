import 'package:any_link_preview/any_link_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkPost extends StatelessWidget {
  const LinkPost({
    super.key,
    this.link = 'https://pub.dev/packages/any_link_preview/install',
  });

  final String link;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Wrap(
            children: [
              Text(
                '#newPost  #Link  #Poll #newPost  #Link  '
                '#Poll #newPost  #Link  #Poll',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: LegalReferralColors.textBlue79),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        AnyLinkPreview(
          link: link,
          previewHeight: 200,
          titleStyle: Theme.of(context).textTheme.titleSmall,
          bodyStyle: Theme.of(context).textTheme.bodyMedium,
          bodyMaxLines: 2,
          errorWidget: Container(
            height: 200,
            color: Colors.blue[100],
            child: const Text('Oops! something went wrong'),
          ),
          errorImage: 'https://google.com/',
          cache: const Duration(days: 7),
          backgroundColor: LegalReferralColors.containerBlue219,
          borderRadius: 0,
          boxShadow: const [BoxShadow(color: Colors.transparent)],
          onTap: () {
            launchUrl(Uri.parse(link));
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
