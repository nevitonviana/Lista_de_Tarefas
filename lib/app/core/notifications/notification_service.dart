import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomNotification {
  final int id;
  final String? title;
  final String? body;
  final String? payload;

  CustomNotification({required this.id, this.title, this.body, this.payload});
}

class NotificationService {
  late FlutterLocalNotificationsPlugin localNotificationsPlugin;
  late AndroidNotificationDetails androidDetails;

  NotificationService() {
    localNotificationsPlugin = FlutterLocalNotificationsPlugin();
    _setupNotification();
  }

  _setupNotification() async {
    await _initializeNotifications();
  }

  _initializeNotifications() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');

    await localNotificationsPlugin.initialize(
      const InitializationSettings(
        android: android,
      ),
      onDidReceiveNotificationResponse: _onDidReceiveNotificationResponse,
    );
  }

  _onDidReceiveNotificationResponse(NotificationResponse? details) {
    if (details?.payload != null) {
      Modular.to.pushNamed('/listProducts', arguments: "Rebaixa");
    }
  }

  showNotification({required CustomNotification notification}) {
    androidDetails = const AndroidNotificationDetails(
      'lembretes_notifications_x',
      'Lambretes',
      channelDescription: 'este e ',
      importance: Importance.max,
      priority: Priority.max,
      enableVibration: true,
    );

    localNotificationsPlugin.show(
      notification.id,
      notification.title,
      notification.body,
      NotificationDetails(
        android: androidDetails,
      ),
      payload: notification.payload,
    );
  }

  checkForNotifications() async {
    final details =
        await localNotificationsPlugin.getNotificationAppLaunchDetails();
    if (details != null && details.didNotificationLaunchApp) {
      _onDidReceiveNotificationResponse(details.notificationResponse);
    }
  }
}
