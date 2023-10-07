import 'package:cv/template/sizedBox.dart';
import 'package:flutter/material.dart';

import 'CV template/traditional_one.dart';
import 'CV template/traditional_three.dart';
import 'CV template/traditional_two.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("chose CV Template"),
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              // alignment: WrapAlignment.spaceBetween,
              // crossAxisAlignment: WrapCrossAlignment.center,
              // runAlignment: WrapAlignment.spaceEvenly,
              runSpacing: 5,
              spacing: 10,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TraditionalCVtemplate1(),
                      ),
                    );
                  },
                  child: Image.asset(
                    "images/traditional1.jpg",
                    width: 150,
                    height: 200,
                    fit: BoxFit.fill,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TraditionalCVtemplate2(),
                      ),
                    );
                  },
                  child: Image.asset(
                    "images/bg.jpg",
                    width: 150,
                    height: 200,
                    fit: BoxFit.fill,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TraditionalCVTemplate3(),
                      ),
                    );
                  },
                  child: Image.asset(
                    "images/traditional1.jpg",
                    width: 150,
                    height: 200,
                    fit: BoxFit.fill,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TraditionalCVtemplate1(),
                      ),
                    );
                  },
                  child: Image.asset(
                    "images/traditional1.jpg",
                    width: 150,
                    height: 200,
                    fit: BoxFit.fill,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TraditionalCVtemplate1(),
                      ),
                    );
                  },
                  child: Image.asset(
                    "images/traditional1.jpg",
                    width: 150,
                    height: 200,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
