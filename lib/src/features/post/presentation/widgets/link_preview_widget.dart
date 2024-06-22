import 'package:any_link_preview/any_link_preview.dart';
import 'package:flutter/material.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';

class LinkPreviewWidget extends StatelessWidget {
  const LinkPreviewWidget({
    required this.text,
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    final link = UrlUtil.extractLink(text);
    if (link == null || link.isEmpty) {
      return const SizedBox.shrink();
    }

    final isValid = UrlUtil.isValidUrl(link);
    if (!isValid) {
      return const SizedBox.shrink();
    }

    return AnyLinkPreview(
      link: link,
      previewHeight: 200,
      titleStyle: Theme.of(context).textTheme.titleSmall,
      bodyStyle: Theme.of(context).textTheme.bodyMedium,
      bodyMaxLines: 2,
      placeholderWidget: const SizedBox.shrink(),
      errorBody: '',
      errorTitle: '',
      errorWidget: const SizedBox.shrink(),
      errorImage: 'https://google.com/',
      cache: const Duration(days: 7),
      backgroundColor: LegalReferralColors.containerBlue219,
      borderRadius: 0,
      boxShadow: const [BoxShadow(color: Colors.transparent)],
      onTap: () {
        UrlUtil.launchURL(link);
      },
    );
  }
}
