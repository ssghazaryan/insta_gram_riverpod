import 'dart:collection';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insta_gram_riverpod/state/post_settings/models/post_settings.dart';

class PostSettingsNotifire extends StateNotifier<Map<PostSetting, bool>> {
  PostSettingsNotifire()
      : super(
          UnmodifiableMapView(
            {
              for (final settings in PostSetting.values) settings: true,
            },
          ),
        );

  void setSetting(
    PostSetting setting,
    bool value,
  ) {
    final existingValue = state[setting];

    if (existingValue == null || existingValue == value) {
      return;
    }
    state = Map.unmodifiable(
      Map.from(state)..[setting] = value,
    );
  }
}
