import 'package:flutter/material.dart';
import 'package:play_flutter/widgets/new_catagory.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import 'models/category.dart';
import 'models/tag.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.amber,
          fontFamily: 'Anton',
          textTheme: ThemeData.light().textTheme.copyWith(
              titleMedium: TextStyle(
                  fontFamily: 'Anton',
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  titleMedium: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 20,
                      fontWeight: FontWeight.bold)))),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Tag> _adminTag = [];
  final List<Tag> _adminCat = [];

  // Tag
  void _addNewTag(String txTag, String txCate) {
    final newTx = Tag(
      tagName: txTag,
      tagCategories: txCate,
    );

    setState(() {
      _adminTag.add(newTx);
    });
  }

  void _startAddNewTag(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTag(_addNewTag),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  // Category
  void _addNewCategory(String txCate) {
    final newCat = Category(
      category: txCate,
    );

    // setState(() {
    //   _adminCat.add(newCat);
    // });
  }

  void _startAddNewCategory(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewCategory(_addNewCategory),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TagList(_adminTag),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: (() => _startAddNewCategory(context)),
                child: Text("Category"),
                style: OutlinedButton.styleFrom(foregroundColor: Colors.red),
              ),
              OutlinedButton.icon(
                onPressed: () => _startAddNewTag(context),
                icon: Icon(Icons.add),
                label: Text("Tag"),
                style: OutlinedButton.styleFrom(foregroundColor: Colors.green),
              ),
            ],
          )
        ],
      ),
    );
  }
}
