import 'package:nobschat/features/conversation/data/data_source/conversation_remote_datasource.dart';
import 'package:nobschat/features/conversation/domain/entities/conversation_entities.dart';
import 'package:nobschat/features/conversation/domain/repository/conversation_repository.dart';

class ConversationRepositoryImpl implements ConversationRepository  {

  final ConversationRemoteDataSource conversationRemoteDataSource;

  ConversationRepositoryImpl({required this.conversationRemoteDataSource});
  
  @override
  Future<List<ConversationEntities>> fetchConversation() async{
    return await conversationRemoteDataSource.fetchConversation();
  }
  
}