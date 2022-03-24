import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  final Icon Icoon;
  final double Siz;

  const IconWidget({
    Key? key,
    required this.Icoon,
    this.Siz =30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      label: const Text(''),
      icon: Icoon,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: Theme.of(context).appBarTheme.backgroundColor,
      ),
    );
  }
}
