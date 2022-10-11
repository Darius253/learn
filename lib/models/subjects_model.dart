class Subject {
  final String? subjectID;
  final String? name;
  final String? about;
  final String? image;
  final String? school;
  final String? form;

  Subject(
      {this.about,
      this.image,
      this.name,
      this.subjectID,
      this.school,
      this.form});

  factory Subject.fromDocument(var documentSnapshot) {
    return Subject(
      name: (documentSnapshot.data())['name'],
      image: (documentSnapshot.data())['image'],
      about: (documentSnapshot.data())['about'],
      subjectID: (documentSnapshot.data())['subjectID'],
      school: (documentSnapshot.data())['school'],
      form: (documentSnapshot.data())['form'],
    );
  }

  static Subject fromMap(Map<String, dynamic> map) {
    return Subject(
        name: map['name'],
        image: map['image'],
        about: map['about'],
        school: map['school'],
        form: map['form'],
        subjectID: map['subjectID']);
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'name': name,
      'image': image,
      'about': about,
      'subjectID': subjectID,
      'school': school,
      'form': form,
    };
    return map;
  }
}
