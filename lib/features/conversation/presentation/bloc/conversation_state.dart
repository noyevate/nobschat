import 'package:nobschat/features/conversation/domain/entities/conversation_entities.dart';

abstract class ConversationState {}

class ConversationInitial extends ConversationState {}

class ConversationLoading extends ConversationState {}

class ConversationLoaded extends ConversationState {
  final List<ConversationEntities> conversation;

  ConversationLoaded(this.conversation);
}

class ConversationError extends ConversationState {
  final String message;

  ConversationError(this.message);
}