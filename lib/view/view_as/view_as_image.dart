import 'dart:typed_data';

import 'package:cv/template/sizedBox.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class ViewCV extends StatelessWidget {
  ViewCV({required this.imageData});
  final Uint8List imageData;
  Future<void> saveImageToDevice() async {
    final result = await ImageGallerySaver.saveImage(imageData);
    if (result['isSuccess']) {
      // Image saved successfully
      print('Image saved to gallery!');
    } else {
      // Saving image failed
      print('Failed to save image to gallery.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View CV'),
        centerTitle: true,
      ),
      body: Container(
          color: Colors.grey[200],
          width: double.infinity,
          child: InteractiveViewer(child: Image.memory(imageData))),
      floatingActionButton: FloatingActionButton(
        onPressed: saveImageToDevice,
        child: Text('Save to Gallery'),
      ),
    );
  }
}
