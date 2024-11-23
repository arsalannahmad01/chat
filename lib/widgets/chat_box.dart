import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class ChatBox extends StatefulWidget {
  final String contact;
  const ChatBox({super.key, required this.contact});

  @override
  State<ChatBox> createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  final TextEditingController _messageController = TextEditingController();
  final List<dynamic> chats = [
    {
      'message': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'time': '10:00 AM',
      'send': true,
    },
    {
      'message': 'I am fine, thank you!',
      'time': '10:01 AM',
      'send': false,
    },
    {
      'message': 'What are you doing?',
      'time': '10:02 AM',
      'send': false,
    },
  ];

  void _sendMessage() {
    setState(() {
      chats.add({
        'message': _messageController.text,
        'time': DateFormat('hh:mm a').format(DateTime.now()),
        'send': true
      });
      _messageController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.only(top: 19),
            child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: chats[index]['send']
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 210,
                        margin:
                            EdgeInsets.only(left: 20, right: 20, bottom: 10),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: chats[index]['send']
                              ? Color(0xFFFF9134)
                              : Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        // height: 50,
                        child: Text(
                          chats[index]['message'],
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: chats[index]['send']
                                ? Colors.white
                                : Color(0xFF212121),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        Container(
          height: 85,
          color: Color(0xFFFAFAFA),
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _messageController,
                  decoration: InputDecoration(
                    hintText: 'Type a message',
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_upward, color: Color(0xFFFF9134)),
                  iconSize: 24,
                  onPressed: _sendMessage,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
