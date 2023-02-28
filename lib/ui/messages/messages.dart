import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/controllers/message_controller.dart';
import 'widgets/message_list.dart';

class MessagesPage extends StatelessWidget {
  MessagesPage({super.key});
  final _controller = Get.put(MessageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MessagesList(),
      appBar: AppBar(
        title: const Text('Messages'),
        actions: [
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              _controller.removeAllMessages();
            },
          ),
        ],
      ),
    );
  }
}
