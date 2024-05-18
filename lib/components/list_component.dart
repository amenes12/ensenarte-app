import 'package:flutter/material.dart';
import 'package:myapp/utils/list_element.dart';

class ListComponent extends StatelessWidget {
  final List<ListElement> elements;

  const ListComponent({super.key, required this.elements});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: elements.length,
      itemBuilder: (context, index) {
        final element = elements[index];
        return GestureDetector(
          onTap: (){ 
            /* 
              to-do: navigation to each each screen of the element
              For those cases, the element should have a resource to load, it will have (or not) actions, depending of its nature
            */
          },
          child: ListTile(
          title: Text(element.title),
          leading: Image.asset(element.assetName),
        ),
        );
      },
    );
  }
}
