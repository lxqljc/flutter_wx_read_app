import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wx_read_app/common/common_color.dart';
import 'package:wx_read_app/model/BookItem.dart';
import 'package:wx_read_app/model/story_item_1.dart';
import 'package:wx_read_app/model/story_item_2.dart';
import 'package:wx_read_app/widget/business/story_item_widget_1.dart';
import 'package:wx_read_app/widget/business/story_item_widget_2.dart';
import 'package:wx_read_app/widget/search_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';

/// User: luoxiaoquan
/// Date: 2020-01-11
/// description: 故事页面
class StoryPage extends StatefulWidget {
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  ///横向列表
  List<BookItem> books = new List();

  ///故事列表
  List<dynamic> storys = List();

  ///故事列表item样式
  int styleItem0 = 0;
  int styleItem1 = 1;

  @override
  void initState() {
    String jsonStr =
        '[{"imageUrl":"https://img1.doubanio.com/view/subject/l/public/s33505898.jpg","bookName":"了不起的我","recentTime":"最近阅读10分钟"},{"imageUrl":"https://img1.doubanio.com/view/subject/l/public/s33505898.jpg","bookName":"了不起的我","recentTime":"最近阅读10分钟"},{"imageUrl":"https://img1.doubanio.com/view/subject/l/public/s33505898.jpg","bookName":"了不起的我","recentTime":"最近阅读10分钟"},{"imageUrl":"https://img1.doubanio.com/view/subject/l/public/s33505898.jpg","bookName":"了不起的我","recentTime":"最近阅读10分钟"},{"imageUrl":"https://img1.doubanio.com/view/subject/l/public/s33505898.jpg","bookName":"了不起的我","recentTime":"最近阅读10分钟"},{"imageUrl":"https://img1.doubanio.com/view/subject/l/public/s33505898.jpg","bookName":"了不起的我","recentTime":"最近阅读10分钟"},{"imageUrl":"https://img1.doubanio.com/view/subject/l/public/s33505898.jpg","bookName":"了不起的我","recentTime":"最近阅读10分钟"},{"imageUrl":"https://img1.doubanio.com/view/subject/l/public/s33505898.jpg","bookName":"了不起的我","recentTime":"最近阅读10分钟"},{"imageUrl":"https://img1.doubanio.com/view/subject/l/public/s33505898.jpg","bookName":"了不起的我","recentTime":"最近阅读10分钟"},{"imageUrl":"https://img1.doubanio.com/view/subject/l/public/s33505898.jpg","bookName":"了不起的我","recentTime":"最近阅读10分钟"},{"imageUrl":"https://img1.doubanio.com/view/subject/l/public/s33505898.jpg","bookName":"了不起的我","recentTime":"最近阅读10分钟"},{"imageUrl":"https://img1.doubanio.com/view/subject/l/public/s33505898.jpg","bookName":"了不起的我","recentTime":"最近阅读10分钟"},{"imageUrl":"https://img1.doubanio.com/view/subject/l/public/s33505898.jpg","bookName":"了不起的我","recentTime":"最近阅读10分钟"},{"imageUrl":"https://img1.doubanio.com/view/subject/l/public/s33505898.jpg","bookName":"了不起的我","recentTime":"最近阅读10分钟"},{"imageUrl":"https://img1.doubanio.com/view/subject/l/public/s33505898.jpg","bookName":"了不起的我","recentTime":"最近阅读10分钟"}]';
    List<dynamic> bookItems = json.decode(jsonStr);
    books = bookItems.map((book) {
      return BookItem.fromJson(book);
    }).toList();

    String jsonStr1 =
        '[{"type":0,"title":"202年，微信放大招？要做的3件事，10大热词与张小龙的7个思考","desc":"互联网思维 #根据阅读兴趣推荐","imageUrl":"https://img1.doubanio.com/view/subject/l/public/s33505898.jpg"},{"type":0,"title":"202年，微信放大招？要做的3件事，10大热词与张小龙的7个思考","desc":"互联网思维 #根据阅读兴趣推荐","imageUrl":"https://img1.doubanio.com/view/subject/l/public/s33505898.jpg"},{"type":1,"title":"马化腾 腾讯董事会主席兼首席执行官 最近有幸读了两本克莱·舍基的书","desc":"#阅读 《稀缺》的人也在读","bookName":"认知盈余·自由时间的力量","author":"克莱·舍基","readCount":"1.3万人阅读","imageUrl":"https://img1.doubanio.com/view/subject/l/public/s33505898.jpg"},{"type":0,"title":"202年，微信放大招？要做的3件事，10大热词与张小龙的7个思考","desc":"互联网思维 #根据阅读兴趣推荐","imageUrl":"https://img1.doubanio.com/view/subject/l/public/s33505898.jpg"},{"type":0,"title":"202年，微信放大招？要做的3件事，10大热词与张小龙的7个思考","desc":"互联网思维 #根据阅读兴趣推荐","imageUrl":"https://img1.doubanio.com/view/subject/l/public/s33505898.jpg"},{"type":1,"title":"马化腾 腾讯董事会主席兼首席执行官 最近有幸读了两本克莱·舍基的书","desc":"#阅读 《稀缺》的人也在读","bookName":"认知盈余·自由时间的力量","author":"克莱·舍基","readCount":"1.3万人阅读","imageUrl":"https://img1.doubanio.com/view/subject/l/public/s33505898.jpg"},{"type":0,"title":"202年，微信放大招？要做的3件事，10大热词与张小龙的7个思考","desc":"互联网思维 #根据阅读兴趣推荐","imageUrl":"https://img1.doubanio.com/view/subject/l/public/s33505898.jpg"},{"type":0,"title":"202年，微信放大招？要做的3件事，10大热词与张小龙的7个思考","desc":"互联网思维 #根据阅读兴趣推荐","imageUrl":"https://img1.doubanio.com/view/subject/l/public/s33505898.jpg"},{"type":1,"title":"马化腾 腾讯董事会主席兼首席执行官 最近有幸读了两本克莱·舍基的书","desc":"#阅读 《稀缺》的人也在读","bookName":"认知盈余·自由时间的力量","author":"克莱·舍基","readCount":"1.3万人阅读","imageUrl":"https://img1.doubanio.com/view/subject/l/public/s33505898.jpg"}]';
    storys = json.decode(jsonStr1);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          SearchWidget(
            leftText: '雾行者（全球首发）',
            rightText: '书城',
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '继续阅读',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        Text(
                          '朋友的想法 >',
                          style: TextStyle(
                              fontSize: 13, color: CommonColor.color8b8b8d),
                        )
                      ],
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.only(bottom: 10),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 180,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Row(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  CachedNetworkImage(
                                    width: 90,
                                    height: 120,
                                    fit: BoxFit.cover,
                                    imageUrl: books[index].imageUrl,
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                  ),
                                  Text(books[index].bookName),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5),
                                  ),
                                  Text(
                                    books[index].recentTime ?? '',
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: CommonColor.color8b8b8d),
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 20),
                              )
                            ],
                          );
                        },
                        shrinkWrap: true,
                        itemCount: books.length,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      height: 1,
                      width: double.infinity,
                      color: CommonColor.color424242,
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      Widget itemWidget;

                      if (storys[index]['type'] == styleItem0) {
                        StoryItem1 item1 = StoryItem1.fromJson(storys[index]);
                        itemWidget = StoryItemWidget1(
                            title: item1.title,
                            desc: item1.desc,
                            imageUrl: item1.imageUrl);
                      } else if (storys[index]['type'] == styleItem1) {
                        StoryItem2 item2 = StoryItem2.fromJson(storys[index]);
                        itemWidget = StoryItemWidget2(
                            title: item2.title,
                            desc: item2.desc,
                            bookName: item2.bookName,
                            author: item2.author,
                            readCount: item2.readCount,
                            imageUrl: item2.imageUrl);
                      } else {
                        itemWidget = Container();
                      }
                      return itemWidget;
                    }, childCount: storys.length),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
