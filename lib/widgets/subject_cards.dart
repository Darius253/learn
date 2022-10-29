import 'package:flutter/material.dart';

class SubjectCard extends StatelessWidget {
  final String image;
  final String name;
  final VoidCallback onTap;
  const SubjectCard(
      {Key? key, required this.name, required this.image, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Card(
          color: const Color.fromARGB(248, 32, 91, 146),
          elevation: 2.0,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: Container(
                    color: Colors.grey,
                    child: Image.network(
                      image,
                      fit: BoxFit.fill,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: height * 0.045,
                  color: const Color.fromARGB(248, 32, 91, 146),
                  child: Center(
                      child: Text(
                    name,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      height: 2,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  )),
                ),
              ),
            ],
          )),
    );
  }
}
