import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:gweather/logic/helpers.dart';

class DateAndLocation extends StatelessWidget {
  const DateAndLocation({
    Key? key,
    required this.today,
  }) : super(key: key);

  final DateTime today;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('${DateFormat.EEEE('fr').format(today).capitalize()}, ${DateFormat.M('fr').format(today)}'),
            const Text(
              'Dakar, Sénégal',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
