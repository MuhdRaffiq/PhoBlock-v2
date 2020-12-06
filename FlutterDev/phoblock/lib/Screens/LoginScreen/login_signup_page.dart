import 'package:flutter/material.dart';
import 'forgot_password.dart';
import 'image_banner.dart';
import 'login_button.dart';
import 'no_account.dart';
import 'password_textbox.dart';
import 'text_box.dart';
import 'title_section.dart';
// import 'package:phoblock/pages/homepage.dart';
// import 'package:phoblock/widgets/getData.dart';
// import 'package:phoblock/widgets/userData.dart';

class LoginSignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ImageBanner("assets/images/phoblock_branding-09.png"),
          TitleSection("The decentralized photography platform"),
          TextBox(),
          PasswordTextBox(),
          ForgotPassword(),
          LoginButton(),
          NoAccount(),
        ],
      ),
    );
  }
}

// class LogIn_SignUp_Page extends StatefulWidget {
//   @override
//   _LogIn_SignUp_PageState createState() => _LogIn_SignUp_PageState();
// }

// class _LogIn_SignUp_PageState extends State<LogIn_SignUp_Page> {
//   @override
//   Widget build(BuildContext context) {
//     UserData x = UserData();
//     TextEditingController _userEmail = TextEditingController();
//     TextEditingController _password = TextEditingController();
//     bool loggedin = false;
//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   Container(
//                     height: 250,
//                     child: Image.asset(
//                       "assets/phoblock_branding-09.png",
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   Text(
//                       "Welcome to PhoBlock\nThe decentralized photography platform",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.w500,
//                         fontSize: 14.5,
//                       ))
//                 ],
//               ),
//               Center(
//                 child: Container(
//                   margin: EdgeInsets.only(top: 50),
//                   decoration: BoxDecoration(),
//                   width: 280,
//                   height: 280,
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           "Please log in",
//                           style: TextStyle(fontSize: 18),
//                         ),
//                       ),
//                       TextField(
//                         keyboardType: TextInputType.emailAddress,
//                         decoration: InputDecoration(
//                           labelText: 'Email Adress',
//                         ),
//                         controller: _userEmail,
//                       ),
//                       TextField(
//                         obscureText: true,
//                         decoration: InputDecoration(
//                           labelText: 'password',
//                         ),
//                         controller: _password,
//                       ),
//                       SizedBox(
//                         height: 8,
//                       ),
//                       FlatButton(
//                         color: Colors.blue,
//                         onPressed: () {
//                           //TODO: check user name and password match in data.
//                           print('Submit');
//                           print(_userEmail.text);
//                           print(_password.text);
//                           x.getCode().then((value) {
//                             var data = value;
//                             setState(() {
//                               for (int i = 0; i < data.length; i++) {
//                                 if (data[i]['emailAddress'] ==
//                                         _userEmail.text &&
//                                     data[i]['userPassword'] == _password.text) {
//                                   loggedin = true;
//                                   Navigator.of(context).pushNamed('homepage');
//                                 }
//                               }
//                               if (!loggedin) print("bad email/password");
//                             });
//                           });

//                           // Navigator.of(context).pushNamed('homepage');
//                         },
//                         child: Text(
//                           'Submit',
//                           style: TextStyle(
//                             fontSize: 20,
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 8,
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           //TODO: opens in app browser to web sign up page
//                           print('url');
//                         },
//                         child: Text(
//                           'No account? Sign up here!',
//                           style: TextStyle(
//                             decoration: TextDecoration.underline,
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
