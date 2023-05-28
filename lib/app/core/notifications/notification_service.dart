import 'dart:ui';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../models/product_models.dart';
import '../helpers/format_date.dart';

class NotificationService {
  late FlutterLocalNotificationsPlugin _localNotificationsPlugin;
  late AndroidNotificationDetails _androidDetails;

  NotificationService() {
    _localNotificationsPlugin = FlutterLocalNotificationsPlugin();
    _setupNotification();
  }

  _setupNotification() async {
    await _initializeNotifications();
  }

  _initializeNotifications() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');

    await _localNotificationsPlugin.initialize(
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

  showNotification({required String title, required ProductModels product}) {
    _androidDetails = const AndroidNotificationDetails(
      'channel id',
      'channel name',
      channelDescription: 'channel description',
      importance: Importance.max,
      priority: Priority.max,
      enableVibration: true,
      playSound: true,
      color: Color(0x000b0bbb),
    );

    _localNotificationsPlugin.show(
      product.id!.toInt(),
      title,
      "Produtor: ${product.name}  -  Data: ${Formatter().data(product.date)}",
      NotificationDetails(
        android: _androidDetails,
      ),
    );
  }

  checkForNotifications() async {
    final details =
        await _localNotificationsPlugin.getNotificationAppLaunchDetails();
    if (details != null && details.didNotificationLaunchApp) {
      _onDidReceiveNotificationResponse(details.notificationResponse);
    }
  }
}
