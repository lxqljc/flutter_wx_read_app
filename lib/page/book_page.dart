import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wx_read_app/common/common_color.dart';
import 'package:wx_read_app/model/BookItem.dart';
import 'package:wx_read_app/utils/screen.dart';
import 'package:wx_read_app/widget/icon_text_widget.dart';
import 'package:wx_read_app/widget/search_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';

/// User: luoxiaoquan
/// Date: 2020-01-11
/// description: 书架页面
class BookPage extends StatefulWidget {
  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  List<BookItem> books = new List();

  @override
  void initState() {
    String jsonStr =
        '[{"imageUrl":"https://img1.doubanio.com/view/subject/l/public/s33505898.jpg","bookName":"了不起的我"},{"imageUrl":"https://img1.doubanio.com/view/subject/l/public/s33505898.jpg","bookName":"了不起的我"},{"imageUrl":"https://img1.doubanio.com/view/subject/l/public/s33505898.jpg","bookName":"了不起的我"},{"imageUrl":"https://img1.doubanio.com/view/subject/l/public/s33505898.jpg","bookName":"了不起的我"},{"imageUrl":"https://img1.doubanio.com/view/subject/l/public/s33505898.jpg","bookName":"了不起的我"},{"imageUrl":"https://img1.doubanio.com/view/subject/l/public/s33505898.jpg","bookName":"了不起的我"},{"imageUrl":"https://img1.doubanio.com/view/subject/l/public/s33505898.jpg","bookName":"了不起的我"},{"imageUrl":"https://img1.doubanio.com/view/subject/l/public/s33505898.jpg","bookName":"了不起的我"},{"imageUrl":"https://img1.doubanio.com/view/subject/l/public/s33505898.jpg","bookName":"了不起的我"},{"imageUrl":"https://img1.doubanio.com/view/subject/l/public/s33505898.jpg","bookName":"了不起的我"},{"imageUrl":"https://img1.doubanio.com/view/subject/l/public/s33505898.jpg","bookName":"了不起的我"},{"imageUrl":"https://img1.doubanio.com/view/subject/l/public/s33505898.jpg","bookName":"了不起的我"},{"imageUrl":"https://img1.doubanio.com/view/subject/l/public/s33505898.jpg","bookName":"了不起的我"},{"imageUrl":"https://img1.doubanio.com/view/subject/l/public/s33505898.jpg","bookName":"了不起的我"},{"imageUrl":"https://img1.doubanio.com/view/subject/l/public/s33505898.jpg","bookName":"了不起的我"}]';
    List<dynamic> bookItems = json.decode(jsonStr);
    books = bookItems.map((book) {
      return BookItem.fromJson(book);
    }).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = 3;
    double crossAxisSpacing = 40;
    double mainAxisSpacing = 1;
    //屏幕宽度 - contain的左右边距 - (crossAxisCount - 1) * crossAxisSpacing
    double itemWidth =
        Screen.width - 40 - (crossAxisCount - 1) * crossAxisSpacing;

    return SafeArea(
        child: Column(children: <Widget>[
      SearchWidget(
        leftText: '搜索书架',
        rightText: '编辑',
        margin: EdgeInsets.symmetric(horizontal: 20),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconTextWidget(
                  text: '电脑版',
                  icon: Icon(
                    Icons.computer,
                    size: 15,
                    color: CommonColor.color8b8b8d,
                  )),
              IconTextWidget(
                  text: '分类显示',
                  icon: Icon(
                    Icons.category,
                    size: 15,
                    color: CommonColor.color8b8b8d,
                  ))
            ]),
      ),
      Expanded(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: GridView.builder(
              itemCount: 15,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: crossAxisSpacing,
                  //宽高比
                  childAspectRatio: 0.5,
                  mainAxisSpacing: mainAxisSpacing),
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    CachedNetworkImage(
                      width: itemWidth,
                      fit: BoxFit.cover,
                      imageUrl: books[index].imageUrl,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                    ),
                    Text(books[index].bookName)
                  ],
                );
              }),
        ),
      )
    ]));
  }
}
