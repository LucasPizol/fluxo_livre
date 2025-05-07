class User {
  final int? _id;
  String name;
  String email;
  final String _password;

  User({
    int? id,
    required String password,
    required this.name,
    required this.email,
  })  : _id = id,
        _password = password;

  int? get id => _id;
  String get password => _password;

  Map<String, dynamic> toJson() {
    return {"id": _id, "name": name, "email": email, "password": _password};
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        password: json['password']);
  }
}
