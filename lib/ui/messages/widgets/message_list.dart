import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/controllers/message_controller.dart';

class MessagesList extends StatelessWidget {
  MessagesList({super.key});
  final _controller = Get.find<MessageController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
          itemCount: _controller.messages.length,
          itemBuilder: (context, index) {
            final message = _controller.messages[index];
            return ListTile(
              title: Text(message.sender),
              subtitle: Text(message.receiver),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  _controller.removeMessage(message.id);
                },
              ),
            );
          },
        ));
  }
}
