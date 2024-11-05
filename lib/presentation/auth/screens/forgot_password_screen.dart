import 'package:flutter/material.dart';
import 'package:tugas_2_paml/config/theme/colors.dart';
import 'package:tugas_2_paml/widgets/button.dart';
import 'package:tugas_2_paml/widgets/input.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      print('Email: $email');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryColor),
              ),
              child: Text(
                "My Logo",
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor),
              ),
            ),
            const Center(
              child: Text(
                "Lupa Password",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pesan",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Masukkan email Anda dan tunggu kode etik akan dikirimkan",
                ),
              ],
            ),
            _emailInput(),
            Button(text: "Kirim", onPressed: _onSubmit, fullWidth: true),
          ],
        ),
      ),
    );
  }

  Form _emailInput() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextInput(
            label: 'Email',
            hintText: 'Masukkan alamat email anda',
            controller: _emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Kolom email tidak boleh kosong';
              }
              // Basic email validation
              if (!value.contains('@')) {
                return 'Email tidak valid';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
