import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../shared/exports.dart';

class UploadingWidget extends StatefulWidget {
  const UploadingWidget({super.key});

  @override
  State<UploadingWidget> createState() => _UploadingWidgetState();
}

class _UploadingWidgetState extends State<UploadingWidget> {
  final _dropdownFormKey = GlobalKey<FormState>();
  final _dropdown = GlobalKey<FormState>();
  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  String image = '';
  String dropdownItem = "Junior High";
  String selectedvalue = "JHS 1";
  final TextEditingController form = TextEditingController();
  final TextEditingController school = TextEditingController();
  final TextEditingController about = TextEditingController();
  final TextEditingController subjectname = TextEditingController();
  String file = "";
  List<String> schoolType = ['Junior High', 'Senior High'];
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "Junior High", child: Text("Junior High")),
      const DropdownMenuItem(value: "Senior High", child: Text("Senior High")),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get selectedvalues {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "JHS 1", child: Text("JHS 1")),
      const DropdownMenuItem(value: "JHS 2", child: Text("JHS 2")),
      const DropdownMenuItem(value: "JHS 3", child: Text("JHS 3")),
      const DropdownMenuItem(value: "SHS 1", child: Text("SHS 1")),
      const DropdownMenuItem(value: "SHS 2", child: Text("SHS 2")),
      const DropdownMenuItem(value: "SHS 3", child: Text("SHS 3")),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: const Icon(CupertinoIcons.back,
                                color: Colors.black),
                            onPressed: () =>
                                Get.offAll(() => const AdminHome()),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          const Text(
                            'Upload a Subject',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.03),
                    textfield(subjectname, 'Subject Name', 1),
                    SizedBox(height: height * 0.03),
                    DottedBorder(
                      radius: const Radius.circular(10),
                      color:
                          pickedFile != null ? Colors.redAccent : Colors.black,
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width - 40,
                          height: 120,
                          child: pickedFile != null
                              ? GestureDetector(
                                  onTap: () => selectFile(),
                                  child: Center(
                                    child: Text(
                                      pickedFile!.name,
                                      style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 14, 56, 194)),
                                    ),
                                  ),
                                )
                              : OutlinedButton.icon(
                                  onPressed: () {
                                    selectFile();
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.black38,
                                  ),
                                  label: const Text(
                                    'Select File',
                                    style: TextStyle(
                                        color: Colors.black38, fontSize: 20),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                      side: const BorderSide(
                                    color: Colors.transparent,
                                  )),
                                )),
                    ),
                    SizedBox(height: height * 0.03),
                    Form(
                        key: _dropdownFormKey,
                        child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.blue, width: 2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.blue, width: 2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            validator: (value) =>
                                value == null ? "Select School" : null,
                            dropdownColor:
                                const Color.fromARGB(255, 243, 245, 248),
                            value: dropdownItem,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownItem = newValue!;
                              });
                            },
                            items: dropdownItems)),
                    SizedBox(height: height * 0.03),
                    Form(
                        key: _dropdown,
                        child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.blue, width: 2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.blue, width: 2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            validator: (value) =>
                                value == null ? "Select School" : null,
                            dropdownColor:
                                const Color.fromARGB(255, 243, 245, 248),
                            value: selectedvalue,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedvalue = newValue!;
                              });
                            },
                            items: selectedvalues)),
                    SizedBox(height: height * 0.03),
                    textfield(about, 'About the Subject', 10),
                    SizedBox(height: height * 0.02),
                    ElevatedButton.icon(
                      onPressed: (() => uploadSubject()),
                      label: const Text("Add"),
                      icon: const Icon(Icons.add),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(120, 50),
                        textStyle: const TextStyle(fontSize: 20),
                        backgroundColor: const Color(0xFF0B3C5D),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }

  Future<void> selectFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform
          .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);

      if (result == null) return;

      setState(() {
        pickedFile = result.files.first;
      });
      Get.snackbar('Successful', 'File Selected');

      // User canceled the picker

    } on PlatformException catch (e) {
      Get.snackbar(
        'Unsupported operation',
        e.toString(),
      );
    }
  }

  Future uploadSubject() async {
    if (subjectname.text.contains('English')) {
      setState(() {
        image = Images.english;
      });
    } else if (subjectname.text.contains('Mathematics')) {
      setState(() {
        image = Images.maths;
      });
    } else if (subjectname.text.contains('Social Studies')) {
      setState(() {
        image = Images.socialStudies;
      });
    } else if (subjectname.text.contains('Science')) {
      setState(() {
        image = Images.science;
      });
    } else {
      setState(() {
        image = Images.image;
      });
    }

    if (subjectname.text.isNotEmpty &&
        dropdownItem.isNotEmpty &&
        pickedFile != null &&
        selectedvalue.isNotEmpty &&
        about.text.isNotEmpty) {
      Get.snackbar('Uploading Subject', 'Please Wait', isDismissible: false);
      if (pickedFile != null) {
        // upload subjects next

        await subjectUrl(
          file: File(pickedFile!.path!),
        ).then((url) {
          file = url;
        });
      }

      // then upload document to firestore
      Subject subject = Subject(
          name: subjectname.text,
          about: about.text,
          file: file,
          subjectID: pickedFile!.name,
          school: dropdownItem,
          image: image,
          form: selectedvalue);

      // FirestoreService instance
      FirestoreService firestoreService = FirestoreService();

      // Add Subjects to subjects collection
      await firestoreService.addSubjects(subject: subject);

      // Add this new post to the timeline of his followers

      FirestoreService.subjectsCollection.doc(subject.subjectID).set(
        {
          'name': subject.name,
          'about': subject.about,
          'file': file,
          'image': subject.image,
          'form': selectedvalue,
          'school': dropdownItem,
          'id': subject.subjectID,
        },
      ).then((value) {});

      Get.snackbar('Upload Done', 'Subject Uploaded');
      Get.offAll(() => AdminHome(
            id: subject.subjectID,
          ));
    } else {
      Get.snackbar('Upload failed', 'Try Again',
          backgroundColor: Colors.redAccent);
    }
  }

  Future<String> subjectUrl({
    required File file,
  }) async {
    String fileName = pickedFile!.name;
    final ref = FirebaseStorage.instance.ref().child('Subjects/$fileName');
    setState(() {
      uploadTask = ref.putFile(file);
    });
    final snapshot = await uploadTask!.whenComplete(() {});
    var downloadUrl = await snapshot.ref.getDownloadURL();
    var url = downloadUrl.toString();
    setState(() {
      uploadTask = null;
    });

    return url;
  }
}
