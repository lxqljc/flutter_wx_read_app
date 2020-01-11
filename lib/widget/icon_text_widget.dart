import 'package:flutter/material.dart';
import 'package:wx_read_app/common/common_color.dart';

/// User: luoxiaoquan
/// Date: 2020-01-11
/// description: 图标 + 文字
class IconTextWidget extends StatelessWidget {
  ///图标
  final Widget icon;

  ///文字
  final String text;

  ///文字样式
  final TextStyle style;

  const IconTextWidget(
      {Key key,
      this.icon,
      this.text = '',
      this.style =
          const TextStyle(fontSize: 14, color: CommonColor.color8b8b8d)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        icon ?? Container(),
        Padding(
          padding: EdgeInsets.only(left: 5),
        ),
        Text(
          text,
          style: style,
        )
      ],
    );
  }
}
