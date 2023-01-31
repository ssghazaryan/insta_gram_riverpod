import 'package:firebase_core/firebase_core.dart';
import 'package:insta_gram_riverpod/state/contsants/firebase_collection_name.dart';
import 'package:insta_gram_riverpod/state/contsants/firebase_field_name.dart';
import 'package:insta_gram_riverpod/state/posts/typedefs/user_id.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:insta_gram_riverpod/state/user_info/models/user_info_payload.dart';

class UserInfoStorage {
  const UserInfoStorage();

  Future<bool> saveUserInfo({
    required UserId userId,
    required String displayName,
    required String? email,
  }) async {
    try {
      // fist check if we have this user in firestore
      final userInfo = await FirebaseFirestore.instance
          .collection(
            FirebaseCollectionName.users,
          )
          .where(
            FirebaseFieldName.userId,
            isEqualTo: userId,
          )
          .limit(1)
          .get();

      if (userInfo.docs.isNotEmpty) {
        await userInfo.docs.first.reference.update({
          FirebaseFieldName.displayName: displayName,
          FirebaseFieldName.email: email ?? ''
        });
        return true;
      }

      final payload = UserInfoPayload(
        userId: userId,
        displayName: displayName,
        email: email,
      );

      await FirebaseFirestore.instance
          .collection(FirebaseCollectionName.users)
          .add(
            payload,
          );
      return true;
    } catch (e) {
      return false;
    }
  }
}
