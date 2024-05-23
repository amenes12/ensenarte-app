import 'package:flutter/material.dart';
import 'package:myapp/utils/card_type.dart';
import 'package:myapp/utils/list_element.dart';

class CardComponent extends StatelessWidget {
  final String title;
  final String assetName;
  final String routeName;
  final CardType cardType;
  final List<LearningItem>? learningItems;

  const CardComponent(
      {super.key,
      required this.title,
      required this.assetName,
      required this.routeName,
      required this.cardType,
      this.learningItems});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = (cardType.name == CardType.fullCard.name)
        ? (size.width - 50)
        : ((size.width - 50) / 2);
    final height = size.height;

    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
        left: 4.0,
        right: 4.0
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              if (learningItems == null) {
                Navigator.pushNamed(context, routeName);
              } else {
                Navigator.pushNamed(
                    context, 
                    routeName,
                    arguments: {
                      'title': title,
                      'learningItems': learningItems,
                    });
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(97, 137, 255, 1),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 4),
                    blurRadius: 4,
                    color: Colors.black.withOpacity(0.25),
                  ),
                ],
              ),
              width: width,
              height: height * 0.25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16)
                      )
                    ),
                    height: height * 0.18,
                    width: double.infinity,
                    child: Image.asset(
                      assetName,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700
                      )
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

/**
 * Image.asset(
                    assetName,
                    height: height * 0.18,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
 */
