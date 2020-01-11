import 'package:flutter/material.dart';

/// User: luoxiaoquan
/// Date: 2020-01-11
/// description: 自定义封装button
class ButtonWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color textColor;
  final Color backgroundColor;
  final double radius;
  final double width;
  final double height;

  const ButtonWidget(this.text,
      {Key key,
      this.fontSize: 15,
      this.textColor = Colors.white,
      this.backgroundColor: Colors.blue,
      this.radius: 10,
      this.width: double.infinity,
      this.height: 45})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: RaisedButton(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(radius))),
        child: new Text(
          text ?? '',
          style: TextStyle(fontSize: fontSize, color: textColor),
        ),
        onPressed: () {},
      ),
    );
  }
}
