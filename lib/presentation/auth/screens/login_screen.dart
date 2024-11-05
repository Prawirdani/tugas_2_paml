import 'package:flutter/material.dart';
import 'package:tugas_2_paml/config/theme/colors.dart';
import 'package:tugas_2_paml/core/navigator.dart';
import 'package:tugas_2_paml/presentation/auth/screens/forgot_password_screen.dart';
import 'package:tugas_2_paml/presentation/auth/screens/register_screen.dart';
import 'package:tugas_2_paml/widgets/button.dart';
import 'package:tugas_2_paml/widgets/input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;
      print('Email: $email, Password: $password');
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
                    "Masuk",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ),
                _formInputs(),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(0, 0),
                    splashFactory: NoSplash.splashFactory,
                    foregroundColor: AppColors.primaryColor,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: () =>
                      AppNavigator.push(context, const ForgotPasswordScreen()),
                  child: const Text("Lupa password?"),
                ),
              ],
            ),
            Wrap(
              runSpacing: 8,
              children: [
                Button(text: "Masuk", onPressed: _onSubmit, fullWidth: true),
                _registerHint()
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
        ],
      ),
    );
  }

  Widget _registerHint() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Belum punya akun?"),
        const SizedBox(width: 4),
        TextButton(
          onPressed: () => AppNavigator.push(
            context,
            const RegisterScreen(),
          ),
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: const Size(0, 0),
            splashFactory: NoSplash.splashFactory,
            foregroundColor: AppColors.primaryColor,
            backgroundColor: Colors.transparent,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Sh
          ),
          child: const Text("Daftar Sekarang"),
        )
      ],
    );
  }
}
