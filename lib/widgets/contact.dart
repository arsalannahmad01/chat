import 'package:chat/pages/chat_page.dart';
import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  final List<dynamic> contacts = [
    {
      "name": "Arsalan Ahmad",
      "email": "arsalan@gmail.com",
      "image":
          "https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359553_1280.png",
    },
    {
      "name": "Md Kaif",
      "email": "kaif@gmail.com",
      "image":
          "https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359553_1280.png",
    },
    {
      "name": "Zakaur Rahman",
      "email": "zakaur@gmail.com",
      "image":
          "https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359553_1280.png",
    },
    {
      "name": "Zafar Abbas",
      "email": "zafar@gmail.com",
      "image":
          "https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359553_1280.png",
    },
    {
      "name": "Md Ejaz",
      "email": "ejaz@gmail.com",
      "image":
          "https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359553_1280.png",
    }
  ];

  Contact({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 19),
      child: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatPage(
                    chats: contacts,
                    contacts: contacts[index],
                  ),
                ),
              );
            },
            child: Container(
              // height: 60,
              padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 5),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 42,
                        width: 42,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(contacts[index]['image'])),
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(contacts[index]['name'],
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                          Text("Last seen recently",
                              style: TextStyle(
                                color: Color(0xff999999),
                                fontSize: 10,
                              )),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    "Message",
                    style: TextStyle(
                      color: Color(0xFFFF9134),
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
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
