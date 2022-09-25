import 'package:fitness/components/utils/color_constant.dart';
import 'package:fitness/pages/app_goal.dart';
import 'package:fitness/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../backend/auth/login.dart';
import '../components/already_have_an_account_acheck.dart';
import '../widgets/toast.dart';
import 'dashboard/dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isVisible = false;
  bool showSpinner = false;

  TextEditingController emailtextEdittingController = TextEditingController();

  TextEditingController passwordTextEdittingController =
      TextEditingController();

  void updateStatus() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void stopSpinner() {
    setState(() {
      showSpinner = false;
    });
  }

  void startSpinner() {
    setState(() {
      showSpinner = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                Text(
                  "Apomuden",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: ColorConstant.primary,
                      fontFamily: "Geometria"),
                ),
                Text(
                  "LOGIN",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    const Spacer(),
                    // Expanded(
                    //   flex: 8,
                    //   child: SvgPicture.asset("assets/icons/login.svg"),
                    // ),
                    const Spacer(),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
            Row(
              children: [
                Spacer(),
                Expanded(
                  flex: 8,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailtextEdittingController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email required';
                            } else if (!value.contains("@")) {
                              return 'Enter valid email';
                            }
                          },
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: "Your email",
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(10),
                              child: Icon(Icons.person),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            controller: passwordTextEdittingController,
                            textInputAction: TextInputAction.done,
                            obscureText: _isVisible ? false : true,
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(
                                  RegExp(r"\s\b|\b\s"))
                            ],
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Password required';
                              } else if (value.length < 6) {
                                return 'Password length must be greater than 6';
                              }
                            },
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintText: "Your password",
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(10),
                                child: Icon(Icons.lock),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () => updateStatus(),
                                icon: Icon(
                                  _isVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: ColorConstant.primary,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Hero(
                          tag: "login_btn",
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();

                                startSpinner();
                                // Do your jobs with the validated form data.
                                var reg = await Login(context,
                                    email: emailtextEdittingController.text,
                                    password:
                                        passwordTextEdittingController.text);
                                if (reg != null) {
                                  stopSpinner();
                                  showAlert(context, "error", reg.toString(),
                                      () {
                                    Navigator.of(context).pop();
                                  });
                                }
                              }
                            },
                            child: Text(
                              "Login".toUpperCase(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        AlreadyHaveAnAccountCheck(
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return SignUpScreen();
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
