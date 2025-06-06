import 'package:nobschat/features/conversation/domain/entities/conversation_entities.dart';

abstract class ConversationRepository {
  Future<List<ConversationEntities>> fetchConversation();
}