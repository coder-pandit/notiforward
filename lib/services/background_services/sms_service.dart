import 'package:get/get.dart';
import 'package:telephony/telephony.dart';
import 'package:uuid/uuid.dart';

import '../../data/controllers/forward_group_controller.dart';
import '../../data/controllers/message_controller.dart';
import '../../data/models/message_model.dart';

class SmsService extends GetxService {
  final _forwardGroupController = ForwardGroupController();
  final _messageController = MessageController();

  Future<SmsService> init() async {
    final Telephony telephony = Telephony.instance;
    telephony.listenIncomingSms(
      onNewMessage: (SmsMessage message) async {
        if (message.body == null) {
          return;
        }

        final groups = _forwardGroupController.forwardGroups;
        if (groups.isEmpty) {
          return;
        }

        for (final group in groups) {
          if (RegExp(group.pattern).hasMatch(message.body!)) {
            for (final number in group.forwardTo) {
              telephony.sendSmsByDefaultApp(
                to: number,
                message: message.body!,
              );

              // Save message to database
              _messageController.addMessage(Message(
                id: message.id?.toString() ?? const Uuid().v4().toString(),
                text: message.body!,
                sender: message.address ?? '',
                receiver: number,
                timestamp:
                    message.date ?? DateTime.now().millisecondsSinceEpoch,
              ));
            }
          }
        }
      },
      listenInBackground: true,
    );
    return this;
  }
}
