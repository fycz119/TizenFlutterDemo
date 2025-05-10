import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

class CustomListItem extends StatelessWidget {
  final String title;
  final String content;

  const CustomListItem({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    final FocusNode focusNode = FocusNode();
    final logger = Logger();
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    content,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.info_outline),
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (context) => Focus(
                      focusNode: focusNode, 
                      autofocus: true,
                      onKeyEvent: (focusNode, event) {
                          logger.i('${event.logicalKey}');
                          if (event.logicalKey == LogicalKeyboardKey.escape) {
                            Navigator.of(context).pop();
                            return KeyEventResult.handled;
                          }
                          return KeyEventResult.ignored;
                      },
                      child: 
                        AlertDialog(
                          title: Text(title),
                          content: SingleChildScrollView(
                            child: Text(content),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('关闭'),
                            ),
                          ],
                        ),
                        ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}