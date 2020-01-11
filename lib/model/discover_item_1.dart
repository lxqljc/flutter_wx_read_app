/// User: luoxiaoquan
/// Date: 2020-01-11
/// description: 发现页-第一种样式
class DiscoverItem1 {
  int type;
  String title;
  String desc;
  List<Books> books;
  String buttonText;

  DiscoverItem1({this.title, this.desc, this.books, this.buttonText});

  DiscoverItem1.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    desc = json['desc'];
    type = json['type'];
    if (json['books'] != null) {
      books = new List<Books>();
      json['books'].forEach((v) {
        books.add(new Books.fromJson(v));
      });
    }
    buttonText = json['buttonText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['desc'] = this.desc;
    data['type'] = this.type;
    if (this.books != null) {
      data['books'] = this.books.map((v) => v.toJson()).toList();
    }
    data['buttonText'] = this.buttonText;
    return data;
  }
}

class Books {
  String imageUrl;
  String price;
  String bookName;
  String author;

  Books({this.imageUrl, this.price, this.bookName, this.author});

  Books.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    price = json['price'];
    bookName = json['bookName'];
    author = json['author'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    data['price'] = this.price;
    data['bookName'] = this.bookName;
    data['author'] = this.author;
    return data;
  }
}
