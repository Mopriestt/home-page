import 'dart:convert';

import 'package:intl/intl.dart';

class ChatThreadModel {
  final int? threadId;
  final int? quoteId;
  final String message;
  final String? postTime;
  final bool isLocal;

  ChatThreadModel({
    required this.message,
    required this.isLocal,
    this.threadId,
    this.postTime,
    this.quoteId,
  });

  // postTime":{"date":{"year":2022,"month":10,"day":30},"time":{"hour":2,"minute":26,"second":27,"nano":0}}
  static String? timeMapToTimeString(Map<String, dynamic>? dateTimeMap) {
    if (dateTimeMap == null) return null;

    final dayMap = dateTimeMap['date']! as Map<String, dynamic>;
    final timeMap = dateTimeMap['time']! as Map<String, dynamic>;
    final dateTime = DateTime.utc(
      dayMap['year']!,
      dayMap['month']!,
      dayMap['day']!,
      timeMap['hour']!,
      timeMap['minute']!,
      timeMap['second']!,
    );
    return DateFormat("yyyy-MM-dd HH:MM").format(dateTime.toLocal());
  }

  static ChatThreadModel fromJsonMap(Map<String, dynamic> fields) {
    return ChatThreadModel(
      isLocal: true,
      threadId: fields['threadId'],
      quoteId: fields['quoteId'],
      postTime: timeMapToTimeString(fields['postTime']),
      message: fields['message'] ?? '...message lost...',
    );
  }

  static ChatThreadModel fromJsonString(String jsonString) {
    final fields = jsonDecode(jsonString) as Map<String, dynamic>;
    return fromJsonMap(fields);
  }
}
