
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class L1_Account extends StatefulWidget {
  const L1_Account({Key? key}) : super(key: key);

  @override
  State<L1_Account> createState() => _L1_AccountState();
}

class _L1_AccountState extends State<L1_Account> {
  FlutterLocalNotificationsPlugin _notification =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tz.initializeTimeZones();
    _requestPermissions();

    AndroidInitializationSettings androidInit =
        AndroidInitializationSettings('app_icon');
    IOSInitializationSettings iosiInit = IOSInitializationSettings();

    InitializationSettings initializationSettings =
        InitializationSettings(android: androidInit, iOS: iosiInit);

    _notification.initialize(initializationSettings,
        onSelectNotification: onSelectedNoti);
  }

  void _requestPermissions() {
    _notification
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

 // File f1 = File("");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Account"),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 180,
                    width: 180,
                 
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(90),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {

                  },
                  child: Icon(Icons.edit),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                onshow();
              },
              child: Text("Simpal notiy"),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                afterfew();
              },
              child: Text("After few Second"),
            ),
          ],
        ),
      ),
    );
  }

  void onSelectedNoti(String? payload) {}

  void onshow() {
    AndroidNotificationDetails and = AndroidNotificationDetails(
      "1",
      "New News",
      priority: Priority.high,
      importance: Importance.max,
    );
    IOSNotificationDetails ios = IOSNotificationDetails();
    _requestPermissions();
    _notification.show(1, "Aad a new news", "Testing",
        NotificationDetails(iOS: ios, android: and));
  }

  Future<void> afterfew() async {
    AndroidNotificationDetails and = await AndroidNotificationDetails(
      "1",
      "New News",
      importance: Importance.max,
      priority: Priority.high,
    );
    _requestPermissions();
    IOSNotificationDetails ios = IOSNotificationDetails();

    _notification.zonedSchedule(
        1,
        'after few second',
        'Tessting',
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
        NotificationDetails(android: and, iOS: ios),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true);
  }
}
