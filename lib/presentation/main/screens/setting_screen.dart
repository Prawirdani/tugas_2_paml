import 'package:flutter/material.dart';
import 'package:tugas_2_paml/core/navigator.dart';
import 'package:tugas_2_paml/presentation/main/screens/edit_profile_screen.dart';
import 'package:tugas_2_paml/presentation/main/widgets/profile_avatar.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pengaturan',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: const ProfileAvatar(
                  fullname: "John Doe",
                  university: "Universitas Teknologi Yogyakarta"),
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                ListTile(
                  title: const Text('Kelola Akun'),
                  trailing: const Icon(Icons.person),
                  onTap: () =>
                      AppNavigator.push(context, const EditProfileScreen()),
                ),
                ListTile(
                  title: const Text('Notifikasi'),
                  trailing: const Icon(Icons.notifications),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Privacy Policy'),
                  trailing: const Icon(Icons.privacy_tip),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Terms of Service'),
                  trailing: const Icon(Icons.rule),
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
