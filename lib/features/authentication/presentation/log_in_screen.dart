import 'package:flutter/material.dart';
import 'package:flutter_application/constants/app_constants.dart';
import 'package:flutter_application/features/home/presentation/home_screen.dart';
import 'package:flutter_application/helpers/di.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'registration_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() async {
    if (_formKey.currentState!.validate()) {
      EasyLoading.show(status: 'Logging in...');
   
      String? savedEmail = appData.read(kKeyEmail);
      String? savedPassword = appData.read(kKeyPassword);
      await Future.delayed(const Duration(seconds: 1)); // simulate loading

      EasyLoading.dismiss();

      if (_emailController.text.trim() == savedEmail &&
          _passwordController.text.trim() == savedPassword) {
        EasyLoading.showSuccess('Login Successful!');
        await appData.write(kKeyIsLoggedIn, true);
        Navigator.pushReplacement(
            // ignore: use_build_context_synchronously
            context, MaterialPageRoute(builder: (_) => const HomeScreen()));
      } else {
        EasyLoading.showError('Invalid email or password');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'Enter email' : null,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'Enter password' : null,
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _login,
                    child: const Text('Login'),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const RegistrationScreen()));
                  },
                  child: const Text('Don\'t have an account? Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
