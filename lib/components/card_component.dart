import 'package:flutter/material.dart';
import 'package:ensenarte/utils/card_type.dart';
import 'package:ensenarte/models/learning_item.dart';

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
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.05,
        vertical: size.height * 0.01,
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              if (learningItems == null) {
                Navigator.pushNamed(context, routeName);
              } else {
                Navigator.pushNamed(context, routeName, arguments: {
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
              height: height * 0.2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(16)),
                    ),
                    height: height * 0.16,
                    width: double.infinity,
                    child: Image.network(
                      assetName,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.04,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: size.width * 0.02,
                        top: size.height * 0.01,
                      ),
                      child: Text(
                        title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: size.height * 0.02,
                            fontWeight: FontWeight.w400),
                      ),
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
