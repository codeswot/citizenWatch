import 'package:ctz_wtch/screens/register_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'SplashScreen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text('Register'),
          onPressed: () {
            Navigator.pushNamed(context, RegisterScreen.id);
          },
        ),
      ),
    );
  }
}
