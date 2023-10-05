import 'dart:typed_data';

import 'package:cv/template/sizedBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;
import 'package:image_gallery_saver/image_gallery_saver.dart';

import '../template/text_style.dart';
import 'view_cv.dart';

class TraditionalCVtemplate1 extends StatefulWidget {
  @override
  State<TraditionalCVtemplate1> createState() => _TraditionalCVtemplate1State();
}

class _TraditionalCVtemplate1State extends State<TraditionalCVtemplate1> {
  GlobalKey globalKey = GlobalKey();

  Future<Uint8List> convertWidgetToImage() async {
    RenderRepaintBoundary boundary =
        globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

// for save image
  Future<void> saveImageToDevice(Uint8List imageData) async {
    final result = await ImageGallerySaver.saveImage(imageData);
    if (result['isSuccess']) {
      // Image saved successfully
      print('Image saved to gallery!');
    } else {
      // Saving image failed
      print('Failed to save image to gallery.');
    }
  }

  Uint8List? imageData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RepaintBoundary(
                key: globalKey,
                child: Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        color: Colors.black45,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  HeadlineTextStyle(name: "Oman Rai"),
                                  RegularTextStyle(
                                      name: "Full stack Developer/Occupation"),
                                  RegularTextStyle(
                                      name: "Mobile No. : +9779804055044"),
                                  RegularTextStyle(
                                      name:
                                          "Address: Inaruwa-3, Sunsari, Nepal"),
                                  RegularTextStyle(
                                      name: "Gmail: Oman2023rai@gmail.com"),
                                ],
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Container(
                                  color: Colors.black,
                                  child: Image.asset(
                                    "images/no_bg.png",
                                    height: 80,
                                    width: 80,

                                    fit: BoxFit.fill,
                                    // width: 100,
                                    // height: 100,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.black,
                        thickness: 1.5,
                      ),
                      SizedBoxH5,
                      Container(
                        // color: Colors.black45,
                        width: double.infinity,
                        child: Wrap(
                          children: [
                            HeadlineTextStyle(
                              name: "About Me",
                              underline: TextDecoration.underline,
                            ),
                            TextField(
                              minLines: 2,
                              maxLines: 4,
                              // textAlign: TextAlign.justify,
                              decoration: InputDecoration(
                                labelText: 'Enter your bio',
                                // border: OutlineInputBorder(),
                              ),
                              keyboardType: TextInputType.multiline,
                              textInputAction: TextInputAction.done,
                              // focusNode: primaryFocus,
                            ),
                          ],
                        ),
                      ),
                      SizedBoxH10,
                      HeadlineTextStyle(
                          name: "Profile Details",
                          underline: TextDecoration.underline),
                      Container(
                        width: double.infinity,
                        // color: Colors.black45,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                children: [
                                  RegularTextWeight500(name: "Date of Birth :"),
                                  Text(" 5 oct 1997"),
                                ],
                              ),
                              Wrap(
                                children: [
                                  RegularTextWeight500(name: "Father's Name :"),
                                  Text(" Durgha Rai"),
                                ],
                              ),
                              Wrap(
                                children: [
                                  RegularTextWeight500(name: "Mother's Name :"),
                                  Text(" Netra Rai"),
                                ],
                              ),
                              Wrap(
                                children: [
                                  RegularTextWeight500(
                                      name: "Marital Status :"),
                                  Text(" Married"),
                                ],
                              ),
                              Wrap(
                                children: [
                                  RegularTextWeight500(name: "Nationality :"),
                                  Text(" Nepali"),
                                ],
                              ),
                              Wrap(
                                children: [
                                  RegularTextWeight500(name: "Gender :"),
                                  Text(" Male"),
                                ],
                              ),
                              Wrap(
                                children: [
                                  RegularTextWeight500(name: "Height :"),
                                  Text(" 5'5'"),
                                ],
                              ),
                              Wrap(
                                children: [
                                  RegularTextWeight500(name: "Weight :"),
                                  Text(" 60 kg"),
                                ],
                              ),
                              Wrap(
                                children: [
                                  RegularTextWeight500(
                                      name: "Language Known :"),
                                  Text(" English, Hindi, Nepali"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      HeadlineTextStyle(
                        name: "Academic Qualification",
                        underline: TextDecoration.underline,
                      ),
                      Container(
                        width: double.infinity,
                        // color: Colors.black45,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15, top: 5, bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                textAlign: TextAlign.justify,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '•  ',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                      text:
                                          '+2 Passed from Sunsari Multiple Campus CampusCampusCampusCampusCampusCampusCampusCampus ',
                                      style: TextStyle(
                                        color: Colors
                                            .black, // Set the desired color
                                      ),
                                    ),
                                    TextSpan(
                                        text:
                                            '\n'), // Add a line break between items
                                    TextSpan(
                                      text: '•  ',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                      text:
                                          'A SLC Passed from Sunsari Multiple Campus capus capmpudfjh dfgsdfghsdf',
                                      style: TextStyle(
                                        color: Colors.black,
                                        // Set the desired color
                                      ),
                                    ),

                                    // Add more items as needed
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      HeadlineTextStyle(
                        name: "Skill",
                        underline: TextDecoration.underline,
                      ),
                      Container(
                        width: double.infinity,
                        // color: Colors.black45,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15, top: 5, bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                textAlign: TextAlign.justify,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '•  ',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                      text:
                                          'Ability to quickly learn and adapt to different environments and scope with new scenarios quickly.',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    TextSpan(text: '\n'),
                                    TextSpan(
                                      text: '•  ',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                      text:
                                          'Well developed communication skills.',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      HeadlineTextStyle(
                        name: "Work Experience",
                        underline: TextDecoration.underline,
                      ),
                      Container(
                        width: double.infinity,
                        // color: Colors.black45,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15, top: 5, bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                textAlign: TextAlign.justify,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '•  ',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                      text:
                                          'Worked as a SalesBoy in British Gurkha Department Store from March 2021 till date.',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    TextSpan(text: '\n'),
                                    TextSpan(
                                      text: '•  ',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                      text:
                                          'Well developed communication skills.',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      HeadlineTextStyle(
                        name: "Passport Details",
                        underline: TextDecoration.underline,
                      ),
                      Container(
                        width: double.infinity,
                        // color: Colors.black45,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15, top: 5, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                children: [
                                  RegularTextWeight500(name: "Passport No. :"),
                                  Text(" PA1075922"),
                                ],
                              ),
                              Wrap(
                                children: [
                                  RegularTextWeight500(name: "Issue Date :"),
                                  Text(" 16 Dec 2022"),
                                ],
                              ),
                              Wrap(
                                children: [
                                  RegularTextWeight500(name: "Expiry Date :"),
                                  Text(" 15 Dec 2032"),
                                ],
                              ),
                              Wrap(
                                children: [
                                  RegularTextWeight500(name: "Issue place :"),
                                  Text(" Sunsari, Nepal"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      convertWidgetToImage().then((image) {
                        setState(() {
                          imageData = image;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ViewCV(imageData: image),
                          ),
                        );
                      });
                    },
                    child: Text('View CV'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      convertWidgetToImage().then((image) {
                        setState(() {
                          imageData = image;
                        });
                        saveImageToDevice(image);
                      });
                    },
                    child: Text('Save Image'),
                  ),
                  // if (imageData != null) Image.memory(imageData!),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
