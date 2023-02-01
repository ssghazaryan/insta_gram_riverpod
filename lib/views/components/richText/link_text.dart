import 'package:flutter/foundation.dart' show VoidCallback;
import 'package:insta_gram_riverpod/views/components/richText/base_text.dart';

class LinkText extends BaseText {
  final VoidCallback onTapped;
  const LinkText({
    required super.text,
    required this.onTapped,
    super.style,
  });
}
