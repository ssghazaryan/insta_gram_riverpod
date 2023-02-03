import 'dart:io' show File;

import 'package:flutter/material.dart' as material show Image;
import 'package:insta_gram_riverpod/state/image_uploade/extensions/get_image_aspect_ratio.dart';

import '../typedefs/file_path.dart';

extension GetImageFileAspectRatio on FilePath {
  Future<double> getAspectRatio() {
    final file = File(this);
    final image = material.Image.file(file);
    return image.getAspectRatio();
  }
}
