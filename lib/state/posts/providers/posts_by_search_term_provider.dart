import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../contsants/firebase_collection_name.dart';
import '../../contsants/firebase_field_name.dart';
import '../models/post.dart';

typedef SearchTerm = String;

final postsBySearchTermProvider =
    StreamProvider.family.autoDispose<Iterable<Post>, SearchTerm>(
  (ref, SearchTerm searchTerm) {
    final controller = StreamController<Iterable<Post>>();

    final sub = FirebaseFirestore.instance
        .collection(
          FirebaseCollectionName.posts,
        )
        .orderBy(
          FirebaseFieldName.createdAt,
          descending: true,
        )
        .snapshots()
        .listen(
      (snapshot) {
        final posts = snapshot.docs
            .map(
              (doc) => Post(
                json: doc.data(),
                postId: doc.id,
              ),
            )
            .where(
              (post) => post.message.toLowerCase().contains(
                    searchTerm.toLowerCase(),
                  ),
            );
        controller.sink.add(posts);
      },
    );

    ref.onDispose(() {
      sub.cancel();
      controller.close();
    });

    return controller.stream;
  },
);