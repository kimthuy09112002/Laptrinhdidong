// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:flutter/foundation.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_8/pages/LoginScreen_page.dart';
// import 'package:flutter/services.dart';
// import '../pages/Home_page.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Login Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         fontFamily: 'SanFrancisco',
//       ),
//       home: Scaffold(
//         resizeToAvoidBottomInset: false,
//         backgroundColor: const Color.fromRGBO(40, 38, 56, 1),
//         body: LoginScreen(),
//         bottomNavigationBar: BottomAppBar(
//             color: Colors.transparent,
//             elevation: 0,
//             child: Container(
//               padding: EdgeInsets.all(20),
//               child: Text(
//                 "Company name, Inc",
//                 style: TextStyle(color: Colors.white),
//                 textAlign: TextAlign.center,
//               ),
//             )),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_application_14/pages/LoginScreen_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'MyApp';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}
