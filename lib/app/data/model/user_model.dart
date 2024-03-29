class User {
  String firstName;
  String lastName;
  String email;
  bool isMale;

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.isMale,
  });

  User.fromJson(Map<String, dynamic> json)
      : firstName = json['firstName'],
        lastName = json['lastName'],
        email = json['email'],
        isMale = json['isMale'];

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'isMale': isMale,
      };
}
