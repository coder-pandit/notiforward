// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Messages {
  final List<Message> messages;

  Messages({
    this.messages = const [],
  });

  Messages copyWith({
    List<Message>? messages,
  }) {
    return Messages(
      messages: messages ?? this.messages,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'messages': messages.map((x) => x.toMap()).toList(),
    };
  }

  factory Messages.fromMap(Map<String, dynamic> map) {
    return Messages(
      messages: List<Message>.from(
        (map['messages'] as List<int>).map<Message>(
          (x) => Message.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Messages.fromJson(String source) =>
      Messages.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Messages(messages: $messages)';

  @override
  bool operator ==(covariant Messages other) {
    if (identical(this, other)) return true;

    return listEquals(other.messages, messages);
  }
}

class Message {
  final String id;
  final String text;
  final String sender;
  final String receiver;
  final int timestamp;

  Message({
    required this.id,
    required this.text,
    required this.sender,
    required this.receiver,
    required this.timestamp,
  });

  Message copyWith({
    String? id,
    String? text,
    String? sender,
    String? receiver,
    int? timestamp,
  }) {
    return Message(
      id: id ?? this.id,
      text: text ?? this.text,
      sender: sender ?? this.sender,
      receiver: receiver ?? this.receiver,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'text': text,
      'sender': sender,
      'receiver': receiver,
      'timestamp': timestamp,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      id: map['id'] as String,
      text: map['text'] as String,
      sender: map['sender'] as String,
      receiver: map['receiver'] as String,
      timestamp: map['timestamp'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) =>
      Message.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Message(id: $id, text: $text, sender: $sender, receiver: $receiver, timestamp: $timestamp)';
  }

  @override
  bool operator ==(covariant Message other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.text == text &&
        other.sender == sender &&
        other.receiver == receiver &&
        other.timestamp == timestamp;
  }
}
