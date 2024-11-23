import 'package:chat/pages/chat_page.dart';
import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  final List<dynamic> chats = [
    {
      "name": "John Doe",
      "email": "john@gmail.com",
      "image":
          "https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359553_1280.png",
      "lastMessage": "Hello, how are you?",
      "lastMessageTime": "1 min ago",
      "unread": 1,
    },
    {
      "name": "Alex",
      "email": "alex@gmail.com",
      "image":
          "https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359553_1280.png",
      "lastMessage": "Hello, how are you?",
      "lastMessageTime": "3 hours ago",
      "unread": 0,
    },
    {
      "name": "Fiona",
      "email": "fiona@gmail.com",
      "image":
          "https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359553_1280.png",
      "lastMessage": "Hello, how are you?",
      "lastMessageTime": "1 min ago",
      "unread": 2,
    },
  ];

  Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 19),
      child: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatPage(
                      chats: chats,
                      contacts: chats[index],
                    ),
                  ));
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 5),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey[200]!),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(chats[index]['image'])),
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            chats[index]['name'],
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            chats[index]['lastMessage'],
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFF9134),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        chats[index]['lastMessageTime'],
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xFFA3A3A3),
                        ),
                      ),
                      if (chats[index]['unread'] > 0)
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Color(0xFFFF9134),
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            chats[index]['unread'].toString(),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
