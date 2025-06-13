import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/Screens/detailedpages/static/social_media.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    final user = Supabase.instance.client.auth.currentUser;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: TextButton(
          onPressed: (){
            context.go('/home_Screen');
          },
          child: Text(
          'Movies',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        )),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {
              context.push('/searchInput');
            },
            icon: Icon(Icons.search, color: Colors.white, size: 30),
          ),
          IconButton(
            onPressed: () {
              context.push('/myfavorite');
            },
            icon: Icon(Icons.favorite, color: Colors.white, size: 30),
          ),
          PopupMenuButton<String>(
            icon: Icon(
              Icons.menu,
              color: const Color.fromARGB(255, 252, 250, 250),
            ),
            color: Colors.grey[900],
            itemBuilder:
                (context) => [
                  PopupMenuItem(
                    onTap: () {
                      context.push('/telugu');
                    },
                    child: Text(
                      'Telugu',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  PopupMenuItem(
                    onTap: () {
                      context.push('/hindi');
                    },

                    child: Text('Hindi', style: TextStyle(color: Colors.white)),
                  ),
                  PopupMenuItem(
                    onTap: () {
                      context.push('/english');
                    },

                    child: Text(
                      'English',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const SizedBox(height: 30),
              Text(
                'Account',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Divider(height: 80),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Member ship',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),

                  Text(
                    'Email        : ${user?.email ?? "User"}',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Password   : **********',
                    style: TextStyle(fontSize: 20),
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
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelected = !isSelected;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.blue : Colors.transparent,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'Ultra HD',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.white : Colors.black,
                            ),
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
                  onPressed: () async {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Logout success')),
                    );
                    await Supabase.instance.client.auth.signOut();
                    context.go('/loginScreen');
                  },
                  child: Text('Logout', style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SocialMedia(),
    );
  }
}
