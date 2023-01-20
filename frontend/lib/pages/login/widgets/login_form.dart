import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController loginCtrl;
  final TextEditingController passwordCtrl;
  final GlobalKey<FormState> formKey;
  final void Function() onPressed;
  final String? error;
  const LoginForm(
      {Key? key,
      required this.formKey,
      required this.loginCtrl,
      required this.passwordCtrl,
      this.error,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
            child: (error != null)
                ? Text(
                    '$error',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red),
                  )
                : null,
          ),
          SizedBox(
            height: 90,
            child: TextFormField(
              controller: loginCtrl,
              validator: (value) => (value == null || value.isEmpty)
                  ? 'Please enter login'
                  : null,
              decoration: const InputDecoration(
                label: Text('Login'),
              ),
            ),
          ),
          SizedBox(
            height: 90,
            child: TextFormField(
              controller: passwordCtrl,
              validator: (value) => (value == null || value.isEmpty)
                  ? 'Please enter password'
                  : null,
              decoration: const InputDecoration(
                label: Text('Password'),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: onPressed,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 16),
                ),
              ))
        ],
      ),
    );
  }
}
