import 'package:any_link_preview/any_link_preview.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlUtil {
  factory UrlUtil() => UrlUtil._internal();
  UrlUtil._internal();

  static Future<void> launchURL(String? url) async {
    if (url == null || url.isEmpty) {
      return;
    }
    await launchUrl(Uri.parse(url));
  }

  static String? extractLink(String text) {
    final linkRegExp = RegExp(
      r'http[s]?:\/\/(?:[a-zA-Z]|[0-9]|[$-_@.&+]|[!*\\(\\),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+',
    );
    final match = linkRegExp.firstMatch(text);
    return match?.group(0);
  }

  static bool isValidUrl(String? url) {
    if (url == null || url.isEmpty) {
      return false;
    }
    return AnyLinkPreview.isValidLink(
      url,
      protocols: ['http', 'https'],
    );
  }
}
