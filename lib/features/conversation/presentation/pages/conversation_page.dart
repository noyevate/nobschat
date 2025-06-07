import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nobschat/core/format_date.dart';
import 'package:nobschat/core/theme.dart';
import 'package:nobschat/features/conversation/presentation/bloc/conversation_bloc.dart';
import 'package:nobschat/features/conversation/presentation/bloc/conversation_event.dart';
import 'package:nobschat/features/conversation/presentation/bloc/conversation_state.dart';

class ConversationPage extends StatefulWidget {
  const ConversationPage({super.key});

  @override
  State<ConversationPage> createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ConversationBloc>(context).add(
      FetchConversation(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Messages",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 30,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text("recents",
                  style: Theme.of(context).textTheme.bodySmall)),
          Container(
            height: 100,
            padding: EdgeInsets.all(5),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildRecentContacts(context, "samuel"),
                _buildRecentContacts(context, "noye"),
                _buildRecentContacts(context, "barry"),
                _buildRecentContacts(context, "shane"),
                _buildRecentContacts(context, "wilcox"),
                _buildRecentContacts(context, "matinelli"),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
              color: DefaultColors.messageListPage,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: BlocBuilder<ConversationBloc, ConversationState>(
              builder: (context, state) {
                if(state is ConversationLoading) {
                  Center(child: CircularProgressIndicator(),);
                }
                else if (state is ConversationLoaded) {
                  return ListView.builder(
                    itemCount: state.conversation.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    final conversations = state.conversation[index];
                    DateTime createdAt = DateTime.parse(conversations.lastMessageTime.toString());
                    return _buildMessageTile(
                        conversations.participantName,
                        conversations.lastMessage.toString(),
                        
                        formatDayAndDate(createdAt),
                        );
                  },
                  
                );
                } else if (state is ConversationError) {
                  return Center(child: Text(state.message.toString(),),);
                }
                return Center(child: Text('No conversations..'),);
                
              },
            ),
          ))
        ],
      ),
    );
  }

  Widget _buildMessageTile(String name, String message, String time) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(""),
      ),
      title: Text(
        name,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        message,
        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text(
        time,
        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget _buildRecentContacts(BuildContext context, String name) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
                "https://lh3.googleusercontent.com/a/ACg8ocJvkUZGLhJG_So-PNNPRSWlqu0UjpUrujKPEf0VozkscOkOMw=s96-c"),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            name,
            style: Theme.of(context).textTheme.bodyMedium,
          )
        ],
      ),
    );
  }
}
