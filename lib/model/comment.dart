class Comment {
  String _id;
  int _likes;
  String _comment;
  String _avatar;
  String _name;
  String _createdAt;

  Comment(
      {String id,
      int likes,
      String comment,
      String avatar,
      String name,
      String createdAt}) {
    this._id = id;
    this._likes = likes;
    this._comment = comment;
    this._avatar = avatar;
    this._name = name;
    this._createdAt = createdAt;
  }

  String get id => _id;
  set id(String id) => _id = id;
  int get likes => _likes;
  set likes(int likes) => _likes = likes;
  String get comment => _comment;
  set comment(String comment) => _comment = comment;
  String get avatar => _avatar;
  set avatar(String avatar) => _avatar = avatar;
  String get name => _name;
  set name(String name) => _name = name;
  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;

  Comment.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _likes = json['likes'];
    _comment = json['comment'];
    _avatar = json['avatar'];
    _name = json['name'];
    _createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['likes'] = this._likes;
    data['comment'] = this._comment;
    data['avatar'] = this._avatar;
    data['name'] = this._name;
    data['createdAt'] = this._createdAt;
    return data;
  }
}
