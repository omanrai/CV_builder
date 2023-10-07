import 'dart:async';
import 'dart:typed_data';

import 'package:cv/template/sizedBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

import '../../template/text_style.dart';

class TraditionalCVtemplate1 extends StatefulWidget {
  @override
  State<TraditionalCVtemplate1> createState() => _TraditionalCVtemplate1State();
}

class _TraditionalCVtemplate1State extends State<TraditionalCVtemplate1> {
  GlobalKey globalKey = GlobalKey();

  Future<void> viewPdf() async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/cv.pdf';

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => PDFView(
        filePath: filePath,
      ),
    ));
  }

  // Future<void> savePdf() async {
  //   final pdf = pw.Document();
  //   final imageBytes = await convertWidgetToImage();
  //   pdf.addPage(pw.Page(
  //     build: (context) {
  //       return pw.Image(pw.MemoryImage(imageBytes));
  //     },
  //   ));
  //   final directory = await getApplicationDocumentsDirectory();
  //   final file = File('${directory.path}/cv.pdf');
  //   print('PDF will be saved to ${file.path}');
  //   // Save the PDF to the file
  //   final pdfBytes = await pdf.save();
  //   await file.writeAsBytes(pdfBytes);
  //   print('PDF saved to ${file.path}');
  //   // Show a confirmation message
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('PDF Saved'),
  //         content: Text('The PDF has been saved successfully.'),
  //         actions: <Widget>[
  //           TextButton(
  //             child: Text('OK'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  Future<void> savePdf() async {
    // Request storage permission
    var status = await Permission.manageExternalStorage.request();
    if (status.isGranted) {
      // Permission is granted, proceed to save PDF
      final pdf = pw.Document();
      final imageBytes = await convertWidgetToImage();
      pdf.addPage(pw.Page(
        build: (context) {
          return pw.Image(pw.MemoryImage(imageBytes));
        },
      ));

      // Define the target directory path
      final targetDirectory = Directory('/storage/emulated/0/DCIM/CV');
      targetDirectory.createSync(recursive: true);

      // Define the PDF file path within the target directory
      final file = File('${targetDirectory.path}/cv.pdf');
      print('PDF will be saved to ${file.path}');

      // Save the PDF to the file
      final pdfBytes = await pdf.save();
      await file.writeAsBytes(pdfBytes);

      print('PDF saved to ${file.path}');

      // Show a confirmation message
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('PDF Saved'),
            content: Text('The PDF has been saved successfully.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      // Permission denied
      print('Storage permission denied');
    }
  }

  Future<Uint8List> convertWidgetToImage() async {
    RenderRepaintBoundary boundary =
        globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(
        pixelRatio: 3.0); // Adjust the pixelRatio as needed
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Traditional one Page'),
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
                      viewPdf(); // Call this function to view as PDF
                    },
                    child: Text('View as PDF'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      savePdf();
                      // Call this function to save as PDF
                    },
                    child: Text('Save as PDF'),
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
