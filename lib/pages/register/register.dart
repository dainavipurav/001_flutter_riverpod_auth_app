import 'package:auth_app_riverpod/core/utils.dart';
import 'package:auth_app_riverpod/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/common_text_field.dart';
import '../../components/form_header.dart';
import '../../main.dart';
import '../../models/user.dart';

class Register extends ConsumerWidget {
  Register({super.key});

  final formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final firstNameController = TextEditingController();
  final middleNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final ageController = TextEditingController();
  final passwordController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final countryController = TextEditingController();

  final usernameFocusNode = FocusNode();
  final firstNameFocusNode = FocusNode();
  final middleNameFocusNode = FocusNode();
  final lastNameFocusNode = FocusNode();
  final ageFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final addressFocusNode = FocusNode();
  final cityFocusNode = FocusNode();
  final stateFocusNode = FocusNode();
  final countryFocusNode = FocusNode();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        centerTitle: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const FormHeader(title: 'Registration'),
              const SizedBox(height: 30),
              form(),
              const SizedBox(height: 30),
              registerButton(context, ref),
            ],
          ),
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
            textEditingController: firstNameController,
            focusNode: firstNameFocusNode,
            label: firstName,
          ),
          CommonTextField(
            textEditingController: middleNameController,
            focusNode: middleNameFocusNode,
            label: middleName,
          ),
          CommonTextField(
            textEditingController: lastNameController,
            focusNode: lastNameFocusNode,
            label: lastName,
          ),
          CommonTextField(
            textEditingController: ageController,
            focusNode: ageFocusNode,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            label: age,
          ),
          CommonTextField(
            textEditingController: passwordController,
            focusNode: passwordFocusNode,
            label: password,
          ),
          CommonTextField(
            textEditingController: addressController,
            focusNode: addressFocusNode,
            label: address,
          ),
          CommonTextField(
            textEditingController: cityController,
            focusNode: cityFocusNode,
            label: city,
          ),
          CommonTextField(
            textEditingController: stateController,
            focusNode: stateFocusNode,
            label: state,
          ),
          CommonTextField(
            textEditingController: countryController,
            focusNode: countryFocusNode,
            label: country,
          ),
        ],
      ),
    );
  }

  Widget registerButton(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      onPressed: () => register(context, ref),
      child: const Text('Register'),
    );
  }

  void register(BuildContext context, WidgetRef ref) {
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
      firstName: firstNameController.text,
      middleName: middleNameController.text,
      lastName: lastNameController.text,
      age: int.tryParse(ageController.text) ?? 0,
      password: passwordController.text,
      address: addressController.text,
      city: cityController.text,
      state: stateController.text,
      country: countryController.text,
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
