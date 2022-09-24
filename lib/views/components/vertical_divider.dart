import 'package:flutter/material.dart';

class VericalDivider extends StatelessWidget {
  const VericalDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 2,
      color: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}
