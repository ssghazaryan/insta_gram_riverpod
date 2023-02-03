import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../image_uploade/typedefs/is_loading.dart';
import '../notifiers/send_comment_notifier.dart';

final sendCommentProvider =
    StateNotifierProvider<SendCommentNotifier, IsLoading>(
  (ref) => SendCommentNotifier(),
);
