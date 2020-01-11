import 'package:flutter/material.dart';
import 'package:wx_read_app/common/common_color.dart';
import 'package:cached_network_image/cached_network_image.dart';

/// User: luoxiaoquan
/// Date: 2020-01-11
/// description: 故事列表-第二种样式
class StoryItemWidget2 extends StatelessWidget {
  ///标题
  final String title;

  ///描述
  final String desc;

  ///书名
  final String bookName;

  ///作者
  final String author;

  ///阅读数量
  final String readCount;

  ///图片地址
  final String imageUrl;

  const StoryItemWidget2(
      {Key key,
      this.title = '',
      this.imageUrl = '',
      this.bookName = '',
      this.author = '',
      this.readCount = '',
      this.desc = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.all(15),
          child: Row(
            children: <Widget>[
              CachedNetworkImage(
                width: 50,
                height: 70,
                fit: BoxFit.cover,
                imageUrl: imageUrl,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              Padding(padding: EdgeInsets.only(left: 10),),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      bookName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Text(
                      author,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 12, color: CommonColor.color8b8b8d),
                    ),
                    Text(
                      readCount,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 12, color: CommonColor.color8b8b8d),
                    )
                  ],
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
              color: CommonColor.color262626,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: CommonColor.color262626, width: 1)),
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
