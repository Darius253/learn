import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../shared/exports.dart';

class SubjectDetails extends StatefulWidget {
  final String formname;
  const SubjectDetails({Key? key, required this.formname}) : super(key: key);

  @override
  State<SubjectDetails> createState() => _SubjectDetailsState();
}

class _SubjectDetailsState extends State<SubjectDetails> {
  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(CupertinoIcons.back, color: Colors.black),
            onPressed: () => Get.back(),
          )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
             Text(
              widget.formname,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: width,
              height: height * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Colors.grey,
              ),
              child: const Center(
                child: Text('Image'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'What you will learn',
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected = true;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                          color: isSelected ? Colors.transparent : Colors.grey,
                          width: 3),
                      color: isSelected
                          ? const Color.fromARGB(253, 32, 91, 146)
                          : Colors.white,
                    ),
                    child: Text(
                      'Information',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          color: isSelected ? Colors.white : Colors.black),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected = false;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: !isSelected ? Colors.transparent : Colors.grey,
                          width: 3),
                      color: !isSelected
                          ? const Color.fromARGB(253, 32, 91, 146)
                          : Colors.white,
                    ),
                    child: Text(
                      'Content',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          color: !isSelected ? Colors.white : Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            infoContents(),
          ]),
        ),
      ),
    );
  }

  Widget infoContents() {
    return isSelected
        ? const Text(
            '''IBM is the second-largest Predictive, consectetur adipiscing elit. Sit turpis egestas aenean amet ac rhoncus vitae tristique. A sed magna vitae nullam. Accumsan ullamcorper amet congue fermentum egestas purus molestie nam. Dolor, dictumst mauris vestibulum vehicula vel cras. Pellentesque nam congue auctor dolor mattis erat. Pharetra feugiat in justo purus dolor feugiat ultrices. 

Pretium at parturient curabitur eget nunc pharetra. Vitae pharetra adipiscing purus faucibus bibendum. Ultrices mi tristique et enim pretium lacus, vivamus. Augue eget fermentum, mauris viverra. Tristique arcu ipsum risus a arcu pellentesque pharetra velit.

Neque, erat tristique volutpat faucibus mattis vulputate faucibus. Ut phasellus nulla at sociis est, turpis purus. Faucibus donec malesuada tristique quam commodo felis nulla.''',
            style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400),
          )
        : const Text('Contents');
  }
}
