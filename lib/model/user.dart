class User {
  String _id;
  bool _online;
  String _token;
  String _email;
  String _username;
  String _password;
  String _avatar;
  String _name;
  String _createdAt;

  User(
      {String id,
      bool online,
      String token,
      String email,
      String username,
      String password,
      String avatar,
      String name,
      String createdAt}) {
    this._id = id;
    this._online = online;
    this._token = token;
    this._email = email;
    this._username = username;
    this._password = password;
    this._avatar = avatar;
    this._name = name;
    this._createdAt = createdAt;
  }

  String get id => _id;
  set id(String id) => _id = id;
  bool get online => _online;
  set online(bool online) => _online = online;
  String get token => _token;
  set token(String token) => _token = token;
  String get email => _email;
  set email(String email) => _email = email;
  String get username => _username;
  set username(String username) => _username = username;
  String get password => _password;
  set password(String password) => _password = password;
  String get avatar => _avatar;
  set avatar(String avatar) => _avatar = avatar;
  String get name => _name;
  set name(String name) => _name = name;
  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;

  User.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _online = json['online'];
    _token = json['token'];
    _email = json['email'];
    _username = json['username'];
    _password = json['password'];
    _avatar = json['avatar'];
    _name = json['name'];
    _createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['online'] = this._online;
    data['token'] = this._token;
    data['email'] = this._email;
    data['username'] = this._username;
    data['password'] = this._password;
    data['avatar'] = this._avatar;
    data['name'] = this._name;
    data['createdAt'] = this._createdAt;
    return data;
  }
}
