import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../shared/exports.dart';

class ShsPage extends StatefulWidget {
  const ShsPage({super.key});

  @override
  State<ShsPage> createState() => _ShsPageState();
}

class _ShsPageState extends State<ShsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            title: const Text(
              'Senior High',
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
                  name: 'SHS 1',
                  image: Images.senior,
                  onTap: () => Get.to(() => const SHSCourses(
                        formname: 'SHS 1',
                      )),
                ),
                SubjectCard(
                  name: 'SHS 2',
                  image: Images.senior2,
                  onTap: () => Get.to(() => const SHSCourses(
                        formname: 'SHS 2',
                      )),
                ),
                SubjectCard(
                  name: 'SHS 3',
                  image: Images.senior3,
                  onTap: () => Get.to(() => const SHSCourses(
                        formname: 'SHS 3',
                      )),
                ),
              ],
            )));
  }
}
