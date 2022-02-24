import 'package:flutter/material.dart';
import 'package:flutter_camera/camera_page.dart';
import 'dart:io';

class HomePage extends StatelessWidget {
  final String? imagePath;

  HomePage({this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Capture and Save"),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _getImageWidget(),
            SizedBox(height: 32),
            _getButtonCamera(context),
          ],
        ),
      ),
    );
  }

  Widget _getImageWidget() {
    if (this.imagePath == null) return Container();

    return Container(
      child: Image.file(
        File(this.imagePath ?? ""),
        width: 200,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Widget _getButtonCamera(BuildContext context) {
    return Container(
      width: 140,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.cyan),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: TextButton(
        child: Text("Open Camera"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CameraPage()),
          );
        },
      ),
    );
  }
}
