import 'package:flutter/material.dart';
import 'package:prelim_app/components/globalappbar_component.dart';
import 'package:prelim_app/components/newsfeedcomponent.dart';

class NewsfeedScreen extends StatefulWidget {
  const NewsfeedScreen({super.key});

  @override
  State<NewsfeedScreen> createState() => _NewsfeedScreenState();
}

class _NewsfeedScreenState extends State<NewsfeedScreen> {

  final List<Map<String, String>> newsfeed = [
    {
      "username": "John Doe",
      "time": "2 hours ago",
      "status": "Having a great day!",
      "likes": "120",
      "comments": "25",
      "shares": "10",
    },
    {
      "username": "Jane Smith",
      "time": "3 hours ago",
      "status": "Learning Flutter is fun!",
      "likes": "250",
      "comments": "40",
      "shares": "15",
    },
    {
      "username": "Michael Cruz",
      "time": "5 hours ago",
      "status": "Working on my new project.",
      "likes": "89",
      "comments": "12",
      "shares": "4",
    },
    {
      "username": "Alex Santos",
      "time": "8 hours ago",
      "status": "Flutter development today!",
      "likes": "300",
      "comments": "50",
      "shares": "20",
    },
    {
      "username": "Maria Reyes",
      "time": "12 hours ago",
      "status": "Coffee first, code later.",
      "likes": "175",
      "comments": "33",
      "shares": "7",
    },
    {
      "username": "Carlo Mendoza",
      "time": "1 day ago",
      "status": "Finally fixed that bug!",
      "likes": "64",
      "comments": "18",
      "shares": "2",
    },
    {
      "username": "Bea Villanueva",
      "time": "2 days ago",
      "status": "Weekend trip to the beach.",
      "likes": "412",
      "comments": "71",
      "shares": "28",
    },
    {
      "username": "Paolo Garcia",
      "time": "3 days ago",
      "status": "Ready for the prelim exams.",
      "likes": "58",
      "comments": "9",
      "shares": "1",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalappbarComponent(),

      body: ListView.builder(
        padding: const EdgeInsets.all(10),

        itemCount: newsfeed.length,

        itemBuilder: (context, index) {
          final post = newsfeed[index];

          return Newsfeedcomponent(
            username: post["username"],
            timeposted: post["time"],
            status: post["status"],
            numberoflikes: post["likes"],
            numberofcomments: post["comments"],
            numberofshares: post["shares"],
          );
        },
      ),
    );
  }
}
