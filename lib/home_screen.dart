import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_challenges/screens/login_screen_01.dart';
import 'package:ui_challenges/screens/todo_list_screen_01.dart';
import 'package:ui_challenges/theme_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter UI Challenges'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            ListTile(
              title: const Text('1 - Login Screen'),
              subtitle: const Text('A simple login screen'),
              onTap: () {
                ref.read(appThemeProvider.notifier).changeColorScheme(0);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen01()));
              },
            ),
            ListTile(
              title: const Text('2 - Todo Lists'),
              subtitle: const Text('A simple todo list screen'),
              onTap: () {
                ref.read(appThemeProvider.notifier).changeColorScheme(1);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TodoListScreen01()));
              },
            )
          ],
        ),
      ),
    );
  }
}
