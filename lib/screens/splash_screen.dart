import 'package:ctz_wtch/screens/register_screen.dart';
import 'package:ctz_wtch/services/geolocation/geolocation_get.dart';
import 'package:ctz_wtch/widgets/button.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'SplashScreen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  LocationHelper myLocationHelper = LocationHelper();
  @override
  void initState() {
    getTheLocation();
    super.initState();
  }

  String myLocation;
  getTheLocation() async {
    myLocation = await myLocationHelper.getUserLocation();
    print(myLocation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(100),
          child: AuthButton(
            height: 60,
            name: 'Register',
            onTap: () {
              Navigator.pushNamed(context, RegisterScreen.id);
            },
          ),
        ),
      ),
    );
  }
}
