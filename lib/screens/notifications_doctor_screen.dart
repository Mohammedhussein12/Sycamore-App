import 'package:flutter/Material.dart';
import 'package:flutter/material.dart';
import 'package:sycamore_project/constants.dart';

import '../core/helper_methods.dart';
import '../doctor_bottom_navigation_bar/pages/patient_profile_session_screen.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final List<Map<String, String>> todayNotifications = [
    {
      'name': 'Mohamed Ali',
      'message': 'send alert to manage his oxygen rate',
      'time': '1 min',
      'image': 'assets/images/patient_picture.jpeg'
    },
    {
      'name': 'Leslie',
      'message': 'send alert to manage her oxygen rate',
      'time': '2 hour',
      'image': 'assets/images/patient_picture.jpeg'
    },
  ];

  final List<Map<String, String>> weekNotifications = [
    {
      'name': 'Ali Adem',
      'message': 'send alert to manage his oxygen rate',
      'time': '5 days',
      'image': 'assets/images/patient_picture.jpeg'
    },
    {
      'name': 'Beter',
      'message': 'send alert to manage his oxygen rate',
      'time': '1 week',
      'image': 'assets/images/patient_picture.jpeg'
    },
    {
      'name': 'Ali Adem',
      'message': 'send alert to manage his oxygen rate',
      'time': '1 week',
      'image': 'assets/images/patient_picture.jpeg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
            decoration: BoxDecoration(
              color: const Color(0xffF3F3F3),
              borderRadius: BorderRadius.circular(15),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.notifications,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const SectionHeader(title: 'Today'),
            ...todayNotifications.map((notification) {
              return NotificationTile(
                name: notification['name']!,
                message: notification['message']!,
                time: notification['time']!,
                image: notification['image']!,
              );
            }).toList(),
            const SectionHeader(title: 'This week'),
            ...weekNotifications.map((notification) {
              return NotificationTile(
                name: notification['name']!,
                message: notification['message']!,
                time: notification['time']!,
                image: notification['image']!,
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class NotificationTile extends StatefulWidget {
  final String name;
  final String message;
  final String time;
  final String image;

  const NotificationTile({
    super.key,
    required this.name,
    required this.message,
    required this.time,
    required this.image,
  });

  @override
  State<NotificationTile> createState() => _NotificationTileState();
}

class _NotificationTileState extends State<NotificationTile> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isSelected = true;
        setState(() {});
        navigateTo(
          withHistory: true,
          page: const PatientSessionScreen(),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: isSelected ? const Color(0xff1D938F) : Colors.black),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(widget.image),
          ),
          title: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: widget.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: ' ${widget.message}'),
              ],
            ),
          ),
          trailing: Text(
            widget.time,
            style: const TextStyle(color: kPrimaryColor),
          ),
        ),
      ),
    );
  }
}

