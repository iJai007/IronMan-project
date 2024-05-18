import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

const url4 = 'http://192.168.29.157:8000';
const url5 = 'http://192.168.0.108:8000';

class Predict extends StatefulWidget {
  const Predict({super.key});

  @override
  State<Predict> createState() => _PredictState();
}

class _PredictState extends State<Predict> {
  String prediction = 'Processing';
  String confidence = '';

  XFile? image;

  Future<void> _clickImage() async {
    final clickedimage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (clickedimage != null) {
      setState(() {
        image = clickedimage;
      });
      var req = http.MultipartRequest('POST', Uri.parse('$url4/predict'));
      req.files
          .add(await http.MultipartFile.fromPath('file', clickedimage.path));
      var res = await req.send();
      var out = await http.Response.fromStream(res);
      Map<String, dynamic> data = json.decode(out.body);
      setState(() {
        prediction = data.entries.elementAt(0).value;
        confidence = data.entries.elementAt(1).value.toString();
      });
      print(out.body);
    }
  }

  Future<void> _pickImage() async {
    final pickedimage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedimage != null) {
      image = pickedimage;
      var req = http.MultipartRequest('POST', Uri.parse('$url4/predict'));
      req.files
          .add(await http.MultipartFile.fromPath('file', pickedimage.path));
      var res = await req.send();
      var out = await http.Response.fromStream(res);
      print(out.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: BottomAppBar(
        color: const Color.fromARGB(255, 0, 74, 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
                onPressed: _clickImage,
                icon: const Icon(Icons.camera_alt_rounded),
                label: const Text('Camera')),
            ElevatedButton.icon(
                onPressed: _pickImage,
                icon: const Icon(Icons.photo_library_rounded),
                label: const Text('Gallery'))
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Stain Detection'),
      ),
      body: ListView(
        children: [
          (image != null)
              ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.file(
                        File(image!.path),
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    Text(
                      '$prediction\n\n$confidence',
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.w700),
                    )
                  ],
                )
              : const Column(
                  children: [
                    Icon(
                      Icons.image,
                      size: 250,
                    ),
                    Text(
                      'Select an image',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
        ],
      ),
    );
  }
}
