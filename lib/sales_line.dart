import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:youtube2/lists.dart';

class SalesLine extends StatefulWidget {
  const SalesLine({Key? key}) : super(key: key);

  @override
  State<SalesLine> createState() => _SalesLineState();
}

class _SalesLineState extends State<SalesLine> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
        child: Container(
          height: 60,
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: DropdownSearch<String>(
                  mode: Mode.DIALOG,
                  showSelectedItems: true,
                  showSearchBox: true,
                  items: product,
                  dropdownSearchDecoration: const InputDecoration(
                    labelText: "Product",
                  ),
                  onChanged: print,
                  selectedItem: "",
                ),
              ),
              Expanded(
                flex: 2,
                child: DropdownSearch<String>(
                  mode: Mode.DIALOG,
                  showSelectedItems: true,
                  showSearchBox: true,
                  items: color,
                  dropdownSearchDecoration: const InputDecoration(
                    labelText: "Color",
                  ),
                  onChanged: print,
                  selectedItem: "",
                ),
              ),
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  initialValue: "1",
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Qty',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
