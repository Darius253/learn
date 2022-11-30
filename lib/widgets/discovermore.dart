import 'package:flutter/material.dart';

class DiscoverMore extends StatelessWidget {
  final String info;
  final String url;
  const DiscoverMore({super.key, required this.info, required this.url});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shadowColor: const Color.fromARGB(255, 77, 75, 75),
      child: ListTile(
        title: Text(info),
        subtitle: Text(url),
      ),
    );
  }
}
