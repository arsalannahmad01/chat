import 'package:chat/widgets/chat_box.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final List<dynamic> chats;
  final dynamic contacts;
  const ChatPage({super.key, required this.chats, required this.contacts});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0), // Height of the border
          child: Container(
            color: Colors.grey[200], // Border color
            height: 1.0, // Thickness of the border
          ),
        ),
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsets.only(left: 10),
            margin: EdgeInsets.only(left: 10, top: 3, bottom: 3),
            decoration: BoxDecoration(
              color: Color(0xFFFAFAFA),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Icon(
              Icons.arrow_back_ios,
              weight: 800,
              color: Color(0xFFA3A3A3),
            ),
          ),
        ),
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                widget.contacts['image'],
                width: 38,
                height: 38,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.contacts['name'],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Online now',
                    style: TextStyle(
                      color: Color(0xFFFF9134),
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          Container(
            padding: EdgeInsets.all(10),
            // margin: EdgeInsets.only(right: 10, top: 3, bottom: 3),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Icon(
              Icons.video_call,
              color: Colors.grey[500],
            ),
          ),
          SizedBox(width: 5),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Icon(
              Icons.call,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
      body: ChatBox(contact: widget.contacts['email']),
    );
  }
}
