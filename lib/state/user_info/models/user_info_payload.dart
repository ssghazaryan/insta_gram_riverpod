import 'dart:collection';

import 'package:insta_gram_riverpod/state/contsants/firebase_field_name.dart';
import 'package:insta_gram_riverpod/state/posts/typedefs/user_id.dart';

class UserInfoPayload extends MapView<String, String> {
  UserInfoPayload({
    required UserId userId,
    required String? displayName,
    required String? email,
  }) : super(
          {
            FirebaseFieldName.userId: userId,
            FirebaseFieldName.displayName: displayName ?? '',
            FirebaseFieldName.email: email ?? '',
          },
        );
}
