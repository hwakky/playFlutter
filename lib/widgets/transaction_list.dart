import 'package:flutter/material.dart';
import '../models/tag.dart';

class TagList extends StatelessWidget {
  final List<Tag> tags;

  TagList(this.tags);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: tags.isEmpty
            ? Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(32),
                    child: Text(
                      'No tags added yet!',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/yduck.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 5,
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: FittedBox(
                            child: Text('\$${tags[index]}}'),
                          ),
                        ),
                      ),
                      title: Text(tags[index].tagName,
                          style: Theme.of(context).textTheme.titleSmall),
                      subtitle: Text(dropdowncategories),
                    ),
                  );
                },
                itemCount: tags.length,
              ));
  }
}
