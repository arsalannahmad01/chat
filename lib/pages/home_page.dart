import 'package:chat/widgets/chat.dart';
import 'package:flutter/material.dart';
import '../widgets/contact.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String pageType = "chat";

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
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Container(
          margin: EdgeInsets.only(left: 15),
          child: Icon(
            Icons.add,
            size: 34,
            color: Color(0xFFA3A3A3),
          ),
        ),
        title: Text(
          pageType == "contact" ? 'Contacts' : 'Chats',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(right: 15, bottom: 8),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(80),
              ),
              child: Icon(Icons.person),
            ),
          ),
        ],
      ),
      body: pageType == "contact" ? Contact() : Chat(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xFFF99234),
        unselectedItemColor: Colors.black,
        selectedLabelStyle: TextStyle(
          fontSize: 12,
        ),
        currentIndex: pageType == "contact" ? 0 : 1,
        onTap: (index) {
          setState(() {
            pageType = index == 0 ? "contact" : "chat";
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image(
              image: AssetImage('lib/images/contact.png'),
              width: 24,
              height: 24,
              color: pageType == "contact" ? Color(0xFFF99234) : null,
            ),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Image(
              image: AssetImage('lib/images/chat.png'),
              width: 24,
              height: 24,
              color: pageType == "chat" ? Color(0xFFF99234) : null,
            ),
            label: 'Chats',
          ),
        ],
      ),
    );
  }
}
