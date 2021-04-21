import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';



void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  String _token = "";

  @override
  void initState() {
    final pushNotificationService =
        PushNotificationService(_firebaseMessaging, context);
    pushNotificationService.initialise();
    pushNotificationService.getToken().then((value) {
      setState(() {
        _token = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'BMI CALCULATOR',
            style: TextStyle(fontSize: 16),
          ),
          centerTitle: true,
          leading: Icon(Icons.arrow_back_ios, color: Colors.white),
          actions: [
            Icon(Icons.calculate),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        body: ListView(

          padding: EdgeInsets.all(15.0),
          children: <Widget>[
            Container(
              height: 80,
              color: Colors.deepOrangeAccent,
              child: const Center(child: Text('Senin',
                style: TextStyle(fontWeight: FontWeight.w900),)),
            ),
            Container(
              height: 100,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(8.0),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text('Pemrograman Mobile',
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),

                    Row( //row run horizontal
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,

                      children: <Widget>[

                        new Icon(Icons.alarm),
                        new Text('07.00-08.40'),
                        new Icon(Icons.home),
                        new Text('Lab A'),
                        new Icon(Icons.computer),
                        new Text('B16'),


                      ],

                    ),
                  ],
                ),

              ),
            ),

            Container(
              height: 80,
              color: Colors.deepOrangeAccent,
              child: const Center(child: Text('Selasa',
                style: TextStyle(fontWeight: FontWeight.w900),)),
            ),
            Container(
              height: 100,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(8.0),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text('Sistem Operasi',
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,

                      children: <Widget>[

                        new Icon(Icons.alarm),
                        new Text('15.15-16.55'),
                        new Icon(Icons.home),
                        new Text('Lab C'),
                        new Icon(Icons.computer),
                        new Text('B16'),


                      ],

                    ),
                  ],
                ),

              ),
            ),
            Container(
              height: 100,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(0.0),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text('Basis Data',
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,

                      children: <Widget>[

                        new Icon(Icons.alarm),
                        new Text('10.20-13.00'),
                        new Icon(Icons.home),
                        new Text('Lab A'),
                        new Icon(Icons.computer),
                        new Text('B16'),
                        new Text('Aldien Prayoga'),


                      ],

                    ),
                  ],
                ),

              ),
            ),
            Container(
              height: 80,
              color: Colors.deepOrangeAccent,
              child: const Center(child: Text('Rabu',
                style: TextStyle(fontWeight: FontWeight.w900),)),
            ),
            Container(
              height: 100,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(8.0),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text('Basis Data',
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,

                      children: <Widget>[

                        new Icon(Icons.alarm),
                        new Text('10.20-13.00'),
                        new Icon(Icons.home),
                        new Text('Lab A'),
                        new Icon(Icons.computer),
                        new Text('B16'),


                      ],

                    ),
                  ],
                ),

              ),
            ),
            Container(
              height: 80,
              color: Colors.deepOrangeAccent,
              child: const Center(child: Text('Kamis',
                style: TextStyle(fontWeight: FontWeight.w900),)),
            ),
            Container(
              height: 100,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(8.0),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text('Pemrograman Web',
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,

                      children: <Widget>[

                        new Icon(Icons.alarm),
                        new Text('07.00-08.40'),
                        new Icon(Icons.home),
                        new Text('Lab A'),

                        new Icon(Icons.computer),
                        new Text('B16'),


                      ],

                    ),
                  ],
                ),

              ),
            ),



          ],

        ),
      ),
    );
  }
  }


class PushNotificationService {
  final FirebaseMessaging _fcm;
  final context;

  PushNotificationService(this._fcm, this.context);

  Future getToken() async {
    String token = await _fcm.getToken();
    print("FirebaseMessaging token: $token");
    return token;
  }

  void initialise() {
    if (Platform.isIOS) {
      _fcm.requestNotificationPermissions(IosNotificationSettings());
    }

    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        showDialog(
            context: context,
            builder: (context) => AlertDialog(title: Text("$message")));
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
  }
}
