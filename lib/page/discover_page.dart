import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:wx_read_app/common/common_color.dart';
import 'package:wx_read_app/model/discover_item_1.dart';
import 'package:wx_read_app/model/discover_item_2.dart';
import 'package:wx_read_app/model/discover_item_3.dart';
import 'package:wx_read_app/utils/screen.dart';
import 'package:wx_read_app/widget/button_widget.dart';
import 'package:wx_read_app/widget/grid_view_widget.dart';
import 'package:wx_read_app/widget/search_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';

/// User: luoxiaoquan
/// Date: 2020-01-11
/// description: 发现页面
class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage>
    with AutomaticKeepAliveClientMixin {
  ///发现页列表
  List<dynamic> list = List();

  ///item样式1
  static const _itemStyle1 = 0;

  ///item样式2
  static const _itemStyle2 = 1;

  ///item样式3
  static const _itemStyle3 = 2;

  @override
  void initState() {
    print('DiscoverPage-->initState');
    String jsonStr =
        '[{"type":0,"title":"免费图书馆","desc":"第130期 送30本书，周五更新","books":[{"imageUrl":"https://img1.doubanio.com/view/subject/l/public/s33505898.jpg","price":"原价：69.00","bookName":"了不起的我","author":"陈海贤"},{"imageUrl":"https://img1.doubanio.com/view/subject/l/public/s33505898.jpg","price":"原价：69.00","bookName":"了不起的我","author":"陈海贤"},{"imageUrl":"https://img1.doubanio.com/view/subject/l/public/s33505898.jpg","price":"原价：69.00","bookName":"了不起的我","author":"陈海贤"},{"imageUrl":"https://img1.doubanio.com/view/subject/l/public/s33505898.jpg","price":"原价：69.00","bookName":"了不起的我","author":"陈海贤"},{"imageUrl":"https://img1.doubanio.com/view/subject/l/public/s33505898.jpg","price":"原价：69.00","bookName":"了不起的我","author":"陈海贤"},{"imageUrl":"https://img1.doubanio.com/view/subject/l/public/s33505898.jpg","price":"原价：69.00","bookName":"了不起的我","author":"陈海贤"}],"buttonText":"免费领取"},{"type":1,"title":"为你推荐","desc":"基于你的阅读历史计算，每日更新","books":["https://img1.doubanio.com/view/subject/l/public/s33505898.jpg","https://img1.doubanio.com/view/subject/l/public/s33505898.jpg","https://img1.doubanio.com/view/subject/l/public/s33505898.jpg","https://img1.doubanio.com/view/subject/l/public/s33505898.jpg"],"clickText":"换一批"},{"type":2,"bookName":"六顶思考帽","author":"爱德华·德博诺","imageUrl":"https://img1.doubanio.com/view/subject/l/public/s33505898.jpg","reader":"周杰伦","readerImage":"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1578737241768&di=39864bb0f14c02390803d9105c35b445&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201509%2F30%2F20150930175854_w3CsQ.thumb.224_0.jpeg","isLike":false}]';
    list = json.decode(jsonStr);
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Column(
        children: <Widget>[
          SearchWidget(
            leftText: '光明不灭，昊天永存',
            rightText: '书城',
            margin: EdgeInsets.symmetric(horizontal: 20),
          ),
          Expanded(
            child: PageView.builder(
                itemCount: list.length,
                controller: PageController(viewportFraction: 0.9),
                itemBuilder: (context, index) {
                  Widget itemWidget;

                  ///根据类型加载item
                  if (list[index]['type'] == _itemStyle1) {
                    DiscoverItem1 item0 = DiscoverItem1.fromJson(list[index]);
                    itemWidget = _buildItem1(item0);
                  } else if (list[index]['type'] == _itemStyle2) {
                    DiscoverItem2 item1 = DiscoverItem2.fromJson(list[index]);
                    itemWidget = _buildItem2(item1);
                  } else if (list[index]['type'] == _itemStyle3) {
                    DiscoverItem3 item2 = DiscoverItem3.fromJson(list[index]);
                    itemWidget = _buildItem3(item2);
                  }
                  return Container(
                      child: itemWidget,
                      margin: EdgeInsets.only(
                          left: 10, right: 10, top: 20, bottom: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: CommonColor.color1c1c1e,
                      ));
                }),
          )
        ],
      ),
    );
  }

  ///样式3
  Widget _buildItem3(DiscoverItem3 item2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 40),
        ),
        CachedNetworkImage(
          width: 150,
          height: 230,
          fit: BoxFit.cover,
          imageUrl: item2.imageUrl,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        Padding(
          padding: EdgeInsets.only(top: 15),
        ),
        Text(
          item2.bookName,
          style: TextStyle(fontSize: 22, color: Colors.white),
        ),
        Padding(
          padding: EdgeInsets.only(top: 7),
        ),
        Text(
          item2.author,
          style: TextStyle(fontSize: 14, color: CommonColor.color8b8b8d),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              CircleAvatar(
                radius: 20,
                child: ClipOval(
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: item2.readerImage,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
              ),
              Text(
                '${item2.reader}在读 >',
                style: TextStyle(fontSize: 14, color: CommonColor.color8b8b8d),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
              ),
              Image.asset('images/icon_like.png',
                  width: 20,
                  height: 20,
                  color: item2.isLike ? Colors.red : CommonColor.color8b8b8d),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
              ),
            ],
          ),
        )
      ],
    );
  }

  ///样式2
  Widget _buildItem2(DiscoverItem2 item1) {
    int crossAxisCount = 2;
    double mainAxisSpacing = 20;
    double crossAxisSpacing = 20;

    //计算item宽度 = (屏幕宽度 * viewportFraction - 外层Margin(10+10) - 内部Container-horizontal( 2 * 20) - crossAxisSpacing)/3
    double itemWidth =
        (Screen.width * 0.9 - 20 - 40 - crossAxisSpacing) / crossAxisCount;
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            item1.title,
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5),
          ),
          Text(
            item1.desc,
            style: TextStyle(fontSize: 15, color: CommonColor.color8b8b8d),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30),
          ),
          GridView.builder(
              itemCount: item1.books.length,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: mainAxisSpacing,
                  crossAxisSpacing: crossAxisSpacing,
                  childAspectRatio: 0.7,
                  crossAxisCount: crossAxisCount),
              itemBuilder: (context, index) {
                return CachedNetworkImage(
                  width: itemWidth,
                  fit: BoxFit.cover,
                  imageUrl: item1.books[index],
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                );
              }),
          Padding(
            padding: EdgeInsets.only(top: 30),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              item1.clickText,
              style: TextStyle(fontSize: 14, color: Colors.blue),
            ),
          )
        ],
      ),
    );
  }

  ///样式1
  Widget _buildItem1(DiscoverItem1 item) {
    List<GridData> datas = List();
    List<Books> books = item.books;
    double crossAxisSpacing = 15;
    double mainAxisSpacing = 1;
    double crossAxisCount = 3;
    //(屏幕宽度 * viewportFraction - （leftMargin + rightMargin))/crossAxisCount - (2 * crossAxisSpacing)
    double imageWidth =
        ((Screen.width * 0.9 - 20) / crossAxisCount) - (2 * crossAxisSpacing);
    //装换
    for (int i = 0; i < books.length; i++) {
      GridData data = GridData();
      data.imageUrl = books[i].imageUrl;
      data.price = books[i].price;
      data.bookName = books[i].bookName;
      data.author = books[i].author;
      data.width = imageWidth;
      datas.add(data);
    }

    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            item.title,
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5),
          ),
          Text(
            item.desc,
            style: TextStyle(fontSize: 15, color: CommonColor.color8b8b8d),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30),
          ),
          GridViewWidget(
            datas: datas,
            crossAxisCount: 3,
            crossAxisSpacing: crossAxisSpacing,
            mainAxisSpacing: mainAxisSpacing,
            //宽高比
            childAspectRatio: 0.5,
          ),
          Padding(
            padding: EdgeInsets.only(top: 30),
          ),
          ButtonWidget(item.buttonText)
        ],
      ),
    );
  }
}
