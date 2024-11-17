import 'package:flutter/material.dart';
import '../controllers/settings_controller.dart';
import '../models/audio_notification_model.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late final SettingsController controller;
  late final AudioNotificationModel model;

  @override
  void initState() {
    super.initState();
    model = AudioNotificationModel();
    controller = SettingsController(model);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout'),
              onTap: () {
                // Tambahkan fungsi logout
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.notifications_active, color: Colors.blue),
              title: const Text('Audio Notification'),
              trailing: Switch(
                value: model.isAudioNotificationEnabled,
                onChanged: (value) {
                  setState(() {
                    controller.toggleAudioNotification();
                  });
                  if (value) {
                    controller.playNotificationSound();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
