// import 'package:flutter/foundation.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_8/pages/HomeScreen_page.dart';
// import 'package:flutter_application_8/pages/Home_page.dart';
// import 'Signup_page.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   TextEditingController usernameController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   bool _isObscure = true;
//   bool _isVisible = false;

//   final TapGestureRecognizer _gestureRecognizer = TapGestureRecognizer()
//     ..onTap = () {
//       if (kDebugMode) {
//         print("Hello world from _gestureRecognizer");
//       }
//     };

//   get auth => null;

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//         reverse: true,
//         padding: EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             SizedBox(
//               height: 60,
//               width: 200,
//             ),

//             // Login text Widget
//             Center(
//               child: Container(
//                 height: 200,
//                 width: 400,
//                 alignment: Alignment.center,
//                 child: Text(
//                   "Login",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 34,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   // textAlign: TextAlign.center,
//                 ),
//               ),
//             ),

//             SizedBox(
//               height: 60,
//               width: 10,
//             ),

//             // Wrong Password text
//             Visibility(
//               visible: _isVisible,
//               maintainSize: true,
//               maintainAnimation: true,
//               maintainState: true,
//               child: Container(
//                 alignment: Alignment.centerLeft,
//                 padding: const EdgeInsets.all(10),
//                 child: Text(
//                   "Wrong credentials entered",
//                   style: TextStyle(
//                     color: Colors.red,
//                     fontSize: 10,
//                   ),
//                 ),
//               ),
//             ),

//             // Textfields for username and password fields
//             Container(
//               height: 140,
//               width: 530,
//               decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(20)),
//                   color: Colors.white),
//               child: Column(
//                 children: <Widget>[
//                   TextFormField(
//                     onTap: () {
//                       setState(() {
//                         _isVisible = false;
//                       });
//                     },
//                     controller: usernameController, // Controller for Username
//                     decoration: const InputDecoration(
//                         border: InputBorder.none,
//                         hintText: "Username",
//                         contentPadding: EdgeInsets.all(20)),
//                     onEditingComplete: () => FocusScope.of(context).nextFocus(),
//                   ),
//                   Divider(
//                     thickness: 3,
//                   ),
//                   TextFormField(
//                     onTap: () {
//                       setState(() {
//                         _isVisible = false;
//                       });
//                     },

//                     controller: passwordController, // Controller for Password
//                     decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintText: "Password",
//                         contentPadding: EdgeInsets.all(20),
//                         // Adding the visibility icon to toggle visibility of the password field
//                         suffixIcon: IconButton(
//                           icon: Icon(_isObscure
//                               ? Icons.visibility_off
//                               : Icons.visibility),
//                           onPressed: () {
//                             setState(() {
//                               _isObscure = !_isObscure;
//                             });
//                           },
//                         )),
//                     obscureText: _isObscure,
//                   ),
//                 ],
//               ),
//             ),

//             // Submit Button
//             Container(
//               width: 570,
//               height: 70,
//               padding: EdgeInsets.only(top: 20),
//               child: ElevatedButton(
//                   child: Text("Submit", style: TextStyle(color: Colors.white)),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.green,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30)),
//                   ),
//                   onPressed: () {
//                     if (auth.fetchCredentials(
//                         usernameController.text, passwordController.text)) {
//                       Navigator.pushAndRemoveUntil(
//                         context,
//                         MaterialPageRoute(builder: (context) => HomeScreen()),
//                         (Route<dynamic> route) => false,
//                       );
//                     } else {
//                       setState(() {
//                         _isVisible = true;
//                       });
//                     }
//                   }),
//             ),

//             // Register
//             Container(
//                 padding: EdgeInsets.only(top: 40, left: 20, right: 20),
//                 child: Center(
//                     child: RichText(
//                   text: TextSpan(
//                     text: "Dont have an account? ",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 15,
//                     ),
//                     children: [
//                       TextSpan(
//                           text: " Register here",
//                           style: TextStyle(
//                               color: Colors.blue, fontWeight: FontWeight.bold),
//                           recognizer: new TapGestureRecognizer()
//                             ..onTap = () => {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) =>
//                                             SignupPageContent()),
//                                   )
//                                 }),
//                     ],
//                   ),
//                 )))
//           ],
//         ));
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_application_14/pages/MyHome_page.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  get auth => null;

  set _isVisible(bool _isVisible) {}

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'SELLBOOK',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign in',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: const Text(
                'Forgot Password',
              ),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    var usernameController;
                    // if (auth.fetchCredentials(
                    //     usernameController.text, passwordController.text)) {
                    //   Navigator.pushAndRemoveUntil(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => HomeScreen()),
                    //     (Route<dynamic> route) => false,
                    //   );
                    // } else {
                    //   setState(() {
                    //     _isVisible = true;
                    //   });
                    // }
                    Route route = MaterialPageRoute(
                      builder: (context) => MyHomePage(
                        title: 'SELLBOOK',
                      ),
                    );
                    Navigator.push(context, route);
                  }),
            ),
            Row(
              children: <Widget>[
                const Text('Does not have account?'),
                TextButton(
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    //signup screen
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ));
  }
}
