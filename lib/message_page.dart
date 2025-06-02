import 'package:flutter/material.dart';
import 'package:nobschat/core/theme.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Messages", style: Theme.of(context).textTheme.titleLarge,),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0, 
        toolbarHeight: 30,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search, color: Colors.white,),),
        ],

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: Text("recents", style: Theme.of(context).textTheme.bodySmall)),
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
          SizedBox(height: 10,),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: DefaultColors.messageListPage,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20),),
              ),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildMessageTile("samuel", "hmm, i thought i told you about all this yesterday", "3:30pm"),
                  _buildMessageTile("emma", "you'll have to call me later", "3:30pm"),
                  _buildMessageTile("wilcox", "I'm on my way", "3:30pm"),
                  _buildMessageTile("barry", "No i'm not coming, I just got to know", "3:30pm"),
                  _buildMessageTile("shane", "nope", "3:30pm")
                  ],
              ),
            )
          )
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
      title: Text(name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      subtitle: Text(message, style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400), overflow: TextOverflow.ellipsis,),
      trailing: Text(time, style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),),
    );
  }

  Widget _buildRecentContacts(BuildContext context, String name) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage("https://lh3.googleusercontent.com/a/ACg8ocJvkUZGLhJG_So-PNNPRSWlqu0UjpUrujKPEf0VozkscOkOMw=s96-c"),
          ),
          SizedBox(height: 5,),
          Text(name, style: Theme.of(context).textTheme.bodyMedium,)
        ],
      ),
    );
  }
}