import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Rota extends StatefulWidget {
  @override
  _RotaState createState() => _RotaState();
}

class _RotaState extends State<Rota> {
  late WebViewController _myController;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.arrow_back),
        ),
        body: Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            WebView(
              initialUrl:
                  "https://docs.google.com/forms/d/e/1FAIpQLSfLwZeVFtfKfEe35QFbywi_8DJQWuCQE6uKr2bV0zLm5EJ4XQ/viewform?hl=en",
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (controller) {
                _myController = controller;
              },
              onPageFinished: (initialUrl) {
                _myController.evaluateJavascript(
                    "document.getElementsByClassName('v1CNvb sId0Ce')[0].style.display='none';");
                _myController.evaluateJavascript(
                    "document.getElementsByClassName('I3zNcc yF4pU')[0].style.display='none';");
                _myController.evaluateJavascript(
                    "document.getElementsByClassName('Y0xAIe BNL9Bd NpcyEe-n5T17d-Bz112c-N7Eqid-BvMwwf')[0].style.display='none';");
                _myController.evaluateJavascript(
                    "document.getElementsByClassName('T2dutf')[0].style.display='none';");
                _myController.evaluateJavascript(
                    "document.getElementsByClassName('nYdzXd')[0].style.display='none';");
                _myController.evaluateJavascript(
                    "document.getElementsByClassName('DqBBlb')[0].style.display='none';");
                _myController.evaluateJavascript(
                    "document.getElementsByClassName('c2gzEf')[0].style.display='none';");
              },
            ),
            Visibility(
              visible: visible,
              child: Container(
                child: Text('dsdsdsdsds'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
