/// User: luoxiaoquan
/// Date: 2020-01-11
/// description: 书架item
class BookItem {
  String imageUrl;
  String bookName;
  ///最近阅读时间
  String recentTime;

  BookItem({this.imageUrl, this.bookName});

  BookItem.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    bookName = json['bookName'];
    recentTime = json['recentTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    data['bookName'] = this.bookName;
    data['recentTime'] = this.recentTime;
    return data;
  }
}
