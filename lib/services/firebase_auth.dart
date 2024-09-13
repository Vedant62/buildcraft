import 'package:buildcraft/services/firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FirebaseAuthService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential> signIn({required String email, required String password}) {
    return firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<UserCredential> createUser(String email, String password) {
    return firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> signUp({required String email, required String password}) async {
    UserCredential userCredential = await createUser(email, password);
    return userCredential;
  }

  Future<void> signOut() async {
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
