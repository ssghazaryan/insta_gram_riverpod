import 'package:flutter/material.dart';
import 'package:insta_gram_riverpod/views/components/posts/post_image_view.dart';
import 'package:insta_gram_riverpod/views/components/posts/post_video_view.dart';

import '../../../state/image_uploade/models/file_type.dart';
import '../../../state/posts/models/post.dart';

class PostImageOrVideoView extends StatelessWidget {
  final Post post;
  const PostImageOrVideoView({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    switch (post.fileType) {
      case FileType.image:
        return PostImageView(
          post: post,
        );
      case FileType.video:
        return PostVideoView(
          post: post,
        );
      default:
        return const SizedBox();
    }
  }
}
