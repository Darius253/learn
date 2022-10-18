import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

final cnameController = TextEditingController();
final cimageController = TextEditingController();
final cbranController = TextEditingController();
final cartController = TextEditingController();
final cartNameController = TextEditingController();
final ccharpController = TextEditingController();
final secTitleController = TextEditingController();
final contentController = TextEditingController();

addDataWidget(BuildContext, context) {

  final double height = MediaQuery.of(context).size.height;
  final double width = MediaQuery.of(context).size.width;

  return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      context: context,
      builder: (context) {
        return SizedBox(
          height: height * 0.75,
          width: width * MediaQuery.of(context).size.width - 30,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                    child: Text(
                      'Upload a Subject',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  TextField(
                    controller: cnameController,
                    style: const TextStyle(
                      height: 2.0,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Subject Name',
                      fillColor: const Color(0xFFF8F8F3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  //TODO: Make it an image/file picker
                  SizedBox(height: height * 0.03),
                  DottedBorder(
                    radius: const Radius.circular(10),
                    color: Colors.black,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 40,
                      height: 120,
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add,
                          color: Colors.black38,
                        ),
                        label: const Text(
                          'Select File',
                          style: TextStyle(color: Colors.black38, fontSize: 20),
                        ),
                        style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                          color: Colors.transparent,
                        )),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  TextField(
                    controller: cbranController,
                    style: const TextStyle(
                      height: 2.0,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Class',
                      fillColor: const Color(0xFFF8F8F3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  TextField(
                    controller: cartController,
                    style: const TextStyle(
                      height: 2.0,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Type of School',
                      fillColor: const Color(0xFFF8F8F3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  TextFormField(
                    controller: contentController,
                    maxLines: 8,
                    maxLength: 1000,
                    keyboardType: TextInputType.multiline,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                      hintText: 'About the Subject',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  ElevatedButton.icon(
                    onPressed: () {},
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
          ),
        );
      });
}
