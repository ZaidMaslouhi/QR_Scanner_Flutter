import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';

class Scan extends StatefulWidget {
  @override
  _ScanState createState() => new _ScanState();
}

class _ScanState extends State<Scan> {
  String qrResult = "Not yet Scanned !";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Result:",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              qrResult,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            FlatButton(
              padding: EdgeInsets.all(15),
              onPressed: () async {
                var Scn = await BarcodeScanner.scan();
                setState(() {
                  qrResult = Scn.rawContent.toString();
                });
              },
              child: Text('Scan QR Code'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color: Colors.teal, width: 3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
