import 'package:get/get.dart';

import '../datasources/message_provider.dart';
import '../models/message_model.dart';

class MessageController extends GetxController {
  final _messageProvider = MessageProvider();

  var messages = <Message>[].obs;

  Future<List<Message>> getMessages() async {
    return (await _messageProvider.getMessageData()).messages;
  }

  @override
  void onInit() async {
    super.onInit();
    messages.bindStream(getMessages().asStream());
  }

  Future<void> addMessage(Message message) async {
    await _messageProvider.saveMessageData(message);
    update();
  }

  Future<void> removeMessage(String messageId) async {
    await _messageProvider.removeMessageData(messageId);
    update();
  }

  Future<void> removeAllMessages() async {
    await _messageProvider.clear();
    update();
  }
}
