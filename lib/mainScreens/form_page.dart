import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../shared/exports.dart';
import '../widgets/images.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            title: const Text(
              'Junior High',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400),
            ),
            leading: IconButton(
              icon: const Icon(CupertinoIcons.back, color: Colors.black),
              onPressed: () => Get.back(),
            )),
        body: Container(
            padding: const EdgeInsets.all(12.0),
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 2.0,
                  mainAxisSpacing: 2.0),
              children: [
                SubjectCard(
                  name: 'JHS 1',
                  image: Images.junior,
                  onTap: () => Get.to(() => const JHSCourses(
                        formname: 'JHS 1',
                      )),
                ),
                SubjectCard(
                  name: 'JHS 2',
                  image: Images.junior2,
                  onTap: () => Get.to(() => const JHSCourses(
                        formname: 'JHS 2',
                        
                      )),
                ),
                SubjectCard(
                  name: 'JHS 3',
                  image: Images.junior3,
                  onTap: () => Get.to(() => const JHSCourses(
                        formname: 'JHS 3',
                      )),
                ),
              ],
            )));
  }
}
