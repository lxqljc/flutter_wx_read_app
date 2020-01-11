/// User: luoxiaoquan
/// Date: 2020-01-11
/// description: 书架item
class BookItem {
  String imageUrl;
  String bookName;

  BookItem({this.imageUrl, this.bookName});

  BookItem.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    bookName = json['bookName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    data['bookName'] = this.bookName;
    return data;
  }
}
