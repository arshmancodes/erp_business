import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';
import 'dart:io';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';

class CreateQR extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CreateQRState();
}

class CreateQRState extends State<CreateQR> {
  static const double _topSectionTopPadding = 50.0;
  static const double _topSectionBottomPadding = 20.0;
  static const double _topSectionHeight = 50.0;

  GlobalKey globalKey = new GlobalKey();
  String _dataString = "Hello from this QR";
  String? _inputErrorText;

  @override
  Widget build(BuildContext context) {
    final _textController = TextEditingController(text: " ");

    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Generator'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Please enter the details of the user to create QR for"),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    label: Text("Username"),
                  ),
                ),
              ),
              QrImage(
                data: _textController.text,
                size: 200,
                backgroundColor: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    print(_textController.text);
                  });
                },
                child: Text("Create QR"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
