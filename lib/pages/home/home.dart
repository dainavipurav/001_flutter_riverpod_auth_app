import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/utils.dart';
import '../../main.dart';
import '../../models/user.dart';
import '../register/register.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    User user = ref.watch(userProvider)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        centerTitle: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(20),
          shrinkWrap: true,
          children: [
            Text(
              'Welcome ${user.username}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            detailTile(title: firstName, description: user.firstName ?? ''),
            detailTile(title: middleName, description: user.middleName ?? ''),
            detailTile(title: lastName, description: user.lastName ?? ''),
            detailTile(title: age, description: (user.age ?? 0).toString()),
            detailTile(title: password, description: user.password),
            detailTile(title: address, description: user.address ?? ''),
            detailTile(title: city, description: user.city ?? ''),
            detailTile(title: state, description: user.state ?? ''),
            detailTile(title: country, description: user.country ?? ''),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.power_settings_new_rounded),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (ctx) => Register(),
            ),
          );
        },
      ),
    );
  }

  Widget detailTile({
    required String title,
    required String description,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '$title : ',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              description,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
