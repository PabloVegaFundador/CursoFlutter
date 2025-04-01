
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_messsage_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget{
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage("https://media.v2.siweb.es/uploaded_thumb_big/50539061f56935f748726281f52004db/jurica_koletic_7yvzyzeitc8_unsplash_copia.jpg"),
          ),
        ),
        title: const Text('Persona x'),
        centerTitle: true,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
              final message = chatProvider.messageList[index];

              return (message.fromWho == FromWho.hers)
              ? HerMessageBubble( message : message)
              : MyMessageBubble( message : message);
            },
            )),
            //caja de texto 
            MessageFieldBox(
              onValue: chatProvider.sendMessage,
            ),
          ]
        ),
      ),
    );
  }
}