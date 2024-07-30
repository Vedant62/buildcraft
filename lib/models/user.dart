class User {
  const User({
    required this.name,
    required this.email,
  });

  final String name;
  final String email;

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'email': this.email,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      email: map['email'] as String,
    );
  }
}
