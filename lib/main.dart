import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nossicomtr/splash_screen.dart';



void main(){

  runApp(StartApp());
}


class StartApp extends StatefulWidget {

  @override
  _StartAppState createState() => _StartAppState();
}

class _StartAppState extends State<StartApp> {


  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Nossi.com.tr",
      theme: ThemeData(
        primarySwatch: Colors.deepOrange
      ),
      home: SplashScreen(),
    );
  }
}



