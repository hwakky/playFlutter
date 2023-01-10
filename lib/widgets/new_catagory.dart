import 'dart:io';

import 'package:flutter/material.dart';

class NewCategory extends StatefulWidget {
  final Function addCat;
  NewCategory(this.addCat);

  @override
  State<NewCategory> createState() => _NewCategorystate();
}

class _NewCategorystate extends State<NewCategory> {
  final categoryController = TextEditingController();

  void submitData() {
    final enteredCat = categoryController.text;

    if (enteredCat.isEmpty) {
      return;
    }
    widget.addCat(enteredCat);
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
                TextField(
                  decoration: InputDecoration(labelText: 'Category Name'),
                  controller: categoryController,
                  onSubmitted: (_) => submitData(),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextButton(
                    child: Text('Add Category'),
                    style: TextButton.styleFrom(shadowColor: Colors.green),
                    onPressed: submitData,
                  ),
                )
              ],
            )));
  }
}
