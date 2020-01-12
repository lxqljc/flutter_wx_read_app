import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:wx_read_app/common/common_color.dart';

/// User: luoxiaoquan
/// Date: 2020-01-12
/// description: 我的-选项
class MineItemWidget extends StatelessWidget {
  ///图标icon
  final String iconUrl;

  ///图标圆角
  final double radius;

  ///icon文字
  final String iconText;

  ///末尾文字上
  final String endTextUp;

  ///末尾文字下
  final String endTextDown;

  const MineItemWidget(
      {Key key,
      this.iconUrl,
      this.radius = 12,
      this.iconText = '',
      this.endTextUp = '',
      this.endTextDown = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: radius,
                child: ClipOval(
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: iconUrl,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
              ),
              Text(
                iconText,
                style: TextStyle(fontSize: 15, color: Colors.white),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                endTextUp,
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              endTextDown == null
                  ? Container()
                  : Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        endTextDown,
                        style: TextStyle(
                            fontSize: 12, color: CommonColor.color8b8b8d),
                      ),
                    ),
            ],
          )
        ],
      ),
    );
  }
}
