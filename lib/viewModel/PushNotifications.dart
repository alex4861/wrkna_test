import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotificationsManager {

  PushNotificationsManager._();

  factory PushNotificationsManager() => _instance;

  static final PushNotificationsManager _instance = PushNotificationsManager._();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  bool _initialized = false;

  Future<void> init(BuildContext context) async {
    if (!_initialized) {
      // For iOS request permission first.
      _showBigTextNotification();
      _firebaseMessaging.requestNotificationPermissions(
          const IosNotificationSettings(sound: true, badge: true, alert: true));
      _firebaseMessaging.onIosSettingsRegistered
          .listen((IosNotificationSettings settings) {
        print("Settings registered: $settings");
      });
      // For testing purposes print the Firebase Messaging token
      String token = await _firebaseMessaging.getToken();
      print("FirebaseMessaging token: $token");

      _initialized = true;
      _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
          print("onMessage: $message");

        },
        onBackgroundMessage: myBackgroundMessageHandler,
        onLaunch: (Map<String, dynamic> message) async {
          print("onLaunch: $message");

        },
        onResume: (Map<String, dynamic> message) async {
          print("onResume: $message");

        },
      );
    }
  }

  Future<Null> _showItemDialog(Map<String, dynamic> message, BuildContext context) async {
    showDialog<Null>(
        context: context,
        child: new AlertDialog(
          content: new Text("Item $message has been updated"),
          actions: <Widget>[
            new FlatButton(
                child: const Text('CLOSE'),
                onPressed: () {
                }),
            new FlatButton(
                child: const Text('SHOW'),
                onPressed: () {
                }),
          ],
        )).then((bool shouldNavigate) {
    });
  }

  static Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
    if (message.containsKey('data')) {
      // Handle data message
      final dynamic data = message['data'];
    }

    if (message.containsKey('notification')) {
      // Handle notification message
      final dynamic notification = message['notification'];
    }
    print("onLaunch: $message");

    return Future<void>.value();
    // Or do other work.
  }
  static Future _showBigTextNotification() async {
    var bigTextStyleInformation = new BigTextStyleInformation(
        '.',
        htmlFormatBigText: true,
        contentTitle: 'overridden <b>big</b> content title',
        htmlFormatContentTitle: true,
        summaryText: 'summary <i>text</i>',
        htmlFormatSummaryText: true);
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        '0',
        'default',
        'big text channel description',
        importance: Importance.Max,
        priority: Priority.High,
        styleInformation: bigTextStyleInformation);
    var initializationSettingsIOS = IOSNotificationDetails();

    var platformChannelSpecifics =
    new NotificationDetails(androidPlatformChannelSpecifics, initializationSettingsIOS);
    await FlutterLocalNotificationsPlugin().show(
    0, 'big text title', 'silent body', platformChannelSpecifics);
  }

}

