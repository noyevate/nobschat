import 'package:flutter/material.dart';
import 'package:nobschat/core/theme.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          
          children: [
            CircleAvatar(
            radius: 15,
            backgroundImage: NetworkImage("https://lh3.googleusercontent.com/a/ACg8ocJvkUZGLhJG_So-PNNPRSWlqu0UjpUrujKPEf0VozkscOkOMw=s96-c"),
          ),
          SizedBox(width: 10,),
            Text("Chats", style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0, 
        toolbarHeight: 30,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search, color: Colors.white,),),
        ],

      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(padding: EdgeInsets.all(15),
             children: [
              _buildRecievedMessage(context, "yeah i have sent thm the letter. just waiting for a reply from them"),
              _buildSentMessage(context, "Okay. I guess you can take your time then."),
              _buildRecievedMessage(context, "okay."),
              _buildSentMessage(context, "alright. Also keeps you ears down"),
             ],
            ),
          ),
          _buildMessageInput()
        ],
      ),
    );
  }

  Widget _buildRecievedMessage(BuildContext context, String message) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(right: 20, bottom: 5, top: 5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: DefaultColors.recieverMessage,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(message, style: Theme.of(context).textTheme.bodyMedium,),
      ),
    );
  }



  Widget _buildSentMessage(BuildContext context, String message) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.only(right: 20, bottom: 5, top: 5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: DefaultColors.senderMssage,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(message, style: Theme.of(context).textTheme.bodyMedium,),
      ),
    );
  }


  Widget _buildMessageInput() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.all(10),
      
      decoration: BoxDecoration(
        color: DefaultColors.sentMessageInput,
        borderRadius: BorderRadius.circular(30)
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: Icon(Icons.camera_alt, color: Colors.grey,),
          ),
          SizedBox(width: 10,),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "type here..",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(width: 10,),
          GestureDetector(
            onTap: () {},
            child: Icon(Icons.send, color: Colors.grey,),
          )
        ],
      ),
    );
  }
}