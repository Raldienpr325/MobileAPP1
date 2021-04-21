import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: splashscreen(),
    );
  }
}
// ignore: camel_case_types
class splashscreen extends StatefulWidget {
  @override
  _splashscreenState createState() => _splashscreenState();
}
// ignore: camel_case_types
class _splashscreenState extends State<splashscreen> {
  void initState() {
    super.initState();
    splashscreenStart();
  }

  splashscreenStart() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => pagesatu()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.school,
                size: 100.0,
                color: Colors.white,
              ),
              SizedBox(
                height: 24.0,
              ),
              Text(
                'Praktikum Mobile 2',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              )
            ],
          )),
    );
  }
}

// ignore: camel_case_types
class pagesatu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text('Mobile 2'),
            leading: Icon(Icons.calculate_outlined),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'R.ALDIEN PRAYOGA',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  '201910370311413',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 100),
                Text(
                  '== Klik kotak dibawah untuk mengakses kalkulator ==',
                  style: TextStyle(
                    color: Colors.redAccent,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // ignore: deprecated_member_use
                RaisedButton(
                  color: Colors.blueAccent,
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BMI(),
                    ),
                  ),
                  child: Text(
                    'Kalkulator BMI',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Text(
                  "Body Mass Index(BMI)",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "adalah angka yang menjadi penilaian standar untuk menentukan apakah berat badan tergolong normal atau tidak.",
                ),
              ],
            ),
          ),
        ));
  }
}

class BMI extends StatelessWidget {
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
        body: Calculate(),
      ),
    );
  }
}

class Calculate extends StatefulWidget {
  @override
  _CalculateState createState() => _CalculateState();
}

class _CalculateState extends State {
  TextEditingController tftinggi = TextEditingController();
  TextEditingController tfberat = TextEditingController();

  String output = "";
  String hasil = "";

  // ignore: non_constant_identifier_names
  void Perhitungan() {
    var berat;
    var tinggi;
    var result;

    berat = double.parse(tfberat.text);
    tinggi = double.parse(tftinggi.text);
    result = berat / pow((tinggi / 100), 2);

    setState(() {
      output = result.toString();

      if (result < 16) {
        hasil = "Kurus, Kekurangan berat badan";
      } else if (result < 18.5) {
        hasil = "Kurus, kekurangan berat badan ringan";
      } else if (result < 25) {
        hasil = "Normal";
      } else if (result < 30) {
        hasil = "gemuk, kelebihan berat badan tingkat ringan";
      } else if (result < 35) {
        hasil = "obesitas";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          TextField(
            controller: tftinggi,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "contoh : 100",
              labelText: "Tinggi",
              suffixText: "cm",
              prefixIcon: Icon(
                Icons.pregnant_woman,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: tfberat,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "contoh : 50",
              labelText: "Berat Badan",
              suffixText: "kg",
              prefixIcon: Icon(
                Icons.pregnant_woman,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          // ignore: deprecated_member_use
          RaisedButton(
            onPressed: () {
              Perhitungan();
            },
            child: Text(
              'CALCULATE',
              style: TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            color: Colors.white,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            output,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          Text(
            hasil,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 10,
              color: Colors.black26,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.lightBlue,
            ),
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}

