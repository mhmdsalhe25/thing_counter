import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'HomeScreen.dart';
// import 'Theme/MyTheme.dart';

void main()async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget  {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Counter',
        // theme: ThemeData(
        //   scaffoldBackgroundColor: KAppBar,
        //   primaryColorDark: KBady,
        //   appBarTheme: const AppBarTheme(color: KAppBar),
        //   primaryTextTheme: TextTheme(
        //     headlineLarge: TextStyle(
        //       fontFamily: GoogleFonts.montserrat().fontFamily,
        //     ),
        //   ),
        //   iconTheme: const IconThemeData(color: KIcon),
        //   primaryColor: KBady,
        // ),
        home: HomeScreen(
        ));
  }
}


