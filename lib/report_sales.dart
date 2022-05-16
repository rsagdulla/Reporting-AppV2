import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:youtube2/lists.dart';
import 'package:youtube2/sales_line.dart';

class UploadSales extends StatefulWidget {
  const UploadSales({Key? key}) : super(key: key);

  @override
  State<UploadSales> createState() => _UploadSalesState();
}

int startingCount = 1;

class _UploadSalesState extends State<UploadSales> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  startingCount++;
                });
              },
              child: const Icon(Icons.add),
            ),
            SizedBox(
              height: 15,
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  if (startingCount != 0) {
                    startingCount--;
                  }
                });
              },
              child: const Icon(Icons.remove),
            ),
            SizedBox(
              height: 15,
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {});
              },
              child: const Icon(Icons.upload_rounded),
            ),
          ],
        ),
        appBar: AppBar(
          title: Text('Upload your sales'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ListView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return SalesLine();
                },
                itemCount: startingCount,
              )
            ],
          ),
        ),
      ),
    );
  }
}
