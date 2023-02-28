import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/message_model.dart';

class MessageProvider {
  final _prefs = Get.find<SharedPreferences>(tag: 'shared_prefs');
  final _messageDataKey = 'message_data';

  Future<void> saveMessageData(Message message) async {
    final messages = await getMessageData();
    if (messages == null) {
      await _prefs.setString(
        _messageDataKey,
        Messages(messages: [message]).toJson(),
      );
      return;
    }

    final index = messages.messages.indexWhere(
      (element) => element.id == message.id,
    );

    if (index == -1) {
      messages.messages.add(message);
    } else {
      messages.messages[index] = message;
    }

    await _prefs.setString(_messageDataKey, messages.toJson());
  }

  Future<Messages> getMessageData() async {
    final message = _prefs.getString(_messageDataKey);
    return message != null
        ? Messages.fromJson(message)
        : Messages(messages: []);
  }

  Future<void> removeMessageData(String messageId) async {
    final messages = await getMessageData();
    if (messages == null) {
      return;
    }

    messages.messages.removeWhere((element) => element.id == messageId);
    await _prefs.setString(_messageDataKey, messages.toJson());
  }

  Future<void> clear() async {
    await _prefs.remove(_messageDataKey);
  }
}
