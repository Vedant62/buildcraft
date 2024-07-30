import 'package:buildcraft/pages/forms/sign_in.dart';
import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key, required this.navigate});

  final VoidCallback navigate;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  // TextEditingController _emailController = TextEditingController();
  // TextEditingController _passwordController = TextEditingController();
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
                  'Sign up',
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
              keyboardType: TextInputType.name,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(fontWeight: FontWeight.w300, fontSize: 17),
              decoration: const InputDecoration(
                  label: Text('Name'),
                  labelStyle: TextStyle(fontWeight: FontWeight.w300)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter your name';
                }
                return null;
              },
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
                  label: Text('Password'),
                  labelStyle: TextStyle(fontWeight: FontWeight.w300)),
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
            style: ElevatedButton.styleFrom(elevation: 5),
            child: const Text('Submit'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account?',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                TextButton(
                  onPressed: ()=>widget.navigate(),
                  child: const Text(
                    'Sign in',
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
