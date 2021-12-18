class User {
  late int id;
  late String nickName;

  User(this.id, this.nickName);

  User.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    nickName = data['nick'];
  }

}