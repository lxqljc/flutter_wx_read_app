/// User: luoxiaoquan
/// Date: 2020-01-11
/// description: 发现页面-第三种样式
class DiscoverItem2 {
  int type;
  String bookName;
  String author;
  String imageUrl;
  String reader;
  String readerImage;
  bool isLike;

  DiscoverItem2(
      {this.type,
      this.bookName,
      this.author,
      this.imageUrl,
      this.reader,
      this.readerImage,
      this.isLike});

  DiscoverItem2.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    bookName = json['bookName'];
    author = json['author'];
    imageUrl = json['imageUrl'];
    reader = json['reader'];
    readerImage = json['readerImage'];
    isLike = json['isLike'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['bookName'] = this.bookName;
    data['author'] = this.author;
    data['imageUrl'] = this.imageUrl;
    data['reader'] = this.reader;
    data['readerImage'] = this.readerImage;
    data['isLike'] = this.isLike;
    return data;
  }
}
