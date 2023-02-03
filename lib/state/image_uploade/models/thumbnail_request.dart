import 'dart:io';

import 'package:insta_gram_riverpod/state/image_uploade/models/file_type.dart';

class ThumbnailRequest {
  final File file;
  final FileType fileType;

  ThumbnailRequest({
    required this.file,
    required this.fileType,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThumbnailRequest &&
          runtimeType == other.runtimeType &&
          file == other.file &&
          fileType == other.fileType;

  @override
  int get hashCode => Object.hashAll(
        [
          runtimeType,
          file,
          fileType,
        ],
      );
}
