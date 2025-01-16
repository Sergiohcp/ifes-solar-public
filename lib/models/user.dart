class User {
  int id;
  String name;
  String email;
  String phone;

  User({
    this.id = 0,
    this.name = "",
    this.email = "",
    this.phone = "",
  });

  factory User.createUser(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? 0,
      name: map['username'] ?? "",
      email: map['email'] ?? "",
    );
  }
}
