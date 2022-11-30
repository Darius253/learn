import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../shared/exports.dart';

class AdminHome extends StatefulWidget {
  final String? id;
  const AdminHome({super.key, this.id});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  bool isdelete = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (() => Get.off(() => const UploadingWidget())),
          child: const Icon(CupertinoIcons.add),
        ),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          actions: [
            TextButton.icon(
                onPressed: (() => AuthService().signOut()),
                icon: const Icon(
                  Icons.logout_sharp,
                  color: Colors.red,
                ),
                label: const Text('SignOut')),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: StreamBuilder<QuerySnapshot>(
                    stream: FirestoreService.subjectsCollection.snapshots(),
                    builder: (context, snapshot) {
                      return (snapshot.connectionState ==
                              ConnectionState.waiting
                          ? const Center(
                              child: CircularProgressIndicator.adaptive(),
                            )
                          : ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (BuildContext context, int index) {
                                var subject = snapshot.data!.docs[index].data()
                                    as Map<String, dynamic>;
                                return InkWell(
                                  onTap: (() {
                                    _showMyDialog();
                                    delete(snapshot, index);
                                  }),
                                  child: UploadedSubject(
                                    subjectname: '${subject['form']} '
                                        ' ${subject['name']}',
                                  ),
                                );
                              },
                            ));
                    }))));
  }

  Future delete(
      AsyncSnapshot<QuerySnapshot<Object?>> snapshot, int index) async {
    if (isdelete == true) {
      await FirebaseFirestore.instance
          .runTransaction((Transaction myTransaction) async {
        myTransaction.delete(snapshot.data!.docs[index].reference);
      });
      Get.snackbar('Succesful', 'Content Deleted',
          snackPosition: SnackPosition.BOTTOM);
    } else {
      return null;
    }
  }

  Future<void> _showMyDialog() async => showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Delete Content'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Proceed to Delete Content? '),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  'Yes ',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                ),
                onPressed: () async {
                  setState(() {
                    isdelete = true;
                  });
                  Navigator.pop(context);
                },
              ),
              TextButton(
                  child: const Text(
                    'No ',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                  ),
                  onPressed: () => Navigator.pop(context))
            ],
          );
        },
      );
}
