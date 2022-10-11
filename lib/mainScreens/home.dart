import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn/mainScreens/shs_courses.dart';
import 'package:learn/shared/exports.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          CupertinoIcons.search,
                          color: Color.fromARGB(248, 32, 91, 146),
                        ),
                        suffix: Icon(
                          CupertinoIcons.trash,
                          color: Color.fromARGB(248, 32, 91, 146),
                        )))),
          ),
          const SizedBox(
            height: 100,
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              SchoolCard(
                school: 'Junior High',
                info: 'Tap Here to view all  Junior High School Subjects ',
                image: 'assets/images/junior.jpg',
                onTap: () => Get.to(
                  () => const JHSCourses(),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              SchoolCard(
                school: 'Senior High',
                info: 'Tap Here to view all  Senior High School Subjects ',
                image: 'assets/images/senior.jpg',
                onTap: () => Get.to(
                  () => const SHSCourses(),
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
