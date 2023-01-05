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
  String dropdowncategories = 'Sport';
  var items = [
    'Sport',
    'Movie',
    'Food',
    'Entertainment',
  ];

  // Image
  Widget buildButton({
    required String title,
    required IconData icon,
    required VoidCallback onClicked,
  }) =>
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size.fromHeight(56),
            primary: Colors.white,
            onPrimary: Colors.black,
            textStyle: TextStyle(fontSize: 20)),
        child: Row(children: [
          Icon(icon, size: 28),
          const SizedBox(width: 16),
          Text(title),
        ]),
        onPressed: onClicked,
      );

  Future pickImage() async {
    await ImagePicker().pickImage(source: ImageSource.gallery);
  }
  // ************************

  void submitData() {
    final enteredTag = tagController.text;

    if (enteredTag.isEmpty) {
      return;
    }

    // widget.addTx(titleController.text, double.parse(amountController.text));
    widget.addTag(enteredTag);
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
                buildButton(
                  title: 'Pick Gallery',
                  icon: Icons.image_outlined,
                  onClicked: () => pickImage(),
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
