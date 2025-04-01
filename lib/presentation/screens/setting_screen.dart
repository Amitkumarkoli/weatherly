import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherly/core/provider/auth_provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Setting Screen'))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [            
            ListTile(
              trailing: const Icon(Icons.brightness_6),
              title: const Text('Dark Mode',style: TextStyle(fontSize: 16)),
              onTap: () {
                
              },
            ),
            const Divider(),
            ListTile(
              trailing: const Icon(Icons.share),
              title: const Text('Share App',style: TextStyle(fontSize: 16)),
              onTap: () {
              },
            ),
            const Divider(),
            ListTile(
              trailing: const Icon(Icons.notifications),
              title: const Text('Weather Alerts',style: TextStyle(fontSize: 16)),
              onTap: () {
               
              },
            ),
            const Divider(),
            ListTile(
              trailing: const Icon(Icons.logout),
              title: const Text('Logout',style: TextStyle(fontSize: 16)),
              onTap: () {
                authProvider.signOut();
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}
