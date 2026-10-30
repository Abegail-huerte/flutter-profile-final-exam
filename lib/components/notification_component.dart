import 'package:flutter/material.dart';

class NotificationComponent extends StatelessWidget {
  final String? username;
  final String? message;
  final String? time;
  final IconData? icon;
  final bool selected;

  const NotificationComponent({
    super.key,
    this.username,
    this.message,
    this.time,
    this.icon,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: const Color.fromARGB(120, 158, 158, 158),
      selected: selected,
      leading: const CircleAvatar(
        child: Icon(Icons.person),
      ),
      title: Text(
        username ?? "John Doe",
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon ?? Icons.thumb_up_sharp,
                size: 12,
              ),
              const SizedBox(width: 10),
              Text(
                message ?? "You have a new notification.",
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            time ?? "Just now",
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      trailing: const Icon(
        Icons.more_vert,
      ),
    );
  }
}
