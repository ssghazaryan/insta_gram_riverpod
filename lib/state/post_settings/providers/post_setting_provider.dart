import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insta_gram_riverpod/state/post_settings/models/post_settings.dart';

import '../notifiers/post_settings_notifier.dart';

final postSettingsProvider =
    StateNotifierProvider<PostSettingsNotifire, Map<PostSetting, bool>>(
  (ref) => PostSettingsNotifire(),
);
