import 'package:buildcraft/services/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key, required this.navigate});

  final VoidCallback navigate;

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  FirebaseAuthService firebaseAuthService = FirebaseAuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final snackBarContext = ScaffoldMessenger.of(context);
    final navContext = Navigator.of(context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Sign In',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(fontWeight: FontWeight.w300, fontSize: 17),
              decoration: const InputDecoration(
                  label: Text('Email'),
                  labelStyle: TextStyle(fontWeight: FontWeight.w300)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter your email';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _passwordController,
              keyboardType: TextInputType.text,
              obscureText: _obscureText,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(fontWeight: FontWeight.w300, fontSize: 17),
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Theme.of(context).colorScheme.tertiary,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                  label: const Text('Password'),
                  labelStyle: const TextStyle(fontWeight: FontWeight.w300)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter your password';
                }
                return null;
              },
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    });
                try {
                  await firebaseAuthService.signIn(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                  navContext.pop(); // Dismiss the loading dialog
                  snackBarContext.showSnackBar(
                    const SnackBar(
                      content: Text('Signed in successfully'),
                    ),
                  );
                } on FirebaseAuthException catch (e) {
                  navContext.pop(); // Dismiss the loading dialog
                  String errorMessage;
                  switch (e.code) {
                    case "user-not-found":
                      errorMessage = "No user found with this email.";
                      break;
                    case "wrong-password":
                      errorMessage = "Incorrect password.";
                      break;
                    case "invalid-email":
                      errorMessage = "Invalid email address.";
                      break;
                    case "user-disabled":
                      errorMessage = "This account has been disabled.";
                      break;
                    default:
                      errorMessage = "An error occurred: ${e.message}";
                  }
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Error'),
                          content: Text(errorMessage),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      });
                } catch (e) {
                  navContext.pop(); // Dismiss the loading dialog
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Error'),
                          content: Text('An unexpected error occurred: $e'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      });
                }
              }
            },
            style: ElevatedButton.styleFrom(elevation: 5),
            child: const Text('Sign in'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                TextButton(
                  onPressed: () => widget.navigate(),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                      // fontStyle: FontStyle.italic,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
