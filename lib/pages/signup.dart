import 'package:fitness/components/utils/color_constant.dart';
import 'package:fitness/pages/login.dart';
import 'package:fitness/widgets/curved_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../backend/auth/signup.dart';
import '../components/already_have_an_account_acheck.dart';
import '../widgets/toast.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isVisible = false;
  bool showSpinner = false;

  TextEditingController emailtextEdittingController = TextEditingController();

  TextEditingController passwordTextEdittingController =
      TextEditingController();
  TextEditingController confirmPasswordtextEdittingController =
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
                  "SIGNUP",
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
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 0),
                          child: TextFormField(
                            controller: confirmPasswordtextEdittingController,
                            textInputAction: TextInputAction.done,
                            obscureText: _isVisible ? false : true,
                            cursorColor: Colors.black,
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(
                                  RegExp(r"\s\b|\b\s"))
                            ],
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Password required';
                              } else if (value.length < 6) {
                                return 'Password length must be greater than 6';
                              } else if (value !=
                                  passwordTextEdittingController.text) {
                                return 'Password mismatch';
                              }
                            },
                            decoration: InputDecoration(
                              hintText: "Confirm your password",
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
                        // CurvedButton(textonButton: "Signup"),
                        Hero(
                          tag: "login_btn",
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();

                                startSpinner();
                                // Do your jobs with the validated form data.

                                var reg = await SignUp(context,
                                    email: emailtextEdittingController.text,
                                    password:
                                        passwordTextEdittingController.text);
                                if (reg != null) {
                                  stopSpinner();
                                  showAlert(context, "error", reg.toString(), () {
                                    Navigator.of(context).pop();
                                  });
                                }
                              }
                            },
                            child: Text(
                              "SignUp".toUpperCase(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        AlreadyHaveAnAccountCheck(
                          login: false,
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return LoginScreen();
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
