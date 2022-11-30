import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../shared/exports.dart';

class ProfileSettings extends StatefulWidget {
  final String? currentUserId;
  const ProfileSettings({super.key, this.currentUserId});
  @override
  // ignore: library_private_types_in_public_api
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  AuthService authentication = AuthService();
  bool isLoading = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final String? currentUserId = AuthService().getCurrentUserID;
  final _formKey = GlobalKey<FormState>();

  String username = '';
  String email = ' ';
  @override
  void initState() {
    super.initState();
  }

  Widget buildNameFieldAndBio(Person person) {
    return Form(
      key: _formKey,
      child: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            
            TextFormField(
              maxLength: 20,
              initialValue: person.fullname,
              decoration: const InputDecoration(
                label: Text('Username'),
                border: OutlineInputBorder(),
              ),
              validator: (value) =>
                  value!.isEmpty ? ' Please Enter Username' : null,
              onChanged: (value) {
                setState(() => username = value.trim());
              },
            ),
            const SizedBox(height: 20,),
            TextFormField(
              initialValue: person.email,
              decoration: const InputDecoration(
                label: Text('Email'),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() => email = value.trim());
              },
            )
          ])),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: FutureBuilder<Person>(
            future: FirestoreService(uid: currentUserId).personFuture(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              }
              Person? person = snapshot.data;
              return ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: Column(
                      children: [
                        Container(child: buildNameFieldAndBio(person!)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 150,),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          side: const BorderSide(
                              color: Color.fromARGB(255, 44, 23, 233)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25))),
                      onPressed: () async {
                        updateProfile(context);
                      },
                      child: const SizedBox(
                          width: 200,
                          height: 50,
                          child: Center(
                              child: Text('Update Details',
                                  style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w600)))),
                    ),
                  ),
                ],
              );
            }));
  }

  Future updateProfile(BuildContext context) async {
    User? user;

    if (_formKey.currentState!.validate()) {
      Get.snackbar('Updating Details', 'Please Wait...',
          snackPosition: SnackPosition.BOTTOM);

      // update the url stored in firestore

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .update({
        'name': username,
        'email': email,
      }).then((value) {
        Navigator.pop(context);
      });
    }
  }
}
