import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insta_gram_riverpod/state/image_uploade/models/image_with_aspectratio.dart';
import 'package:insta_gram_riverpod/state/image_uploade/providers/thumbnail_provider.dart';
import 'package:insta_gram_riverpod/views/components/animations/animations.dart';

import '../../state/image_uploade/models/thumbnail_request.dart';

class FileThumbnailView extends ConsumerWidget {
  final ThumbnailRequest thumbnailRequest;

  const FileThumbnailView({
    Key? key,
    required this.thumbnailRequest,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final thumbnail = ref.watch(thumbnailProvider(thumbnailRequest));

    return thumbnail.when(
      error: (error, stackTrace) {
        return const SmallErrorAnimationView();
      },
      loading: () {
        return const LoadingAnimationView();
      },
      data: (imageWithAspectRatio) {
        return AspectRatio(
          aspectRatio: imageWithAspectRatio.aspectRatio,
          child: imageWithAspectRatio.image,
        );
      },
    );
  }
}
