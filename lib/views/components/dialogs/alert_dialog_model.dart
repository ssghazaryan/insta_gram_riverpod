import 'package:flutter/material.dart';

class AlertDialogModel<T> {
  final String title;
  final String message;
  final Map<String, T> buttons;

  const AlertDialogModel({
    required this.title,
    required this.message,
    required this.buttons,
  });
}

extension Present<T> on AlertDialogModel<T> {
  Future<T?> present(BuildContext context) {
    return showDialog<T>(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: buttons.entries
              .map(
                (entry) => TextButton(
                  child: Text(
                    entry.key,
                  ),
                  onPressed: () {
                    Navigator.pop(context, entry.value);
                  },
                ),
              )
              .toList(),
        );
      },
    );
  }
}
