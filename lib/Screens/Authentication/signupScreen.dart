import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/supabase_credentials/authentication_notifier.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordcontroller = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Text(
              'Movies',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text('Email', style: TextStyle(color: Colors.white)),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your Email',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.grey,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter Email";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'PASSWORD',
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _passwordcontroller,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your Password',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.grey,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your Password";
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    if (authState.loading)
                      const Center(child: CircularProgressIndicator())
                    else
                     Center(child: ElevatedButton(
                        onPressed: () async {
                          final email = _emailController.text.trim();
                          final password = _passwordcontroller.text.trim();
                          final success = await ref
                              .read(authProvider.notifier)
                              .signup(email, password);
                          if (success && mounted) {
                            context.go('/loginScreen');
                          }
                        },
                        child: const Text('SignUp'),
                      ),),
                    SizedBox(height: 15),
                    Center(child:TextButton(
                      onPressed: () {
                            context.pop('/loginScreen');
                      },
                      child: const Text("Already have an account? Login"),
                    ),),
                    SizedBox(height: 15),
                    if (authState.error != null)
                    Center(child:
                      Text(
                        authState.error!,
                        style: const TextStyle(color: Colors.red)),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
