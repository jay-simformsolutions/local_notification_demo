import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final NotificationService notificationService =
      NotificationService._internal();

  factory NotificationService() {
    return notificationService;
  }

  NotificationService._internal();

  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('@drawable/flutter_logo');

    var initializationSettingsIOS = DarwinInitializationSettings(
      requestProvisionalPermission: true,
      requestCriticalPermission: true,
      onDidReceiveLocalNotification:
          (int id, String? title, String? body, String? payload) async {},
    );

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await notificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {
      if (notificationResponse.payload != null) {
        debugPrint('Payload is ${notificationResponse.payload.toString()}');
      }
    });
  }

  notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channelName',
            importance: Importance.max, icon: '@drawable/flutter_logo'),
        iOS: DarwinNotificationDetails(
            presentBadge: true,
            presentAlert: true,
            presentSound: true,
            presentBanner: true));
  }

  Future showNotification(
      {int id = 0, String? title, String? body, String? payLoad}) async {
    return notificationsPlugin.show(
      id,
      title,
      body,
      await notificationDetails(),
      payload: payLoad,
    );
  }

  void scheduleNotification() async {
    final notificationDetail = await notificationDetails();
    await notificationsPlugin.zonedSchedule(
        0,
        'This is from schedule notification',
        'Hi, Schedule Notification',
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
        // notificationDetails,
        notificationDetail,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.wallClockTime);
  }
}
