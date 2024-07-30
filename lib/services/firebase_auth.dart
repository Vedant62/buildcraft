import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FirebaseAuthService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<void> signIn({required String email, required String password}) {
    return firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> createUser(String email, String password) {
    return firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signUp({required String email, required String password}) async {
    await createUser(email, password);
    return signIn(email: email, password: password);
  }

  Future<void> signOut()async{
    await firebaseAuth.signOut();
  }

  StreamBuilder<User?> authWork(
      {required Widget authYes, required Widget authNo}) {
    return StreamBuilder(
        stream: firebaseAuth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return authYes;
          } else {
            return authNo;
          }
        });
  }
}
