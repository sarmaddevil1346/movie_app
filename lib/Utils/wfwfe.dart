import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';

class MyImagePicker extends StatefulWidget {
  @override
  _MyImagePickerState createState() => _MyImagePickerState();
}

class _MyImagePickerState extends State<MyImagePicker> {
  File? _pickedImage;
  String? _imageUrl;

  Future<void> _pickImage(ImageSource source) async {
    final pickedImageFile = await ImagePicker().pickImage(source: source);

    if (pickedImageFile == null) {
      return;
    }

    final pickedImage = File(pickedImageFile.path);

    setState(() {
      _pickedImage = pickedImage;
    });

    // Call a function to upload the image to Firestore Cloud Storage
    await _uploadImageToFirestore(_pickedImage!);
  }

  Future<void> _uploadImageToFirestore(File imageFile) async {
    try {
      // Upload image to Firestore Cloud Storage
      final ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('images')
          .child('${DateTime.now()}.jpg');

      await ref.putFile(imageFile);

      // Once upload is complete, get the download URL
      final imageUrl = await ref.getDownloadURL();

      // Delete previous image if exists
      if (_imageUrl != null) {
        await firebase_storage.FirebaseStorage.instance
            .refFromURL(_imageUrl!)
            .delete();
      }

      // Update the image URL in Firestore database
      await FirebaseFirestore.instance
          .collection('images')
          .doc('image_url')
          .set({
        'url': imageUrl,
      });

      // Now you can save this URL to Firestore or use it wherever you need
      // For demonstration purposes, let's just print the URL
      print('Uploaded image URL: $imageUrl');

      setState(() {
        _imageUrl = imageUrl;
      });
    } catch (error) {
      print('Error uploading image: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Picker"),
      ),
      body: Center(
        child: _imageUrl == null
            ? Text("No image selected")
            : Image.network(_imageUrl!),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => _pickImage(ImageSource.gallery),
            tooltip: 'Pick Image from Gallery',
            child: Icon(Icons.photo_library),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () => _pickImage(ImageSource.camera),
            tooltip: 'Take a Photo',
            child: Icon(Icons.camera_alt),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyImagePicker(),
  ));
}
