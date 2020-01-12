import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wx_read_app/common/common_color.dart';
import 'package:wx_read_app/model/mine_item.dart';
import 'package:wx_read_app/widget/business/mine_item_widget.dart';
import 'package:wx_read_app/widget/icon_text_widget.dart';

/// User: luoxiaoquan
/// Date: 2020-01-11
/// description: 故事页面
class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  ///数据
  dynamic _data;

  ///第一组
  List<Widget> _firstWidgets = List();

  ///第二组
  List<Widget> _secondWidgets = List();

  ///第三组
  List<Widget> _thirdWidgets = List();

  ///第四组
  List<Widget> _fourthWidgets = List();

  @override
  void initState() {
    String jsonStr =
        '{"first":[{"iconUrl":"http://pic.90sjimg.com/design/01/40/91/47/58fab48998d6e.png","iconText":"账户","endTextUp":"8.00","endTextDown":"已购32本书"},{"iconUrl":"http://pic.90sjimg.com/design/01/40/91/47/58fab48998d6e.png","iconText":"无限卡·免费试用","endTextUp":"还剩26天","endTextDown":"累计节省151.71元"}],"second":[{"iconUrl":"http://pic.90sjimg.com/design/01/40/91/47/58fab48998d6e.png","iconText":"读数排行版","endTextUp":"第2名","endTextDown":"3小时20分钟"},{"iconUrl":"http://pic.90sjimg.com/design/01/40/91/47/58fab48998d6e.png","iconText":"关注","endTextUp":"61人关注我","endTextDown":"已关注58人"},{"iconUrl":"http://pic.90sjimg.com/design/01/40/91/47/58fab48998d6e.png","iconText":"读数小队","endTextUp":"3人成队","endTextDown":"共攒积分得大奖"}],"third":[{"iconUrl":"http://pic.90sjimg.com/design/01/40/91/47/58fab48998d6e.png","iconText":"每日一答","endTextUp":"通关10次","endTextDown":"获得8天无限卡"}],"fourth":[{"iconUrl":"http://pic.90sjimg.com/design/01/40/91/47/58fab48998d6e.png","iconText":"阅读记录","endTextUp":"88个","endTextDown":"赞过10次"},{"iconUrl":"http://pic.90sjimg.com/design/01/40/91/47/58fab48998d6e.png","iconText":"笔记","endTextUp":"10个","endTextDown":"10个赞8个评论"},{"iconUrl":"http://pic.90sjimg.com/design/01/40/91/47/58fab48998d6e.png","iconText":"书单","endTextUp":"1个"}]}';
    _data = json.decode(jsonStr);

    //第一组
    List<dynamic> firstDatas = _data['first'];
    _firstWidgets = firstDatas.map((data) {
      MineItem item = MineItem.fromJson(data);
      MineItemWidget widget = MineItemWidget(
        iconUrl: item.iconUrl,
        iconText: item.iconText,
        endTextUp: item.endTextUp,
        endTextDown: item.endTextDown,
      );
      return widget;
    }).toList();

    //第二组
    List<dynamic> secondDatas = _data['second'];
    _secondWidgets = secondDatas.map((data) {
      MineItem item = MineItem.fromJson(data);
      MineItemWidget widget = MineItemWidget(
        iconUrl: item.iconUrl,
        iconText: item.iconText,
        endTextUp: item.endTextUp,
        endTextDown: item.endTextDown,
      );
      return widget;
    }).toList();

    //第三组
    List<dynamic> thirdDatas = _data['third'];
    _thirdWidgets = thirdDatas.map((data) {
      MineItem item = MineItem.fromJson(data);
      MineItemWidget widget = MineItemWidget(
        iconUrl: item.iconUrl,
        iconText: item.iconText,
        endTextUp: item.endTextUp,
        endTextDown: item.endTextDown,
      );
      return widget;
    }).toList();

    ///第四组
    List<dynamic> fourthDatas = _data['fourth'];
    _fourthWidgets = fourthDatas.map((data) {
      MineItem item = MineItem.fromJson(data);
      MineItemWidget widget = MineItemWidget(
        iconUrl: item.iconUrl,
        iconText: item.iconText,
        endTextUp: item.endTextUp,
        endTextDown: item.endTextDown,
      );
      return widget;
    }).toList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColor.color1c1c1e,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: IconTextWidget(
                    text: '6',
                    icon: Icon(
                      Icons.email,
                      size: 25,
                      color: CommonColor.color8b8b8d,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 25),
                  child: Icon(
                    Icons.settings,
                    size: 25,
                    color: CommonColor.color8b8b8d,
                  ),
                )
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    _buildHeader(),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                    ),
                    _buildDivider(),
                    Column(
                      children: _firstWidgets,
                    ),
                    _buildDivider(),
                    Column(
                      children: _secondWidgets,
                    ),
                    _buildDivider(),
                    Column(
                      children: _thirdWidgets,
                    ),
                    _buildDivider(),
                    Column(
                      children: _fourthWidgets,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  ///分隔符
  _buildDivider() {
    return Container(
      height: 5,
      width: double.infinity,
      color: CommonColor.color01,
    );
  }

  ///构建头部
  _buildHeader() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 5),
        ),
        CircleAvatar(
          radius: 40,
          child: ClipOval(
            child: Image.asset(
              'images/icon_head_image.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 15),
        ),
        Text('周杰伦', style: TextStyle(fontSize: 18, color: Colors.white)),
        Padding(
          padding: EdgeInsets.only(top: 10),
        ),
        Text('编辑个人资料',
            style: TextStyle(fontSize: 12, color: CommonColor.color8b8b8d)),
      ],
    );
  }
}
