import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn/mainScreens/pdf_page.dart';
import 'package:learn/services/file_viewer.dart';
import '../shared/exports.dart';

class SubjectDetails extends StatefulWidget {
  final String formname;
  final String about;
  final String name;
  final String image;

  const SubjectDetails(
      {Key? key,
      required this.formname,
      required this.image,
      required this.about,
      required this.name})
      : super(key: key);

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
              child: Image.network(
                widget.image,
                fit: BoxFit.fill,
                filterQuality: FilterQuality.high,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                },
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
        ? Text(
            widget.about,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400),
          )
        : GestureDetector(
            onTap: () async {
              Get.snackbar('Please Wait ', 'The document is loading ',
                  snackPosition: SnackPosition.BOTTOM);
              final url = 'Subjects/${widget.name}';
              final file = await PDFApi.loadFirebase(url);
              if (file == null) return;

              Get.to(() => PDFViewerPage(file: file, name: widget.name));
            },
            child: Text(
              widget.name,
              style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400),
            ),
          );
  }
}
