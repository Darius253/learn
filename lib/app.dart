import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_file_view/flutter_file_view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:learn/shared/exports.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return const GetMaterialApp(
      title: 'Learn',
      color: Color.fromARGB(255, 67, 64, 255),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: <LocalizationsDelegate<dynamic>>[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      home: SplashScreen(),
    );
  }
}
