import 'package:buildcraft/pages/forms/sign_up.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key, required this.navigate});
  final VoidCallback navigate;

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
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
              keyboardType: TextInputType.text,
              obscureText: _obscureText,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(fontWeight: FontWeight.w300, fontSize: 17),
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText? Icons.visibility_off : Icons.visibility,
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
                  return 'Enter your new password';
                }
                return null;
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Works!'),
                  ),
                );
              }
            },
            child: const Text('Submit'),
            style: ElevatedButton.styleFrom(elevation: 5),
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
                  onPressed: ()=>widget.navigate(),
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
