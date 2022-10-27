import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import '../shared/exports.dart';

class PDFViewerPage extends StatefulWidget {
  final File file;
  final String name;

  const PDFViewerPage({
    Key? key,
    required this.file,
    required this.name,
  }) : super(key: key);

  @override
  State<PDFViewerPage> createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  late PDFViewController controller;
  int pages = 0;
  int indexPage = 0;
  

  @override
  Widget build(BuildContext context) {
    final text = '${indexPage + 1} of $pages';
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          widget.name,
          style: const TextStyle(
              color: Colors.black,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400),
        ),
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: Stack(
        children: [
          PDFView(
            filePath: widget.file.path,
            autoSpacing: true,
            // swipeHorizontal: true,
            // pageSnap: false,
            // pageFling: false,
            onRender: (pages) => setState(() => this.pages = pages!),
            onViewCreated: (controller) =>
                setState(() => this.controller = controller),
            onPageChanged: (indexPage, _) =>
                setState(() => this.indexPage = indexPage!),
          ),
          pages >= 2
              ? Padding(
                  padding: EdgeInsets.only(
                      top: height * 0.7),
                  child: Center(
                    child: Container(
                      height:height * 0.06,
                      width: width * 0.5,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(248, 32, 91, 146),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.chevron_left,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              final page =
                                  indexPage == 0 ? pages : indexPage - 1;
                              controller.setPage(page);
                            },
                          ),
                          Center(child: Text(text)),
                          IconButton(
                            icon: const Icon(
                              Icons.chevron_right,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              final page =
                                  indexPage == pages - 1 ? 0 : indexPage + 1;
                              controller.setPage(page);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
