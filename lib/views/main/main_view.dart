import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insta_gram_riverpod/state/auth/providers/auth_state_provider.dart';
import 'package:insta_gram_riverpod/views/components/dialogs/alert_dialog_model.dart';
import 'package:insta_gram_riverpod/views/components/strings.dart';
import 'package:insta_gram_riverpod/views/tabs/user_posts/user_posts_view.dart';
import '../../state/image_uploade/helpers/image_picker_helper.dart';
import '../../state/image_uploade/models/file_type.dart';
import '../../state/post_settings/providers/post_setting_provider.dart';
import '../components/dialogs/logout_dialog.dart' show LogoutDialog;
import '../create_new_post/create_new_post_view.dart';
import '../tabs/home/home_view.dart';
import '../tabs/search/search_view.dart';

class MainView extends ConsumerStatefulWidget {
  const MainView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainViewState();
}

class _MainViewState extends ConsumerState<MainView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            Strings.appName,
          ),
          actions: [
            IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.film,
              ),
              onPressed: () async {
                // pick a video first
                final videoFile =
                    await ImagePickerHelper.pickVideoFromGallery();
                if (videoFile == null) {
                  return;
                }

                // reset the postSettingProvider
                ref.refresh(postSettingsProvider);

                // go to the screen to create a new post
                if (!mounted) {
                  return;
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CreateNewPostView(
                      fileType: FileType.video,
                      fileToPost: videoFile,
                    ),
                  ),
                );
              },
            ),
            IconButton(
              onPressed: () async {
                // pick an image first
                final imageFile =
                    await ImagePickerHelper.pickImageFromGallery();
                if (imageFile == null) {
                  return;
                }

                // reset the postSettingProvider
                ref.refresh(postSettingsProvider);

                // go to the screen to create a new post
                if (!mounted) {
                  return;
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CreateNewPostView(
                      fileType: FileType.image,
                      fileToPost: imageFile,
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.add_photo_alternate_outlined,
              ),
            ),
            IconButton(
              onPressed: () async {
                final shouldLogOut =
                    await const LogoutDialog().present(context).then(
                          (value) => value ?? false,
                        );
                if (shouldLogOut) {
                  await ref.read(authStateProvider.notifier).logOut();
                }
              },
              icon: const Icon(
                Icons.logout,
              ),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.person,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.search,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.home,
                ),
              ),
            ],
          ),
        ),
        body:  const TabBarView(
          children: [
            UserPostsView(),
            SearchView(),
            HomeView(),
          ],
        ),
      ),
    );
  }
}
