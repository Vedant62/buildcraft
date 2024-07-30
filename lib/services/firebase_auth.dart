import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<void> signIn(String email, String password) {
    return firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> createUser(String email, String password){
    return firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }
}
