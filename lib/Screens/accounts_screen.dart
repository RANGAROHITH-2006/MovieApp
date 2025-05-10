import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/Screens/social_media.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Movies',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        backgroundColor: Colors.black,
        actions: [Icon(Icons.menu, color: Colors.white)],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Text(
              'Account',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Divider(height: 80),

            Row(
              children: [
                Text(
                  'Member ship',
                  style: TextStyle(fontSize: 20, color: Colors.blueGrey),
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    Text('rahul@gmail.com', style: TextStyle(fontSize: 20)),
                    SizedBox(height: 10),
                    Text(
                      'Password : **********',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
            Divider(height: 80),
            Row(
              children: [
                Text(
                  'Plan details',
                  style: TextStyle(fontSize: 20, color: Colors.blueGrey),
                ),
                SizedBox(width: 20),
                Row(
                  children: [
                    Text(
                      'Premium',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'Ultra HD',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Divider(height: 80),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Logout success')),
                  );
                  context.go('/loginScreen');
                },
                child: Text('Logout', style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: SocialMedia(),
    );
  }
}
