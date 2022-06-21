import 'dart:async';
import 'package:calculater/Clas/Auth.dart';
import 'package:calculater/Creat.dart';
import 'package:calculater/Home.dart';
import 'package:calculater/Login.dart';
import 'package:calculater/l1/L1_Account.dart';
import 'package:calculater/l1/L1_Add.dart';
import 'package:calculater/l1/l1_Home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

AndroidNotificationChannel channel =
    AndroidNotificationChannel('1', "Android", importance: Importance.max);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().whenComplete(() => () {});

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Splash(),
        'Login': (context) => Login(),
        'Home': (context) => Home(),
        'Create': (context) => Create(),
        'L1-1': (context) => L1_Home(),
        'L1-2': (context) => L1_Add(),
        'L1-2': (context) => L1_Account(),
      },
    ),
  );
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  @override
  Widget build(BuildContext context) {
    chek();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade400,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircularProgressIndicator(
                strokeWidth: 50,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Loding...",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }


  void chek() {
    if (Auth().user(context) == true) {
      Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        ),
      );
    } else {
      Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Login()),
        ),
      );
    }
  }
}
