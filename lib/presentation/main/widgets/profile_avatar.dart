import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String fullname;
  final String university;
  const ProfileAvatar({
    super.key,
    required this.fullname,
    required this.university,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundColor: Colors.grey,
        ),
        const SizedBox(height: 16),
        Text(
          fullname,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          university,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
