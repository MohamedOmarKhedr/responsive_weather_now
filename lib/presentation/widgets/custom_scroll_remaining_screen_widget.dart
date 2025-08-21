import 'package:flutter/material.dart';

class CustomScrollRemainingScreenWidget extends StatelessWidget {
  final BuildContext context;
  final Widget child;
  const CustomScrollRemainingScreenWidget(
      {Key? key, required this.context, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
          child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: child));
    });
  }
}
