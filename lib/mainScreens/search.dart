import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../services/database.dart';
import '../shared/exports.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  _SearchState() {
    searchController.addListener(() {
      if (searchController.text.isEmpty) {
        setState(() {
          searchText = "";
          filteredSubjects = subjects;
        });
      } else {
        setState(() {
          searchText = searchController.text;
        });
      }
    });
  }
  Widget buildSubjectList() {
    List tempList = [];
    List filteredSubjects = [];
    String searchText = '';
    List subjects = [];

    for (int i = 0; i < filteredSubjects.length; i++) {
      if ((filteredSubjects[i].name)
          .toLowerCase()
          .contains(searchText.toLowerCase())) {
        tempList.add(filteredSubjects[i]);
      }
    }

    filteredSubjects = tempList;

    return ListView.builder(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 20.0),
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: subjects == null ? 0 : filteredSubjects.length,
        itemBuilder: (BuildContext context, int index) {
          Subject subject = filteredSubjects[index];
          return FutureBuilder(
              future: FirestoreService.subjectsCollection
                  .where('about', isLessThanOrEqualTo: searchText)
                  .get(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
               
                return GestureDetector(
                    child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(subject.name!),
                        trailing: Container(
                          decoration:
                              const BoxDecoration(shape: BoxShape.rectangle),
                          child: const Text('Tap Here',
                              overflow: TextOverflow.clip,
                              style: TextStyle(color: Colors.green)),
                        )),
                    onTap: () => Get.to(() => SubjectDetails(
                        formname: subject.form!,
                        image: subject.image!,
                        about: subject.about!,
                        name: subject.name!)));
              });
        });
  }

  void fetchSubjects() async {
    // User snapshots
    List<QueryDocumentSnapshot> subjectSnapshots = await FirestoreService
        .subjectsCollection
        .where('name', isLessThanOrEqualTo: searchText)
        .get()
        .then((QuerySnapshot snapshot) {
      return snapshot.docs;
    });

    List tempList = [];

    for (DocumentSnapshot documentSnapshot in subjectSnapshots) {
      tempList.add(
          Subject.fromMap(documentSnapshot.data() as Map<String, dynamic>));
    }

    setState(() {
      subjects = tempList;
      filteredSubjects = subjects;
    });
  }

  final TextEditingController searchController = TextEditingController();

  List subjects = [];
  List filteredSubjects = [];
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SafeArea(
          child: Column(
            children: [
              KeyboardDismisser(
                gestures: const [
                  GestureType.onPanDown,
                  GestureType.onPanUpdateDownDirection
                ],
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.065,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            hintText: 'Search for Subjects',
                            border: InputBorder.none,
                            prefixIcon: const Icon(
                              CupertinoIcons.search,
                              color: Color.fromARGB(248, 32, 91, 146),
                            ),
                            suffix: searchController.text.isNotEmpty
                                ? IconButton(
                                    onPressed: () {
                                      searchController.clear();
                                    },
                                    icon: const Icon(
                                      CupertinoIcons.trash,
                                      color: Color.fromARGB(248, 32, 91, 146),
                                    ),
                                  )
                                : const SizedBox.shrink(),
                          )),
                    )),
              ),
              searchText.isNotEmpty && filteredSubjects.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: buildSubjectList(),
                    )
                  : const Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Center(
                        child: Text('Try Searching for a Subject'),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
