import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ensenarte/models/community.dart';

const String COMMUNITIES_COLLECTION_REF = "communities";

class CommunitiesService {
  final firestore = FirebaseFirestore.instance;
  late final CollectionReference communitiesRef;

  CommunitiesService() {
    communitiesRef = firestore
        .collection(COMMUNITIES_COLLECTION_REF)
        .withConverter<Community>(
          fromFirestore: (snapshots, _) => Community.fromJson(
            snapshots.data()!,
          ),
          toFirestore: (community, _) => community.toJson(),
        );
  }

  Stream<QuerySnapshot> getCommunities() {
    return communitiesRef.snapshots();
  }
}
