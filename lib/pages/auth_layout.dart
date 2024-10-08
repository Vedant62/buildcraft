import 'package:buildcraft/pages/forms/sign_in.dart';
import 'package:buildcraft/pages/forms/sign_up.dart';
import 'package:buildcraft/pages/home_page.dart';
import 'package:buildcraft/services/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthLayout extends StatefulWidget {
  const AuthLayout({super.key});

  @override
  State<AuthLayout> createState() => _AuthLayoutState();
}

class _AuthLayoutState extends State<AuthLayout> {
  FirebaseAuthService firebaseAuthService = FirebaseAuthService();
  final PageController _pageController = PageController(initialPage: 1);
  int _index = 1;

  void navigateToSignIn() {
    if (_index == 0) {
      _pageController.animateToPage(1,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void navigateToSignUp() {
    if (_index == 1) {
      _pageController.animateToPage(0,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void _onPageChanged(int i) {
    setState(() {
      _index = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: firebaseAuthService.authWork(
          //if user logged in
          authYes: const HomePage(),
          //if NOT logged in
          authNo: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height -
                  AppBar().preferredSize.height -
                  MediaQuery.of(context).padding.top,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                      child: PageView(
                        onPageChanged: _onPageChanged,
                        controller: _pageController,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 40.0),
                            child: SignUpForm(navigate: () {
                              navigateToSignIn();
                            }),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 40.0),
                            child: SignInForm(navigate: () {
                              navigateToSignUp();
                            }),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 60, bottom: 8.0),
                      child: Image.asset("assets/images/sign_up.png"),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
