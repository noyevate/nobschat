import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nobschat/features/conversation/domain/entities/conversation_entities.dart';
import 'package:nobschat/features/conversation/domain/usecase/conversation_usecase.dart';
import 'package:nobschat/features/conversation/presentation/bloc/conversation_event.dart';
import 'package:nobschat/features/conversation/presentation/bloc/conversation_state.dart';

class ConversationBloc extends Bloc<ConversationEvent, ConversationState> {
  final FetchConversationUseCase fetchConversationUseCase;
  ConversationBloc( {required this.fetchConversationUseCase}) : super(ConversationInitial()) {
    on<FetchConversation>(_onFetchConversation);
  }

  Future<void> _onFetchConversation(FetchConversation event, Emitter<ConversationState> emit) async{
    emit(ConversationLoading());
    try {
      final conversation = await fetchConversationUseCase();
      emit(ConversationLoaded(conversation));
    } catch (e) {
      emit(ConversationError(e.toString(),),);
    }
  }
  
}