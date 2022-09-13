import 'package:fitness/components/utils/color_constant.dart';
import 'package:fitness/pages/login.dart';
import 'package:fitness/widgets/curved_button.dart';
import 'package:flutter/material.dart';

import '../components/already_have_an_account_acheck.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({
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
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 0),
                        child: TextFormField(
                          textInputAction: TextInputAction.done,
                          obscureText: true,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: "Confirm your password",
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(10),
                              child: Icon(Icons.lock),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // CurvedButton(textonButton: "Signup"),
                      Hero(
                        tag: "login_btn",
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "SignUp".toUpperCase(),
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
    );
  }
}
