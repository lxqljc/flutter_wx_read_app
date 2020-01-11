/// User: luoxiaoquan
/// Date: 2020-01-11
/// description: 故事列表，第二种样式
class StoryItem2 {
  int type;
  String title;
  String desc;
  String bookName;
  String author;
  String readCount;
  String imageUrl;

  StoryItem2(
      {this.type,
        this.title,
        this.desc,
        this.bookName,
        this.author,
        this.readCount,
        this.imageUrl});

  StoryItem2.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    title = json['title'];
    desc = json['desc'];
    bookName = json['bookName'];
    author = json['author'];
    readCount = json['readCount'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['title'] = this.title;
    data['desc'] = this.desc;
    data['bookName'] = this.bookName;
    data['author'] = this.author;
    data['readCount'] = this.readCount;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}
