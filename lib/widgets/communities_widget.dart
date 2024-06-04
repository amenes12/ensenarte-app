import 'package:ensenarte/components/label_component.dart';
import 'package:ensenarte/services/communities_service.dart';
import 'package:flutter/material.dart';

class CommunitiesWidget extends StatefulWidget {
  const CommunitiesWidget({super.key});

  @override
  State<CommunitiesWidget> createState() => _CommunitiesWidgetState();
}

class _CommunitiesWidgetState extends State<CommunitiesWidget> {
  final CommunitiesService communitiesService = CommunitiesService();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return StreamBuilder(
      stream: communitiesService.getCommunities(),
      builder: (context, snapshots) {
        if (snapshots.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshots.hasData || snapshots.data!.docs.isEmpty) {
          return const Center(
            child: Text("No hay comunidades disponibles"),
          );
        }
        List communities = snapshots.data!.docs;

        return SingleChildScrollView(
          child: Column(
            children: communities.map<Widget>((community) {
              return Container(
                height: height * 0.20,
                width: double.infinity,
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 16.0,
                ),
                child: Material(
                  color: Colors.white,
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(14.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 24.0,
                            horizontal: 12.0,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LabelComponent(
                                text: community["name"],
                                icon: Icons.group,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                              LabelComponent(
                                  text: community["location"],
                                  icon: Icons.home,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.normal),
                              LabelComponent(
                                text: community["contactNumber"],
                                icon: Icons.phone,
                                fontSize: 12.0,
                                fontWeight: FontWeight.normal,
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: community["imageUrl"] != null
                            ? Image.network(community["imageUrl"],
                                fit: BoxFit.fitHeight)
                            : const Icon(Icons.image,
                                size: 60.0,
                                color: Colors.grey), // Placeholder icon
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}