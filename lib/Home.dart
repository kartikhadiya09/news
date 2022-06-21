
import 'package:calculater/l1/L1_Add.dart';
import 'package:calculater/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'l1/L1_Account.dart';
import 'l1/l1_Home.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int Selected = 0;
  List l1 = [L1_Home(),L1_Add(),L1_Account()];

  @override
  void initState() {

    super.initState();
    AndroidInitializationSettings androidinit = AndroidInitializationSettings('app_icon');
    IOSInitializationSettings iosinit = IOSInitializationSettings();


    InitializationSettings initializationSettings =InitializationSettings(android: androidinit,iOS: iosinit);

    flutterLocalNotificationsPlugin.initialize(initializationSettings,onSelectNotification: onSelect);


    FirebaseMessaging.onMessage.listen((message) {

      RemoteNotification? remoteNotification = message.notification;
      AndroidNotification? androidNotification = message.notification!.android;


      if(remoteNotification!=null || androidNotification!=null){


        AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(channel.id, channel.name,importance: Importance.max,priority: Priority.high);

        flutterLocalNotificationsPlugin.show(remoteNotification.hashCode, remoteNotification!.title, remoteNotification.body, NotificationDetails(android: androidNotificationDetails));
      }


    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:  l1[Selected],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box_outlined),
              label: 'Account',
            ),
          ],
          currentIndex: Selected,
          selectedItemColor: Colors.amber[800],
          onTap: (value) {
            setState(() {
              Selected = value;
            });
          },
        ),
      ),
    );
  }

  void onSelect(String? payload) {
    Navigator.pushReplacementNamed(context, 'Home');
  }
}
