import 'package:adda_when/resources/auth_methods.dart';
import 'package:adda_when/screens/history_meeting_screen.dart';
import 'package:adda_when/utils/colors.dart';
import 'package:adda_when/widgets/custom_button.dart';
import 'package:adda_when/widgets/home_meeting_button.dart';
import 'package:flutter/material.dart';
import 'meeting_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      MeetingScreen(),
      const HistoryMeetingScreen(),
    ];

    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Text('Meet & Chat'),
          centerTitle: true,
          backgroundColor: backgroundColor,
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    AuthMethods().signOut();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/', (Route<dynamic> route) => false);
                  },
                  child: Icon(
                    Icons.logout_outlined,
                    size: 26.0,
                  ),
                ))
          ]),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: onPageChanged,
        currentIndex: _page,
        unselectedFontSize: 14,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.comment_bank), label: 'Cholo Adda dei'),
          BottomNavigationBarItem(
              icon: Icon(Icons.lock_clock), label: 'Adda\'s History'),
        ],
      ),
    );
  }
}
