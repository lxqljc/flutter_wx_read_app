/// User: luoxiaoquan
/// Date: 2020-01-12
/// description:我的-选项
class MineItem {
  String iconUrl;
  String iconText;
  String endTextUp;
  String endTextDown;

  MineItem({this.iconUrl, this.iconText, this.endTextUp, this.endTextDown});

  MineItem.fromJson(Map<String, dynamic> json) {
    iconUrl = json['iconUrl'];
    iconText = json['iconText'];
    endTextUp = json['endTextUp'];
    endTextDown = json['endTextDown'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iconUrl'] = this.iconUrl;
    data['iconText'] = this.iconText;
    data['endTextUp'] = this.endTextUp;
    data['endTextDown'] = this.endTextDown;
    return data;
  }
}
