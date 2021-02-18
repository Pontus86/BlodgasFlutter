import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_vision/flutter_mobile_vision.dart';
import 'dart:developer';
import 'dart:developer' as developer;

class OCRPage extends StatefulWidget {
  @override
  _OCRPageState createState() => _OCRPageState();
}

class _OCRPageState extends State<OCRPage> {
  int _ocrCamera = FlutterMobileVision.CAMERA_BACK;
  String _text = "TEXT";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('OCR In Flutter'),
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(_text,style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              ),
              Center(
                child: RaisedButton(
                  onPressed: _read,
                  child: Text('Scanning',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<Null> _read() async {
    List<OcrText> texts = [];
    try {
      texts = await FlutterMobileVision.read(
          showText: true,
          camera: _ocrCamera,
          multiple: true,
          //flash: true,
          waitTap: false,
          fps: 20.0
      );
      setState(() {
        String allText = "";
        for(int i = 0; i <texts.length; i++){
          allText += "\n" + texts[i].value;
        }
        _text = allText;
        // _text = texts[0].value;
        developer.log('log me', name: 'my.app.category');
      });
    } on Exception {
      texts.add( OcrText('Failed to recognize text'));
    }
  }
}