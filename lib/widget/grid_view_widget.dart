
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:wx_read_app/common/common_color.dart';

/// User: luoxiaoquan
/// Date: 2020-01-11
/// description: grid布局
class GridViewWidget extends StatelessWidget {
  ///数据源
  final List<GridData> datas;

  ///横轴个数
  final int crossAxisCount;

  ///纵轴间距
  final double mainAxisSpacing;

  ///横轴间距
  final double crossAxisSpacing;

  ///子组件宽高长度比
  final double childAspectRatio;

  final ScrollPhysics physics;

  const GridViewWidget(
      {Key key,
      this.datas = const [],
      this.crossAxisCount = 3,
      this.mainAxisSpacing = 0,
      this.crossAxisSpacing = 0,
      this.physics: const NeverScrollableScrollPhysics(),
      this.childAspectRatio = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: datas.length,
        shrinkWrap: true,
        physics: physics,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          ///横轴个数
          crossAxisCount: crossAxisCount,

          ///纵轴间距
          mainAxisSpacing: mainAxisSpacing,

          ///横轴间距
          crossAxisSpacing: crossAxisSpacing,

          ///子组件宽高长度比
          childAspectRatio: childAspectRatio,
        ),
        itemBuilder: (context, index) {
          return _buildItem(datas[index]);
        });
  }

  ///子布局样式
  Widget _buildItem(GridData data) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            CachedNetworkImage(
              width: data.width,
              fit: BoxFit.cover,
              imageUrl: data.imageUrl,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: data.width,
                color: Colors.black45,
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 2, top: 2, bottom: 2),
                  child: RichText(
                    text: TextSpan(
                        text: '原价 ',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                        children: <TextSpan>[
                          TextSpan(
                            text: data.price,
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                decoration: TextDecoration.lineThrough),
                          )
                        ]),
                  ),
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 8),
        ),
        Text(data.bookName,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(fontSize: 13, color: Colors.white)),
        Padding(
          padding: EdgeInsets.only(bottom: 5),
        ),
        Text(data.author,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(fontSize: 13, color: CommonColor.color8b8b8d)),
      ],
    );
  }
}

///定义数据
class GridData {
  ///图片地址
  String imageUrl;

  ///价格
  String price;

  ///书名
  String bookName;

  ///作者
  String author;

  ///图片宽度
  double width;

  ///图片高度
  double height;
}
