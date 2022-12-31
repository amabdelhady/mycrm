// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:newnew/consts/colours.dart';
import 'package:newnew/consts/input_decorations.dart';
import 'package:newnew/ui_helper/shared.dart';
import 'package:newnew/consts/strings.dart';
import 'package:newnew/screens/card_list.dart';
import 'package:newnew/screens/signing_in/register.dart';
import 'package:newnew/services/auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  //final Function toggleView;
 // Login({ this.toggleView});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final _key = GlobalKey<FormState>();
  final AuthAPIServices _authService = AuthAPIServices();
  String email = "", password = "";
  String error = "";
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: LOGIN_TAB_TITLE,
              ),
              body: Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
                  child: Form(
                    key: _key,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          validator: (val) =>
                              val!.isEmpty ? "Enter your email" : null,
                          keyboardType: TextInputType.emailAddress,
                          decoration: TEXT_INPUT_DECORATION.copyWith(
                              hintText: "Enter your email..."),
                          onChanged: (val) => setState(() => email = val),
                        ),
                        HEIGHT_CONTAINER,
                        TextFormField(
                          obscureText: true,
                          validator: (val) => val!.length < 8
                              ? ' Enter password longer than 8 chars'
                              : null,
                          decoration: TEXT_INPUT_DECORATION.copyWith(
                              hintText: "Enter your password..."),
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                        ),
                        HEIGHT_CONTAINER,
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: GREEN,
                            ),
                            onPressed: () async {
                              dynamic result = await
                              _authService.signInFirebase(email, password);

                              if (_key.currentState!.validate())
                              {
                                setState(() async {
                                 await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const DoctorsCardList()));
                                });
                              }
                              else if (result == 'error') {
                                setState(() {
                                  error = 'Please, Enter a Valid Credential';
                                  loading = false;
                                });
                              }
                            },
                            child: LOGIN_BUTTON),
                        HEIGHT_CONTAINER,
                        Text(
                          error,
                          style: const TextStyle(color: Colors.red, fontSize: 14.0),
                        ),
                        HEIGHT_CONTAINER,
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Register()));
                          }, //widget.toggleView(),
                          child: MOVE_TO_REGISTER_SCREEN_TEXT,
                        ),
                        HEIGHT_CONTAINER,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
