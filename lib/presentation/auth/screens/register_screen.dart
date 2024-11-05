import 'package:flutter/material.dart';
import 'package:tugas_2_paml/config/theme/colors.dart';
import 'package:tugas_2_paml/core/navigator.dart';
import 'package:tugas_2_paml/presentation/auth/screens/login_screen.dart';
import 'package:tugas_2_paml/widgets/button.dart';
import 'package:tugas_2_paml/widgets/input.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _rePasswordController = TextEditingController();

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;
      final rePassword = _rePasswordController.text;
      print('Email: $email, Password: $password, Re-Password: $rePassword');
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
            Wrap(
              runSpacing: 8,
              children: [
                const Center(
                  child: Text(
                    "Daftar",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ),
                _formInputs(),
              ],
            ),
            Wrap(
              runSpacing: 8,
              children: [
                Button(text: "Daftar", onPressed: _onSubmit, fullWidth: true),
              ],
            )
          ],
        ),
      ),
    );
  }

  Form _formInputs() {
    return Form(
      key: _formKey,
      child: Wrap(
        runSpacing: 16,
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
          const SizedBox(height: 16),
          TextInput(
            label: 'Password',
            hintText: 'Masukkan password anda',
            controller: _passwordController,
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Kolom password tidak boleh kosong';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextInput(
            label: 'Ulangi Password',
            hintText: 'Masukkan ulang password',
            controller: _rePasswordController,
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Kolom password tidak boleh kosong';
              }
              if (value != _passwordController.text) {
                return 'Password tidak sama';
              }
              return null;
            },
          ),
          _registeredHint(),
        ],
      ),
    );
  }

  Widget _registeredHint() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Sudah memiliki akun?"),
        const SizedBox(width: 4),
        TextButton(
          onPressed: () => AppNavigator.pushReplacement(
            context,
            const LoginScreen(),
          ),
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: const Size(0, 0),
            splashFactory: NoSplash.splashFactory,
            foregroundColor: AppColors.primaryColor,
            backgroundColor: Colors.transparent,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Sh
          ),
          child: const Text("Masuk"),
        )
      ],
    );
  }
}
