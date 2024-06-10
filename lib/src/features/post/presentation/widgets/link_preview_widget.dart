import 'package:any_link_preview/any_link_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
      displayDirection: UIDirection.uiDirectionHorizontal,
      showMultimedia: false,
      bodyMaxLines: 5,
      titleStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
      bodyStyle: const TextStyle(color: Colors.grey, fontSize: 12),
      // errorBody: 'Show my custom error body',
      // errorTitle: 'Show my custom error title',
      // errorWidget: Container(
      //   color: Colors.grey[300],
      //   child: const Text('Oops!'),
      // ),
      // errorImage: 'https://google.com/',
      cache: const Duration(days: 7),
      backgroundColor: Colors.grey[300],
      borderRadius: 12,
      boxShadow: const [BoxShadow(blurRadius: 3, color: Colors.grey)],
      // onTap: () {}, // This disables tap event
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('text', text));
  }
}
