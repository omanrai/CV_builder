import 'package:flutter/material.dart';

class HeadlineTextStyle extends StatelessWidget {
  final String name;
  final TextDecoration? underline;
  HeadlineTextStyle({
    required this.name,
    this.underline,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        decoration: underline,
        decorationThickness: 2.0,
      ),
    );
  }
}

class RegularTextStyle extends StatelessWidget {
  final String name;
  RegularTextStyle({required this.name});

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
    );
  }
}

class RegularTextWeight500 extends StatelessWidget {
  final String name;
  RegularTextWeight500({required this.name});

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    );
  }
}
