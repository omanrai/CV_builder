  // Future<void> savePdf() async {
  //   Map<Permission, PermissionStatus> statuses = await [
  //     Permission.storage,
  //     Permission.manageExternalStorage,
  //   ].request();

  //   var storage = statuses[Permission.storage];
  //   var manageExternalStorage = statuses[Permission.manageExternalStorage];
  //   if (storage!.isGranted || manageExternalStorage!.isGranted) {
  //         final pdf = pw.Document();
  //     final imageBytes = await convertWidgetToImage();
  //     pdf.addPage(pw.Page(
  //       build: (context) {
  //         return pw.Image(pw.MemoryImage(imageBytes));
  //       },
  //     ));

  //     // Define the target directory path
  //     final targetDirectory = Directory('/storage/emulated/0/DCIM/CV');
  //     targetDirectory.createSync(recursive: true);

  //     // Define the PDF file path within the target directory
  //     final file = File('${targetDirectory.path}/cv.pdf');
  //     print('PDF will be saved to ${file.path}');

  //     // Save the PDF to the file
  //     final pdfBytes = await pdf.save();
  //     await file.writeAsBytes(pdfBytes);

  //     print('PDF saved to ${file.path}');

  //     // Show a confirmation message
  //     showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: Text('PDF Saved'),
  //           content: Text('The PDF has been saved successfully.'),
  //           actions: <Widget>[
  //             TextButton(
  //               child: Text('OK'),
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //             ),
  //           ],
  //         );
  //       },
  //     );
  //   }
  //   // Request storage permission
  //   //   var status = await Permission.manageExternalStorage.request();
  //   //   if (status.isGranted) {
  //   //     // Permission is granted, proceed to save PDF
  //   //     final pdf = pw.Document();
  //   //     final imageBytes = await convertWidgetToImage();
  //   //     pdf.addPage(pw.Page(
  //   //       build: (context) {
  //   //         return pw.Image(pw.MemoryImage(imageBytes));
  //   //       },
  //   //     ));

  //   //     // Define the target directory path
  //   //     final targetDirectory = Directory('/storage/emulated/0/DCIM/CV');
  //   //     targetDirectory.createSync(recursive: true);

  //   //     // Define the PDF file path within the target directory
  //   //     final file = File('${targetDirectory.path}/cv.pdf');
  //   //     print('PDF will be saved to ${file.path}');

  //   //     // Save the PDF to the file
  //   //     final pdfBytes = await pdf.save();
  //   //     await file.writeAsBytes(pdfBytes);

  //   //     print('PDF saved to ${file.path}');

  //   //     // Show a confirmation message
  //   //     showDialog(
  //   //       context: context,
  //   //       builder: (BuildContext context) {
  //   //         return AlertDialog(
  //   //           title: Text('PDF Saved'),
  //   //           content: Text('The PDF has been saved successfully.'),
  //   //           actions: <Widget>[
  //   //             TextButton(
  //   //               child: Text('OK'),
  //   //               onPressed: () {
  //   //                 Navigator.of(context).pop();
  //   //               },
  //   //             ),
  //   //           ],
  //   //         );
  //   //       },
  //   //     );

  //   // }

  //   else {
  //     // Permission denied
  //     print('Storage permission denied');
  //   }
  // }