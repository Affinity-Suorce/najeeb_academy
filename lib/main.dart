import 'package:flutter/material.dart';
import 'package:najeeb_academy/main_page.dart';

import 'app/app.dart';

Future<void> main() async {
  //uncomment
  // await NajeebAcademyApp.init();
  runApp(const MyApp());
}

//remove MyApp class when implementing routing
//temp class
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "Janna"),
      // home: VideoPlayerPage(subject: "الرياضيات",),
      home: MainPage(),
    );
  }
}
