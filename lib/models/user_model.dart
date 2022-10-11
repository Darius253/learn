class Person {
  String? firstname;
  String? lastname;
  String? email;
  String? password;
  final String? id;

  Person({
    this.email,
    this.firstname,
    this.lastname,
    this.password,
    this.id,
  });

  factory Person.fromDocument(var documentSnapshot) {
    return Person(
        id: (documentSnapshot.data())['id'],
        firstname: (documentSnapshot.data())['firstname'],
        lastname: (documentSnapshot.data())['lastname'],
        email: (documentSnapshot.data())['email'],
        password: (documentSnapshot.data())['password']);
  }

  static Person fromMap(Map<String, dynamic> map) {
    return Person(
        id: map['id'],
        email: map['email'],
        firstname: map['firstname'],
        lastname: map['lastname']);
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'firstname': firstname,
      'email': email,
      'lastname': lastname
    };
    return map;
  }
}
