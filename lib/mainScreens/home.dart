import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn/widgets/card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              width: 300,
              height: 150,
            ),
            const SizedBox(
              height: 50,
            ),
            Row(children: [
              SchoolCard(
                school: 'Junior High',
                info: 'Tap Here to view all  Junior High School Subjects ',
                image: 'assets/images/junior.jpg',
                onTap: () {},
              ),
              const SizedBox(
                width: 20,
              ),
              SchoolCard(
                school: 'Senior High',
                info: 'Tap Here to view all  Senior High School Subjects ',
                image: 'assets/images/senior.jpg',
                onTap: () => ((() {})),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
