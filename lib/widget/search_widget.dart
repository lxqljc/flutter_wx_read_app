import 'package:flutter/material.dart';
import 'package:wx_read_app/common/common_color.dart';

/// User: luoxiaoquan
/// Date: 2020-01-11
/// description: 搜索框
class SearchWidget extends StatelessWidget {
  ///圆角
  final BorderRadiusGeometry borderRadius;

  ///搜索框提示文字
  final String leftText;

  ///左边点击回调
  final Function leftCallback;

  ///搜索框右边文字
  final String rightText;

  ///右边点击回调
  final Function rightCallback;

  ///搜素框高度
  final double height;

  final EdgeInsetsGeometry margin;

  const SearchWidget(
      {Key key,
      this.borderRadius,
      this.leftText = '',
      this.height = 36,
      this.rightText = '',
      this.leftCallback,
      this.margin = const EdgeInsets.all(0),
      this.rightCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: margin,
      child: Row(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: leftCallback,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                  ),
                  Image.asset(
                    'images/icon_search.png',
                    width: 20,
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.5),
                  ),
                  Text(
                    leftText,
                    style:
                        TextStyle(fontSize: 12, color: CommonColor.color8b8b8d),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: rightCallback,
            child: Row(
              children: <Widget>[
                Container(
                  height: 12,
                  width: 1,
                  color: CommonColor.color8b8b8d,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.5),
                ),
                Text(
                  rightText,
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                )
              ],
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
          color: CommonColor.color18181a,
          borderRadius: borderRadius ?? BorderRadius.circular(20)),
    );
  }
}
