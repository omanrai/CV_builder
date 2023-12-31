import 'dart:typed_data';

import 'package:cv/template/sizedBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;
import 'package:image_gallery_saver/image_gallery_saver.dart';

// import 'dart:io';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:path_provider/path_provider.dart';

// import 'package:flutter_pdfview/flutter_pdfview.dart';

import '../../template/text_style.dart';

import '../view_as/view_as_image.dart';

class TraditionalCVtemplate2 extends StatefulWidget {
  @override
  State<TraditionalCVtemplate2> createState() => _TraditionalCVtemplate2State();
}

class _TraditionalCVtemplate2State extends State<TraditionalCVtemplate2> {
  GlobalKey globalKey = GlobalKey();

  Future<Uint8List> convertWidgetToImage() async {
    RenderRepaintBoundary boundary =
        globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 1.0);
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
        title: Text('Traditional two Page'),
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
                              name: "Career Objective",
                              underline: TextDecoration.underline,
                            ),
                            Wrap(
                              children: [
                                Text(
                                    "Seeking a challenging and suitable position to utilize my entire capacity and knowledge in a progressive manner, where it can be a resulted in positive and to develop myself along with a dynamic organization where modern concepts are recognized."),
                              ],
                            ),
                            // TextField(
                            //   minLines: 2,
                            //   maxLines: 4,
                            //   // textAlign: TextAlign.justify,
                            //   decoration: InputDecoration(
                            //     labelText: "",
                            //     // border: OutlineInputBorder(),
                            //   ),
                            //   keyboardType: TextInputType.multiline,
                            //   textInputAction: TextInputAction.done,
                            //   // focusNode: primaryFocus,
                            // ),
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
                              BulletList(
                                litsItem1:
                                    '+2 Passed from Sunsari Multiple Campus CampusCampusCampusCampusCampusCampusCampusCampus',
                                litsItem2:
                                    'SLC Passed from Sunsari Multiple Campus capus capmpudfjh dfgsdfghsdf',
                              ),
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
                              BulletList(
                                litsItem1:
                                    'Ability to quickly learn and adapt to different environments and scope with new scenarios quickly.',
                                litsItem2:
                                    'Well developed communication skills.',
                              ),
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
                              BulletList(
                                litsItem1:
                                    'Worked as a SalesBoy in British Gurkha Department Store from March 2021 till date.',
                                litsItem2:
                                    'Worked as a waiter in Dharan Gorkha Kitchen for 2 years.',
                              ),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
