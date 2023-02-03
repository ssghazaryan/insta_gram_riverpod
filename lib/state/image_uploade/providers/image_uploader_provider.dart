import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insta_gram_riverpod/state/image_uploade/notifiers/image_upload_notifier.dart';
import 'package:insta_gram_riverpod/state/image_uploade/typedefs/is_loading.dart';

final imageUploadeProvider = StateNotifierProvider<ImageUploadNotifier, IsLoading>(
  (ref) => ImageUploadNotifier(),
);
