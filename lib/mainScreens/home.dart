import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:learn/shared/exports.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(202, 229, 229, 229),
        body: CustomScrollView(slivers: <Widget>[
          SliverAppBar(
            snap: false,
            pinned: false,
            floating: false,
            flexibleSpace: const FlexibleSpaceBar(
              centerTitle: true,
              title: Text("Learn",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ) //TextStyle
                  ), //Text
            ), //FlexibleSpaceBar
            expandedHeight: 100,
            backgroundColor: const Color.fromARGB(255, 250, 250, 250),
            leading: IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: CircleAvatar(
                  child: Text(
                    'BA',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ]));
  }
}
