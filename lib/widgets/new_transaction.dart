import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NewTag extends StatefulWidget {
  final Function addTag;
  NewTag(this.addTag);

  @override
  State<NewTag> createState() => _NewTagState();
}

class _NewTagState extends State<NewTag> {
  final tagController = TextEditingController();
  final tagController2 = TextEditingController();
  String dropdowncategories = 'Sport';
  var items = [
    'Sport',
    'Movie',
    'Food',
    'Entertainment',
  ];

  void submitData() {
    final enteredTag = tagController.text;
    final enteredCat = tagController.text;

    if (enteredTag.isEmpty || enteredCat.isEmpty) {
      return;
    }

    // widget.addTx(titleController.text, double.parse(amountController.text));
    widget.addTag(enteredTag, enteredCat);
    // กดenter แล้วformหาย
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Container(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        Text(
                          'Select Tag Categories',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Color.fromARGB(255, 90, 90, 90)),
                        ),
                      ],
                    ),
                  ),
                ),
                DropdownButtonFormField(
                    value: dropdowncategories,
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdowncategories = newValue!;
                      });
                    }),
                TextField(
                  decoration: InputDecoration(labelText: 'Tag Name'),
                  controller: tagController,
                  onSubmitted: (_) => submitData(),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextButton(
                    child: Text('Add Tag'),
                    style: TextButton.styleFrom(shadowColor: Colors.green),
                    onPressed: submitData,
                  ),
                )
              ],
            )));
  }
}
