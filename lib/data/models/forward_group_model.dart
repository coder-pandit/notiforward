import 'dart:convert';

import 'package:flutter/foundation.dart';

class ForwardGroups {
  final List<ForwardGroup> forwardGroups;

  ForwardGroups({
    this.forwardGroups = const [],
  });

  ForwardGroups copyWith({
    List<ForwardGroup>? forwardGroups,
  }) {
    return ForwardGroups(
      forwardGroups: forwardGroups ?? this.forwardGroups,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'forwardGroups': forwardGroups.map((x) => x.toMap()).toList(),
    };
  }

  factory ForwardGroups.fromMap(Map<String, dynamic> map) {
    return ForwardGroups(
      forwardGroups: List<ForwardGroup>.from(
        (map['forwardGroups'] as List<int>).map<ForwardGroup>(
          (x) => ForwardGroup.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ForwardGroups.fromJson(String source) =>
      ForwardGroups.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ForwardGroups(forwardGroups: $forwardGroups)';

  @override
  bool operator ==(covariant ForwardGroups other) {
    if (identical(this, other)) return true;

    return listEquals(other.forwardGroups, forwardGroups);
  }
}

class ForwardGroup {
  final String id;
  final List<String> forwardTo;
  // r'^36(01|02|03)\S{12}$' -> 01 or 02 or 03
  final String pattern;

  ForwardGroup({
    required this.id,
    required this.forwardTo,
    required this.pattern,
  });

  ForwardGroup copyWith({
    String? id,
    List<String>? forwardTo,
    String? regex,
  }) {
    return ForwardGroup(
      id: id ?? this.id,
      forwardTo: forwardTo ?? this.forwardTo,
      pattern: regex ?? this.pattern,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'forwardTo': forwardTo,
      'regex': pattern,
    };
  }

  factory ForwardGroup.fromMap(Map<String, dynamic> map) {
    return ForwardGroup(
      id: map['id'] as String,
      forwardTo: List<String>.from((map['forwardTo'] as List<String>)),
      pattern: map['regex'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ForwardGroup.fromJson(String source) =>
      ForwardGroup.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ForwardGroup(id: $id, forwardTo: $forwardTo, regex: $pattern)';

  @override
  bool operator ==(covariant ForwardGroup other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        listEquals(other.forwardTo, forwardTo) &&
        other.pattern == pattern;
  }
}
