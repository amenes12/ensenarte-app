import 'package:ensenarte/components/list_component.dart';
import 'package:ensenarte/components/search_bar_component.dart';
import 'package:flutter/material.dart';
import 'package:ensenarte/models/learning_item.dart';

class DictionaryWidget extends StatefulWidget {
  List<LearningItem> availableDictionaryWords;

  DictionaryWidget({super.key, required this.availableDictionaryWords});

  @override
  State<DictionaryWidget> createState() => _DictionaryWidgetState();
}

class _DictionaryWidgetState extends State<DictionaryWidget> {
  List<LearningItem> filteredDictionaryWords = [];

  @override
  void initState() {
    super.initState();
    filteredDictionaryWords = widget.availableDictionaryWords;
  }

  void onSearchInputChanged(String searchInput) {
    setState(() {
      filteredDictionaryWords = widget.availableDictionaryWords
          .where((learningItem) => learningItem.title
              .toLowerCase()
              .startsWith(searchInput.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SearchBarComponent(
          onSearchInputChanged: onSearchInputChanged,
        ),
        Expanded(
          child: ListComponent(elements: filteredDictionaryWords),
        ),
      ],
    );
  }
}
