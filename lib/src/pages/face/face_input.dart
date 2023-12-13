import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FaceI extends StatefulWidget {
  @override
  _FaceIState createState() => _FaceIState();
}

class _FaceIState extends State<FaceI> {
  XFile? _image;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    try {
      XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image = pickedFile;
      });
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  Future<void> _opencamera() async {
    final ImagePicker _picker = ImagePicker();
    try {
      XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
      setState(() {
        _image = pickedFile;
      });
    } catch (e) {
      print('Error opening camera: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Center(
        child: _image == null
            ? Text('No image selected.')
            : Image.file(File(_image!.path)),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Semantics(
            label: 'image_picker_from_gallery',
            child: FloatingActionButton(
              onPressed: _pickImage,
              tooltip: 'Pick Image',
              child: Icon(Icons.collections),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: FloatingActionButton(
              onPressed: _opencamera,
              tooltip: 'Pick Image',
              child: Icon(Icons.add_a_photo),
            ),
          )
        ],
      ),
    );
  }
}
