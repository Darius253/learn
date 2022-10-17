import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../shared/exports.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _authService = AuthService();
  late int _pageIndex = 0;
  final PageController _pageController = PageController();
  final List<Widget> _pages = [
    const Home(),
    const Search(),
    const Discover(),
    const Settings(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: const Color.fromARGB(202, 229, 229, 229),
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  snap: true,
                  pinned: false,
                  floating: true,
                  flexibleSpace: const FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text("Learn",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                        )),
                  ), //FlexibleSpaceBar
                  expandedHeight: 100,
                  backgroundColor: const Color.fromARGB(255, 250, 250, 250),
                  leading: Builder(
                      builder: (context) => IconButton(
                          icon: const Icon(
                            Icons.menu,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          })),
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
              ];
            },
            body: _pages[_pageIndex]),
        drawer: Drawer(
            backgroundColor: const Color.fromARGB(248, 32, 91, 146),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 1.0,
                sigmaY: 1.0,
              ),
              child: SafeArea(
                child: Column(children: [
                  const Text(
                    'Learn',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'Poppins'),
                  ),
                  SizedBox(
                    height: height * 0.070,
                  ),
                  InkWell(
                    onTap: () async {
                      setState(() {
                        _pageIndex = 0;
                      });
                      await Future.delayed(
                        const Duration(milliseconds: 300),
                      );
                      Get.back();
                    },
                    child: const ListTile(
                      leading: Icon(
                        CupertinoIcons.home,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Home',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      setState(() {
                        _pageIndex = 1;
                      });
                      await Future.delayed(
                        const Duration(milliseconds: 300),
                      );
                      Get.back();
                    },
                    child: const ListTile(
                      leading: Icon(
                        CupertinoIcons.search,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Search',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      setState(() {
                        _pageIndex = 2;
                      });
                      await Future.delayed(
                        const Duration(milliseconds: 300),
                      );
                      Get.back();
                    },
                    child: const ListTile(
                      leading: Icon(
                        CupertinoIcons.square_stack_3d_down_right,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Discover',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      setState(() {
                        _pageIndex = 3;
                      });
                      await Future.delayed(
                        const Duration(milliseconds: 300),
                      );
                      Get.back();
                    },
                    child: const ListTile(
                      leading: Icon(
                        CupertinoIcons.settings,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Settings',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {},
                    child: const ListTile(
                      leading: Icon(
                        CupertinoIcons.headphones,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Help & Support',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.3,
                  ),
                  InkWell(
                    onTap: () async {
                      _showMyDialog();
                    },
                    child: const ListTile(
                      leading: Icon(
                        Icons.logout_sharp,
                        color: Colors.red,
                      ),
                      title: Text(
                        'LogOut',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            )));
  }

  Future<void> _showMyDialog() async => showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Create an Account'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Do you wish Sign Out? '),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  'Yes ',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                ),
                onPressed: () {
                  _authService.signOut();
                  Navigator.pop(context);
                },
              ),
              TextButton(
                  child: const Text(
                    'No ',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                  ),
                  onPressed: () => Navigator.pop(context))
            ],
          );
        },
      );
}
