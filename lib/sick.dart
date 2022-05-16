import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Sick extends StatefulWidget {
  @override
  _SickState createState() => _SickState();
}

class _SickState extends State<Sick> {
  late WebViewController _myController;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
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
        body: WebView(
          initialUrl:
              "https://docs.google.com/forms/d/e/1FAIpQLSc97qIow9x86LChycIURgWkkFfK5iSyI9Z2sRMsBRB_rKgqpg/viewform?hl=en",
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
      ),
    );
  }
}
