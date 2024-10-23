import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:universal_platform/universal_platform.dart';

String? selectedNotificationPayload;

/// A notification action which triggers a url launch event
const String urlLaunchActionId = 'id_1';

/// A notification action which triggers a App navigation event
const String navigationActionId = 'id_3';

/// Defines a iOS/MacOS notification category for text input actions.
const String darwinNotificationCategoryText = 'textCategory';

/// Defines a iOS/MacOS notification category for plain actions.
const String darwinNotificationCategoryPlain = 'plainCategory';

@lazySingleton
class LocalNotificationUtil {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void notificationTapBackground(
    NotificationResponse notificationResponse,
  ) {
    debugPrint('notificationTapBackground $notificationResponse');
  }

  Future<void> setupLocalNotification() async {
    final notificationAppLaunchDetails = !kIsWeb && Platform.isLinux
        ? null
        : await flutterLocalNotificationsPlugin
            .getNotificationAppLaunchDetails();

    // var initialRoute = '/';
    if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
      selectedNotificationPayload =
          notificationAppLaunchDetails!.notificationResponse?.payload;
      // initialRoute = '/post-details';
    }

    const initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');

    final darwinNotificationCategories = <DarwinNotificationCategory>[
      DarwinNotificationCategory(
        darwinNotificationCategoryText,
        actions: <DarwinNotificationAction>[
          DarwinNotificationAction.text(
            'text_1',
            'Action 1',
            buttonTitle: 'Send',
            placeholder: 'Placeholder',
          ),
        ],
      ),
      DarwinNotificationCategory(
        darwinNotificationCategoryPlain,
        actions: <DarwinNotificationAction>[
          DarwinNotificationAction.plain('id_1', 'Action 1'),
          DarwinNotificationAction.plain(
            'id_2',
            'Action 2 (destructive)',
            options: <DarwinNotificationActionOption>{
              DarwinNotificationActionOption.destructive,
            },
          ),
          DarwinNotificationAction.plain(
            navigationActionId,
            'Action 3 (foreground)',
            options: <DarwinNotificationActionOption>{
              DarwinNotificationActionOption.foreground,
            },
          ),
          DarwinNotificationAction.plain(
            'id_4',
            'Action 4 (auth required)',
            options: <DarwinNotificationActionOption>{
              DarwinNotificationActionOption.authenticationRequired,
            },
          ),
        ],
        options: <DarwinNotificationCategoryOption>{
          DarwinNotificationCategoryOption.hiddenPreviewShowTitle,
        },
      ),
    ];

    /// Note: permissions aren't requested here just to demonstrate that can be
    /// done later
    final initializationSettingsDarwin = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      onDidReceiveLocalNotification:
          (int id, String? title, String? body, String? payload) async {
        // didReceiveLocalNotificationStream.add(
        //   ReceivedNotification(
        //     id: id,
        //     title: title,
        //     body: body,
        //     payload: payload,
        //   ),
        // );
      },
      notificationCategories: darwinNotificationCategories,
    );
    final initializationSettingsLinux = LinuxInitializationSettings(
      defaultActionName: 'Open notification',
      defaultIcon: AssetsLinuxIcon('icons/app_icon.png'),
    );
    final initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
      macOS: initializationSettingsDarwin,
      linux: initializationSettingsLinux,
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) {
        debugPrint('onDidReceiveNotificationResponse $notificationResponse');

        final notification = notificationResponse.payload;

        debugPrint('notification payload $notification');

        // switch (notificationResponse.notificationResponseType) {
        // case NotificationResponseType.selectedNotification:
        //   selectNotificationStream.add(notificationResponse.payload);
        //   break;
        // case NotificationResponseType.selectedNotificationAction:
        //   if (notificationResponse.actionId == navigationActionId) {
        //     selectNotificationStream.add(notificationResponse.payload);
        //   }
        //   break;
        // }
      },
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );
  }

  void showFlutterNotification(RemoteMessage message) {
    debugPrint('showFlutterNotification called with message: $message');

    final notification = message.notification;
    final android = message.notification?.android;
    if (notification != null && android != null && !kIsWeb) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title ?? '',
        notification.body ?? '',
        payload: jsonEncode(message.data),
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'high_importance_channel',
            'High Importance Notifications',
            channelDescription:
                'This channel is used for important notifications.',
            importance: Importance.high,
            icon: 'app_icon',
          ),
        ),
      );
    }
  }

  ///////

  Future<void> initialiseSettings(
    Future<void> Function(String? value) onPressed,
  ) async {
    if (!UniversalPlatform.isWeb) {
      const initializationSettingsAndroid =
          AndroidInitializationSettings('app_icon');

      const initializationSettingsIOS = DarwinInitializationSettings();

      const initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS,
      );

      await flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveBackgroundNotificationResponse: (value) {},
        onDidReceiveNotificationResponse: (value) {},
      );
    }
  }

  Future<void> showNotification({
    required String? title,
    required String? body,
    required String? payload,
  }) async {
    try {
      final id = Random().nextInt(100);
      const android = AndroidNotificationDetails(
        'id',
        'channel ',
        priority: Priority.high,
        importance: Importance.max,
      );
      const iOS = DarwinNotificationDetails();
      const platform = NotificationDetails(
        android: android,
        iOS: iOS,
      );

      await flutterLocalNotificationsPlugin.show(
        id,
        title ?? 'Hello',
        body ?? 'You may have new notifications',
        platform,
        payload: payload,
      );
    } catch (error) {
      debugPrint('error in showing notification: $error');
    }
  }

  Future<void> cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }
}
