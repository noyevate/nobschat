import 'package:nobschat/features/conversation/domain/entities/conversation_entities.dart';

class ConversationModel extends ConversationEntities {
  ConversationModel(
      {required super.id,
      required super.participantName,
      required super.lastMessage,
      required super.lastMessageTime});

  factory ConversationModel.fromJson(Map<String, dynamic> json) {
    return ConversationModel(
      id: json['conversation_id'],
      participantName: json['participant_name'],
      lastMessage: json['last_message'],
      lastMessageTime: DateTime.parse(json['lat_message_time']),
    );
  }
}
