import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podberi_ru/core/utils/theme_mode.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
      ),
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          var darkMode = ref.watch(darkModeProvider);
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            child: Row(
              children: [
                Switch(
                  value: darkMode,
                  onChanged: (val) {
                    ref.read(darkModeProvider.notifier).toggle();
                  },
                ),
                const SizedBox(width: 6,),
                Text(darkMode ? 'темная тема' : 'светлая тема')
              ],
            ),
          );
        },
      ),
    );
  }
}
