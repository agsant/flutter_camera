import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter_camera/home_page.dart';

class ImagePreviewPage extends StatelessWidget {
  final String imagePath;

  ImagePreviewPage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          children: [
            Image.file(File(this.imagePath)),
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _getWrappedButton(
                    TextButton(
                      onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => HomePage(
                              imagePath: this.imagePath,
                            ),
                          ),
                          (Route<dynamic> route) => false),
                      child: Text(
                        "Continue",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  _getWrappedButton(
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        "Recapture",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getWrappedButton(Widget widget) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: widget,
      ),
    );
  }
}
