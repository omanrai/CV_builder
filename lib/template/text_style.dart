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
        decorationThickness: 1.5,
        // decorationStyle: TextDecorationStyle.solid,
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

//how to give spacing between text and underline

class TextnUnderlineSpace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0), // Adjust the spacing as needed
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black,
              width: 1.5, // Adjust the thickness as needed
            ),
          ),
        ),
        child: Text(
          'Your Text',
          style: TextStyle(
            decoration: TextDecoration.none, // Remove the default underline
          ),
        ),
      ),
    );
  }
}

class BulletList extends StatelessWidget {
  BulletList({
    required this.litsItem1,
    this.litsItem2,
  });
  final String litsItem1;
  final String? litsItem2;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.justify,
      text: TextSpan(
        children: [
          TextSpan(
            text: '•  ',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          TextSpan(
            text: litsItem1,
            style: TextStyle(
              color: Colors.black, // Set the desired color
            ),
          ),
          TextSpan(text: '\n'), // Add a line break between items
          TextSpan(
            text: '•  ',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          TextSpan(
            text:
                // 'A SLC Passed from Sunsari Multiple Campus capus capmpudfjh dfgsdfghsdf',
                litsItem2,
            style: TextStyle(
              color: Colors.black,
              // Set the desired color
            ),
          ),
          // TextSpan(text: '\n'), // Add a line break between items
          // TextSpan(
          //   text: '•  ',
          //   style: TextStyle(
          //       fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          // ),
        ],
      ),
    );
  }
}
