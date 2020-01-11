import 'package:flutter/material.dart';
import 'package:wx_read_app/widget/search_widget.dart';

/// User: luoxiaoquan
/// Date: 2020-01-11
/// description: 发现页面
class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
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
                itemCount: 20,
                controller: PageController(viewportFraction: 0.9),
                itemBuilder: (context, index) {
                  return Container(
                      margin: EdgeInsets.only(left: 10, right: 10,top: 20,bottom: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: index % 2 == 0 ? Colors.red : Colors.blue,
                      ));
                }),
          )
        ],
      ),
    );
  }
}
