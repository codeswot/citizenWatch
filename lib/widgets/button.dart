import 'package:ctz_wtch/utils/colors.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key key,
    this.name,
    this.onTap,
    this.width,
    this.height,
  }) : super(key: key);
  final String name;
  final Function onTap;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(top: 15, bottom: 15),
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          color: Color(0xff007dfe),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              color: kWhiteColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
