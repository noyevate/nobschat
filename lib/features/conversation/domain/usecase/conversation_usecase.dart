import 'package:nobschat/features/conversation/domain/entities/conversation_entities.dart';
import 'package:nobschat/features/conversation/domain/repository/conversation_repository.dart';

class FetchConversationUseCase {
  final ConversationRepository repository;

  FetchConversationUseCase(this.repository);


  Future<List<ConversationEntities>> call() async {
    return repository.fetchConversation();
  }

}