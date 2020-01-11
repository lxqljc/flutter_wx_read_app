/// User: luoxiaoquan
/// Date: 2020-01-11
/// description: 故事-第一种样式实体
class StoryItem1 {
  String title;
  String desc;
  String imageUrl;

  StoryItem1({this.title, this.desc, this.imageUrl});

  StoryItem1.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    desc = json['desc'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['desc'] = this.desc;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}
