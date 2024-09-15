
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/common_text_field.dart';
import '../../components/form_header.dart';
import '../../components/navigation_text.dart';
import '../../core/utils.dart';
import '../../main.dart';
import '../../models/user.dart';
import '../home/home.dart';
import '../register/register.dart';

class Login extends ConsumerWidget {
  Login({super.key});

  final formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        centerTitle: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const FormHeader(title: 'Login'),
            const SizedBox(height: 30),
            form(),
            const SizedBox(height: 30),
            loginButton(context, ref),
            const SizedBox(height: 10),
            NavigationText(
              text: goToRegister,
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => Register(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget form() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CommonTextField(
            textEditingController: usernameController,
            focusNode: usernameFocusNode,
            label: username,
          ),
          CommonTextField(
            textEditingController: passwordController,
            focusNode: passwordFocusNode,
            label: password,
            obscureText: true,
          ),
        ],
      ),
    );
  }

  Widget loginButton(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      onPressed: () => login(context, ref),
      child: const Text('Login'),
    );
  }

  void login(BuildContext context, WidgetRef ref) {
    bool valid = formKey.currentState!.validate();

    if (!valid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter valid details'),
        ),
      );
      return;
    }

    final user = User(
      username: usernameController.text,
      password: passwordController.text,
    );

    formKey.currentState!.reset();

    ref.read(userProvider.notifier).setUser(user);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (ctx) => const Home(),
      ),
    );
  }
}
