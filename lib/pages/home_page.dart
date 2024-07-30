import 'package:buildcraft/services/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseAuthService firebaseAuthService = FirebaseAuthService();

  @override
  Widget build(BuildContext context) {
    final snackBarContext = ScaffoldMessenger.of(context);
    return Row(
      children: [
        const Center(
          child: Text('Home page'),
        ),
        IconButton(
          onPressed: () async {
            await firebaseAuthService.signOut();
            snackBarContext.showSnackBar(const SnackBar(
              content: Text('Successfully logged out!'),
            ));
          },
          icon: const Icon(Icons.logout_rounded),
        )
      ],
    );
  }
}
