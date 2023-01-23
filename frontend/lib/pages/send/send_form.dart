import 'package:flutter/material.dart';

class SendForm extends StatelessWidget {
  final TextEditingController phoneCtrl;
  final TextEditingController textCtrl;
  final GlobalKey<FormState> formKey;
  final void Function() onPressed;
  final Widget? header;

  const SendForm(
      {Key? key,
      required this.formKey,
      required this.phoneCtrl,
      required this.textCtrl,
      this.header,
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
            child: Center(child: header),
          ),
          SizedBox(
            height: 90,
            child: TextFormField(
              controller: phoneCtrl,
              validator: (value) => (value == null || value.isEmpty)
                  ? 'Please enter phone'
                  : null,
              decoration: const InputDecoration(
                label: Text('Phone'),
              ),
            ),
          ),
          SizedBox(
            height: 90,
            child: TextFormField(
              controller: textCtrl,
              validator: (value) =>
                  (value == null || value.isEmpty) ? 'Please enter text' : null,
              decoration: const InputDecoration(
                label: Text('Text'),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: onPressed,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Send',
                  style: TextStyle(fontSize: 16),
                ),
              ))
        ],
      ),
    );
  }
}
