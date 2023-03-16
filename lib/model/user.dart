class User {
  String name;
  String email;
  String mobile;

  User(this.name, this.email, this.mobile);

  factory User.fromJson(dynamic json) {
    return User(json['name'] as String, json['email'] as String,
        json['mobile'] as String);
  }

  @override
  String toString() {
    return '{ ${this.name}, ${this.email},${this.mobile} }';
  }
}
