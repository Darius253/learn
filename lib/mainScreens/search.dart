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
  final TextEditingController searchController = TextEditingController();

  List subjects = [];
  List filteredSubjects = [];
  String searchText = '';

  Widget subjectList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirestoreService.subjectsCollection.snapshots(),
      builder: (context, snapshot) {
        return (snapshot.connectionState == ConnectionState.waiting
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var subject =
                      snapshot.data!.docs[index].data() as Map<String, dynamic>;
                  if (subject['about']
                      .toString()
                      .toLowerCase()
                      .contains(searchText.toLowerCase())) {
                    return ListTile(
                      onTap: (() => Get.to(
                            () => SubjectDetails(
                              formname: subject['form'],
                              image: subject['image'],
                              about: subject['about'],
                              name: subject['name'],
                            ),
                          )),
                      title: Text(subject['name']),
                      trailing: const Text('Tap Here',
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                              color: Color.fromARGB(255, 44, 30, 236))),
                    );
                  }
                  return const SizedBox.shrink();
                }));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchBar(),
      body: searchText.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: StreamBuilder<QuerySnapshot>(
                stream: FirestoreService.subjectsCollection.snapshots(),
                builder: (context, snapshot) {
                  return (snapshot.connectionState == ConnectionState.waiting
                      ? const Center(
                          child: CircularProgressIndicator.adaptive(),
                        )
                      : ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            var subject = snapshot.data!.docs[index].data()
                                as Map<String, dynamic>;
                            if (subject['about']
                                    .toString()
                                    .toLowerCase()
                                    .contains(searchText.toLowerCase()) ||
                                subject['name']
                                    .toString()
                                    .toLowerCase()
                                    .contains(searchText.toLowerCase())) {
                              return Card(
                                elevation: 2.0,
                                shadowColor:
                                    const Color.fromARGB(255, 77, 75, 75),
                                child: ListTile(
                                  onTap: (() => Get.to(
                                        () => SubjectDetails(
                                          formname: '${subject['form']} '
                                              ' ${subject['name']}',
                                          image: subject['image'],
                                          about: subject['about'],
                                          name: subject['id'],
                                        ),
                                      )),
                                  title: Text(subject['name']),
                                  trailing: const Text('Tap Here',
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 44, 30, 236))),
                                ),
                              );
                            }
                            return const SizedBox.shrink();
                          }));
                },
              ),
            )
          : const Center(
              child: Text('Try Searching for a Subject'),
            ),
    );
  }

  AppBar searchBar() {
    return AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.white,
        actions: [
          KeyboardDismisser(
            gestures: const [
              GestureType.onPanDown,
              GestureType.onPanUpdateDownDirection
            ],
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                child: TextField(
                    controller: searchController,
                    onChanged: (value) {
                      setState(() {
                        value = searchController.text;
                        searchText = value;
                      });
                    },
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
              ),
            ),
          )
        ]);
  }
}
