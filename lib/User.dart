class User {
  final String name;
  final String email;
  final String phone;
  final String affiliation;
  final String course_sector;
  final String role;
  final String password;

  User(
      {required this.name,
      required this.email,
      required this.phone,
      required this.affiliation,
      required this.course_sector,
      required this.role,
      required this.password});

  factory User.fromJosn(Map<String, dynamic> json) {
    return User(
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        affiliation: json['affiliation'],
        course_sector: json['course_sector'],
        role: json['role'],
        password: json['password']);
  }
  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'phone': phone,
        'affiliation': affiliation,
        'course_sector': course_sector,
        'role': role,
        'password': password
      };
}
