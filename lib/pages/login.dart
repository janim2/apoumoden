import 'package:fitness/components/utils/color_constant.dart';
import 'package:fitness/pages/app_goal.dart';
import 'package:fitness/pages/signup.dart';
import 'package:flutter/material.dart';

import '../components/already_have_an_account_acheck.dart';
import 'dashboard/dashboard.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        cursorColor: Colors.black,
                        onSaved: (email) {},
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
                          textInputAction: TextInputAction.done,
                          obscureText: true,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: "Your password",
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(10),
                              child: Icon(Icons.lock),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Hero(
                        tag: "login_btn",
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Goal();
                                },
                              ),
                            );
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
    );
  }
}
