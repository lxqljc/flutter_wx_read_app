/// User: luoxiaoquan
/// Date: 2020-01-11
/// description: 发现页面-第二种样式
class DiscoverItem1 {
  int type;
  String title;
  String desc;
  List<String> books;
  String clickText;

  DiscoverItem1({this.type, this.title, this.desc, this.books, this.clickText});

  DiscoverItem1.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    title = json['title'];
    desc = json['desc'];
    books = json['books'].cast<String>();
    clickText = json['clickText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['title'] = this.title;
    data['desc'] = this.desc;
    data['books'] = this.books;
    data['clickText'] = this.clickText;
    return data;
  }
}
