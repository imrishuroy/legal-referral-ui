import 'dart:io';

import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

class DeviceUtil {
  factory DeviceUtil() => DeviceUtil._internal();
  DeviceUtil._internal();

  static Future<String?> getId() async {
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      final iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else if (Platform.isAndroid) {
      final androidDeviceInfo = await deviceInfo.androidInfo;
      debugPrint('androidDeviceInfo: ${androidDeviceInfo.id}');
      final androidId = await const AndroidId().getId();
      debugPrint('androidId: $androidId');
      return androidId;
    }
    return null;
  }
}
