import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newnew/consts/colours.dart';
import 'package:newnew/consts/input_decorations.dart';
import 'package:newnew/ui_helper/shared.dart';
import '../../consts/strings.dart';
import '../../services/auth.dart';
import '../card_list.dart';
import '../redirect_to_home.dart';
import 'login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  //final Function toggleView;
  //Register({required this.toggleView});

  @override
  RegisterState createState() => RegisterState();
}

class RegisterState extends State<Register> {
  final _key = GlobalKey<FormState>();
  final AuthAPIServices _authService = AuthAPIServices();
  final TextEditingController controller = TextEditingController();

  String firstName = "",
      lastName = "",
      gender = "",
      phoneNumber = "",
      email = "",
      password = "";

  int firstNameLength = 0,
      lastNameLength = 0,
      emailLength = 0,
      passwordLength = 0;

  bool loading = false, isSignedIn = false;
  String error = "";

  void unableToRegister() {
    setState(() {
      error = 'Could not Register With Those Credentials';
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              appBar: AppBar(
                  title: const Text("Register"),
                  automaticallyImplyLeading: false),
              body: Center(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 20.0),
                    child: Form(
                      key: _key,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          //First Name
                          TextFormField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(44),
                            ],
                            validator: (val) {
                              firstNameLength = val!.length;
                              if (firstNameLength > 0 && firstNameLength < 3) {
                                return "Enter valid name. Min characters = 3";
                              } else if (val.isEmpty) {
                                return "Enter your first name";
                              }
                              return null;
                            },
                            //val.isEmpty ? "Enter your first name" : null,
                            decoration: TEXT_INPUT_DECORATION.copyWith(
                                labelText: 'First Name',
                                hintText: "Enter your first name..."),
                            onChanged: (val) {
                              setState(() => firstName = val);
                            },
                          ),
                          HEIGHT_CONTAINER,

                          //Last Name
                          TextFormField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(44),
                            ],
                            validator: (val) {
                              lastNameLength = val!.length;
                              if (lastNameLength > 0 && lastNameLength < 3) {
                                return "Enter valid name. Min characters = 3";
                              } else if (val.isEmpty) {
                                return "Enter your last name";
                              }
                              return null;
                            },
                            //  validator: (val) => val.isEmpty ? "Enter your last name" : null,
                            decoration: TEXT_INPUT_DECORATION.copyWith(
                                labelText: 'Last Name',
                                hintText: "Enter your last name..."),
                            onChanged: (val) {
                              setState(() => lastName = val);
                            },
                          ),
                          HEIGHT_CONTAINER,

                          //Gender
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                GENDER_INPUT_VIEW,
                                GestureDetector(
                                  child: Row(
                                    children: <Widget>[
                                      Radio(
                                          value: "Male",
                                          groupValue: gender,
                                          activeColor: GREEN,
                                          onChanged: (val) {
                                            setState(
                                                () => gender = val.toString());
                                          }),
                                      MALE_RADIO,
                                      Radio(
                                          value: "Female",
                                          groupValue: gender,
                                          activeColor: GREEN,
                                          onChanged: (val) {
                                            setState(
                                                () => gender = val.toString());
                                          }),
                                      FEMALE_RADIO,
                                      Radio(
                                          value: "Other",
                                          groupValue: gender,
                                          activeColor: GREEN,
                                          onChanged: (val) {
                                            setState(
                                                () => gender = val.toString());
                                          }),
                                      OTHER_RADIO,
                                    ],
                                  ),
                                )
                              ]),
                          HEIGHT_CONTAINER,

                          //Phone
                          TextFormField(
                            validator: (val) =>
                            val!.isEmpty ? "Enter your phone number" : null,
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(25),
                            ],
                            decoration: TEXT_INPUT_DECORATION.copyWith(
                                hintText: "Enter your phone number..."),
                            onChanged: (val) => phoneNumber = val.toString(),
                          ),
                          HEIGHT_CONTAINER,

                          //Email
                          TextFormField(
                            validator: (val) {
                              emailLength = val!.length;
                              if (emailLength > 0 && emailLength < 3) {
                                return "Enter valid email.";
                              } else if (val.isEmpty) {
                                return "Enter your email";
                              }
                              return null;
                            },
                            //validator: (val) => val.isEmpty ? "Enter your email" : null,
                            keyboardType: TextInputType.emailAddress,
                            decoration: TEXT_INPUT_DECORATION.copyWith(
                                hintText: "Enter your email..."),
                            onChanged: (val) {
                              setState(() => email = val);
                              emailLength = val.length;
                            },
                          ),
                          HEIGHT_CONTAINER,

                          //Password
                          TextFormField(
                            obscureText: true,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(255),
                            ],
                            validator: (val) => val!.length < 8
                                ? ' Enter password longer than 8 chars'
                                : null,
                            decoration: TEXT_INPUT_DECORATION.copyWith(
                                hintText: "Enter your password..."),
                            onChanged: (val) {
                              setState(() => password = val.toString());
                              passwordLength = val.length;
                            },
                          ),
                          HEIGHT_CONTAINER,

                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: GREEN,
                            ),
                            onPressed: () async {
                              dynamic result =
                              await _authService.registerUserFirebase(
                                email, password,
                                firstName, lastName,
                                phoneNumber, gender,
                              );
                              if (_key.currentState!.validate()) {
                                setState(() async{
                                  //loading = true;
                                  //Future.delayed(const Duration(seconds: 1));
                                  await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const DoctorsCardList()));
                                });
                                _key.currentState?.save();
                              }
                              else if (result == null) {
                                setState(() {
                                  error = 'Could not Register With Those Credentials';
                                  loading = false;
                                });
                              }
                            },
                            child: REGISTER_BUTTON,
                          ),
                          HEIGHT_CONTAINER,

                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()));
                            },
                            child: MOVE_TO_LOGIN_SCREEN_TEXT,
                          ),
                          HEIGHT_CONTAINER,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
