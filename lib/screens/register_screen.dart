import 'package:ctz_wtch/screens/home_feed.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = 'RegisterScreen';
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Text('Welcome'),
              ),
              Column(
                children: [
                  TextFormField(),
                  Container(
                    child: FlatButton(
                      child: Text('DOB'),
                      onPressed: () {
                        _selectDate(context);
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: TextFormField(),
                      ),
                      RaisedButton(
                        child: Text('Get Location'),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  TextFormField(),
                  TextFormField(),
                  RaisedButton(
                    child: Text('Register'),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        HomeFeed.id,
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
