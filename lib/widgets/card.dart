import 'package:flutter/material.dart';

class SchoolCard extends StatelessWidget {
  final String image;
  final String school;
  final String info;
  final VoidCallback onTap;
  const SchoolCard(
      {Key? key,
      required this.image,
      required this.info,
      required this.school,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        width: width * 0.8,
        height: height * 0.5,
        child: Stack(children: [
          Container(
            color: const Color.fromARGB(248, 32, 91, 146),
            child: Column(children: [
              Expanded(
                  flex: 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(width * 0.02),
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                      width: width * 5,
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                    width: width * 0.8,
                    padding: const EdgeInsets.all(10.0),
                    color: const Color.fromARGB(253, 32, 91, 146),
                    child: Text(
                      info,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        height: 2,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ))
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                color: Colors.white,
                width: 150,
                height: 24,
                child: Text(school,
                    style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 15)),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
