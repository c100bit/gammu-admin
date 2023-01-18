import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final Widget child;

  const AppCard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 500,
        height: 300,
        child: Card(
            child: Center(
                child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: child,
        ))),
      ),
    );
  }
}
