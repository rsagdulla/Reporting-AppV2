import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube2/main.dart';

class UploadRota extends StatefulWidget {
  const UploadRota({Key? key}) : super(key: key);

  @override
  State<UploadRota> createState() => _UploadRotaState();
}

class _UploadRotaState extends State<UploadRota> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.arrow_back),
        ),
        body: WebView(
          initialUrl:
              "https://docs.google.com/forms/d/e/1FAIpQLSfLwZeVFtfKfEe35QFbywi_8DJQWuCQE6uKr2bV0zLm5EJ4XQ/viewform?hl=en",
          javascriptMode: JavascriptMode.unrestricted,
        ));
  }
}
