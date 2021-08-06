class Stories {
  String _id;
  String _image;
  String _avatar;
  String _name;
  String _createdAt;

  Stories(
      {String id, String image, String avatar, String name, String createdAt}) {
    this._id = id;
    this._image = image;
    this._avatar = avatar;
    this._name = name;
    this._createdAt = createdAt;
  }

  String get id => _id;
  set id(String id) => _id = id;
  String get image => _image;
  set image(String image) => _image = image;
  String get avatar => _avatar;
  set avatar(String avatar) => _avatar = avatar;
  String get name => _name;
  set name(String name) => _name = name;
  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;

  Stories.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _image = json['image'];
    _avatar = json['avatar'];
    _name = json['name'];
    _createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['image'] = this._image;
    data['avatar'] = this._avatar;
    data['name'] = this._name;
    data['createdAt'] = this._createdAt;
    return data;
  }
}
