import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insta_gram_riverpod/views/components/animations/animations.dart';
import 'package:insta_gram_riverpod/views/components/posts/posts_gridview.dart';
import 'package:insta_gram_riverpod/views/components/strings.dart';

import '../../../state/posts/providers/user_posts_provider.dart';
import '../../components/animations/empty_animation_view.dart';

class UserPostsView extends ConsumerWidget {
  const UserPostsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(userPostsProvier);

    return RefreshIndicator(
      onRefresh: () {
        ref.refresh(userPostsProvier);
        return Future.delayed(
          const Duration(seconds: 1),
        );
      },
      child: posts.when(
        data: (posts) {
          if (posts.isEmpty) {
            return const EmptyContentWithTextView(
              text: Strings.youHaveNoPosts,
            );
          } else {
            return PostsGridview(
              posts: posts,
            );
          }
        },
        error: (error, stackTrace) {
          return const ErrorAnimationView();
        },
        loading: () {
          return const LoadingAnimationView();
        },
      ),
    );
  }
}
