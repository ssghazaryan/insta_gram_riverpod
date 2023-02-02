import 'package:flutter/material.dart';
import 'package:insta_gram_riverpod/state/posts/models/post.dart';
import 'package:insta_gram_riverpod/views/components/posts/post_thumbnail_view.dart';

class PostsGridview extends StatelessWidget {
  final Iterable<Post> posts;
  const PostsGridview({
    super.key,
    required this.posts,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final item = posts.elementAt(index);
        return PostThumbnailView(
          post: item,
          onTapped: (){
            
          },
        );
      },
    );
  }
}
