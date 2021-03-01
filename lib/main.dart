import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'details_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Splash2(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Splash2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SplashScreen(
        seconds: 3,
        navigateAfterSeconds: new SecondScreen(),
        title: new Text(
          'HelpNow',
          style: TextStyle(fontSize: 50),
        ),
        image: new Image.asset('images/logo.png'),
        loadingText: Text("Loading"),
        photoSize: 200.0,
        loaderColor: Colors.red,
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HelpNow")),
      body: Scaffold(body: DetailsScreen()),
    );
  }
}
