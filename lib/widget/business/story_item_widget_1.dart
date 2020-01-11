import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:wx_read_app/common/common_color.dart';

/// User: luoxiaoquan
/// Date: 2020-01-11
/// description: 故事-第一种样式
class StoryItemWidget1 extends StatelessWidget {
  final String title;
  final String desc;
  final String imageUrl;

  const StoryItemWidget1(
      {Key key, this.title = '', this.imageUrl, this.desc = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
            CachedNetworkImage(
              width: 70,
              height: 70,
              fit: BoxFit.cover,
              imageUrl: imageUrl,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 10),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Text(
                desc,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12, color: CommonColor.color8b8b8d),
              ),
            ),
            Image.asset('images/icon_like.png',
                width: 15, height: 15, color: CommonColor.color8b8b8d)
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          height: 1,
          width: double.infinity,
          color: CommonColor.color424242,
        )
      ],
    );
  }
}
