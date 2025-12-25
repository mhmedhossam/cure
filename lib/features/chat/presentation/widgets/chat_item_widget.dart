import 'package:flutter/material.dart';

class ChatListItem extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final int unreadCount;

  const ChatListItem({
    super.key,
    required this.name,
    required this.message,
    required this.time,
    this.unreadCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.grey.shade400,
            child: Image.asset("assets/images/doc_img.png"),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(time, style: const TextStyle(color: Colors.grey)),
              const SizedBox(height: 6),
              if (unreadCount > 0)
                CircleAvatar(
                  radius: 11,
                  backgroundColor: Colors.green,
                  child: Text(
                    unreadCount.toString(),
                    style: const TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
