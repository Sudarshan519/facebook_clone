class Post {
  String _createdAt;
  String _title;
  String _content;
  String _image;
  int _likes;
  int _comments;
  int _share;
  String _postedBy;
  String _userImage;
  String _id;

  Post(
      {String createdAt,
      String title,
      String content,
      String image,
      int likes,
      int comments,
      int share,
      String postedBy,
      String userImage,
      String id}) {
    this._createdAt = createdAt;
    this._title = title;
    this._content = content;
    this._image = image;
    this._likes = likes;
    this._comments = comments;
    this._share = share;
    this._postedBy = postedBy;
    this._userImage = userImage;
    this._id = id;
  }

  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;
  String get title => _title;
  set title(String title) => _title = title;
  String get content => _content;
  set content(String content) => _content = content;
  String get image => _image;
  set image(String image) => _image = image;
  int get likes => _likes;
  set likes(int likes) => _likes = likes;
  int get comments => _comments;
  set comments(int comments) => _comments = comments;
  int get share => _share;
  set share(int share) => _share = share;
  String get postedBy => _postedBy;
  set postedBy(String postedBy) => _postedBy = postedBy;
  String get userImage => _userImage;
  set userImage(String userImage) => _userImage = userImage;
  String get id => _id;
  set id(String id) => _id = id;

  Post.fromJson(Map<String, dynamic> json) {
    _createdAt = json['createdAt'];
    _title = json['title'];
    _content = json['content'];
    _image = json['image'];
    _likes = json['likes'];
    _comments = json['comments'];
    _share = json['share'];
    _postedBy = json['postedBy'];
    _userImage = json['userImage'];
    _id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this._createdAt;
    data['title'] = this._title;
    data['content'] = this._content;
    data['image'] = this._image;
    data['likes'] = this._likes;
    data['comments'] = this._comments;
    data['share'] = this._share;
    data['postedBy'] = this._postedBy;
    data['userImage'] = this._userImage;
    data['id'] = this._id;
    return data;
  }
}
