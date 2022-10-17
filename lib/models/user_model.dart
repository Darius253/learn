class Person {
  String? firstname;
  String? lastname;
  String? email;
  String? password;
  String? fullname;
  final String? id;

  Person({
    this.email,
    this.firstname,
    this.lastname,
    this.password,
    this.id,
    this.fullname,
  });

  factory Person.fromDocument(var documentSnapshot) {
    return Person(
        id: (documentSnapshot.data())['id'],
        firstname: (documentSnapshot.data())['firstname'],
        lastname: (documentSnapshot.data())['lastname'],
        email: (documentSnapshot.data())['email'],
        fullname: (documentSnapshot.data())['fullname'],
        password: (documentSnapshot.data())['password']);
  }

  static Person fromMap(Map<String, dynamic> map) {
    return Person(
        id: map['id'],
        email: map['email'],
        fullname: map['fullname'],
        firstname: map['firstname'],
        lastname: map['lastname']);
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'firstname': firstname,
      'email': email,
      'lastname': lastname,
       'fullname': fullname
    };
    return map;
  }
}
