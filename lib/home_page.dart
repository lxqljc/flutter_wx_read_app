import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wx_read_app/common/common_color.dart';
import 'package:wx_read_app/page/story_page.dart';
import 'package:wx_read_app/page/discover_page.dart';
import 'package:wx_read_app/page/mine_page.dart';
import 'package:wx_read_app/page/book_page.dart';

/// User: lxqljc
/// Date: 2020-01-10
/// description: 首页
class HomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  ///当前tab选中位置
  int _tabIndex = 0;

  ///四个页面
  List<Widget> _pageList;

  @override
  void initState() {
    super.initState();
    _pageList = [DiscoverPage(), BookPage(), StoryPage(), MinePage()];
  }

  @override
  Widget build(BuildContext context) {
    //设置状态栏颜色字体
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarBrightness: Brightness.dark));
    return Scaffold(
        backgroundColor: CommonColor.color01,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: CommonColor.color151517,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: _getIcon(0), title: _getIconText(0)),
            BottomNavigationBarItem(icon: _getIcon(1), title: _getIconText(1)),
            BottomNavigationBarItem(icon: _getIcon(2), title: _getIconText(2)),
            BottomNavigationBarItem(icon: _getIcon(3), title: _getIconText(3)),
          ],
          //默认选中首页
          currentIndex: _tabIndex,
          onTap: (index) {
            setState(() {
              _tabIndex = index;
            });
          },
        ),
        body: _pageList[_tabIndex]);
  }

  ///获取iconText
  _getIconText(int position) {
    String name;
    switch (position) {
      case 0:
        //发现
        name = '发现';
        break;
      case 1:
        //书架
        name = '书架';
        break;
      case 2:
        //故事
        name = '故事';
        break;
      case 3:
        //我
        name = '我';
        break;
    }
    //当前iconText是否被选中
    bool isActive = (position == _tabIndex);
    Color color = isActive ? Colors.blue : CommonColor.color8b8b8d;
    return Text(
      name,
      style: TextStyle(fontSize: 14, color: color),
    );
  }

  ///获取icon
  _getIcon(int position) {
    String name;
    switch (position) {
      case 0:
        //发现
        name = 'images/icon_discover.png';
        break;
      case 1:
        //书架
        name = 'images/icon_book.png';
        break;
      case 2:
        //故事
        name = 'images/icon_story.png';
        break;
      case 3:
        //我
        name = 'images/icon_mine.png';
        break;
    }
    //当前icon是否被选中
    bool isActive = (position == _tabIndex);
    Color color = isActive ? Colors.blue : CommonColor.color8b8b8d;
    return Image.asset(
      name,
      width: 30.0,
      height: 30.0,
      color: color,
      fit: BoxFit.cover,
    );
  }
}
