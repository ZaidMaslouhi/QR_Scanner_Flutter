import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Generate extends StatefulWidget {
  @override
  _GenerateState createState() => new _GenerateState();
}

class _GenerateState extends State<Generate> {
  String qrData = "Zaid Elmaslouhi";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generate'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(right: 20, left: 20, top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              QrImage(data: qrData),
              SizedBox(height: 10),
              Text("Get Your data/link to the QR Code"),
              TextField(
                controller: qrText,
                decoration: InputDecoration(
                  hintText: "Enter The Data/Link",
                ),
              ),
              SizedBox(height: 10),
              FlatButton(
                padding: EdgeInsets.all(15),
                onPressed: () {
                  qrText.text.isEmpty
                      ? setState(() => qrData = 'Zaid Elmaslouhi')
                      : setState(() => qrData = qrText.text);
                },
                child: Text("Generate Your QR Code"),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Colors.teal, width: 3),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final qrText = TextEditingController();
}
