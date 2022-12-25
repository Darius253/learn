import 'dart:developer';
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
  String username = '';
  int _pageIndex = 0;
  Person persondata = Person();
  final String? currentUserId = AuthService().getCurrentUserID;
  String userInitial = '';
  final PageController _pageController = PageController();
  final List<Widget> _pages = [
    const Home(),
    const Search(),
    const Discover(),
    const ProfileSettings(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: const Color.fromARGB(202, 229, 229, 229),
        body: FutureBuilder<Person>(
            future: FirestoreService(uid: currentUserId).personFuture(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }

              if (snapshot.connectionState == ConnectionState.done) {
                persondata = snapshot.data!;

                return NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverOverlapAbsorber(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                            context),
                        sliver: SliverAppBar(
                          elevation: 0.0,
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
                          backgroundColor:
                              const Color.fromARGB(255, 250, 250, 250),
                          leading: Builder(
                              builder: (context) => IconButton(
                                  icon: const Icon(
                                    Icons.menu,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    Scaffold.of(context).openDrawer();
                                  })),
                          actions: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: CircleAvatar(
                                child: Text(
                                  getInitials(persondata.fullname.toString()),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ];
                  },
                  body: _pages[_pageIndex],
                );
              }

              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }),
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
                  Text(
                    persondata.fullname.toString(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Poppins'),
                  ),
                  const Divider(
                    thickness: 1.5,
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
                    onTap: () {
                      Get.back();
                      Get.to(() => const Search());
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
                    onTap: (() async => await sendMail()),
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
            title: const Text('Sign Out'),
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

  Future<void> sendMail() async {
    final Email email = Email(
      body: '',
      subject: 'Make a Report or Suggestion',
      recipients: ['trondarius13@gmail.com', 'trontech2021@gmail.com'],
      isHTML: false,
    );

    try {
      await FlutterEmailSender.send(email);
    } catch (error) {
      Get.snackbar('Error: ', error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent);
    }
  }

  String getInitials(fullname) {
    log(fullname);

    // editted here for debugging
    List<String> names = fullname.split(" ");
    String initials = "";
    int numWords = 2;

    for (var name in names) {
      if (name.isNotEmpty) {
        initials += name[0];
      }
    }

    //   if (numWords < names.length) {
    //     numWords = names.length;
    //   }
    //   for (var i = 0; i < numWords; i++) {
    //     initials += names[i][0];
    //   }
    //   return initials;

    return initials;
  }
}
