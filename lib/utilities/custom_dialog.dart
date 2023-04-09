import 'package:flutter/material.dart';

mixin CustomDialog{
  Future<void> customDialogBuilder(BuildContext context, String title, Widget content, Widget action) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: content,
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            action
          ],
        );
      },
    );
  }
}


