import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final plantController = TextEditingController(); // 🌱 NEW

  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    plantController.dispose();
    super.dispose();
  }

  void register() async {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        plantController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields")),
      );
      return;
    }

    setState(() => isLoading = true);

    try {
      print("👉 Creating user...");

      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      print("✅ Auth success: ${userCredential.user!.uid}");

      print("👉 Saving to Firestore...");

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'email': emailController.text.trim(),
        'uid': userCredential.user!.uid,
        'plantName': plantController.text.trim(), // 🌱 NEW
        'createdAt': FieldValue.serverTimestamp(),
      });

      print("✅ Firestore save SUCCESS");

      if (!mounted) return;

      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      print("❌ ERROR: $e");

      String message = "Something went wrong";

      if (e is FirebaseAuthException) {
        if (e.code == 'email-already-in-use') {
          message = "Email already exists";
        } else if (e.code == 'invalid-email') {
          message = "Invalid email";
        } else if (e.code == 'weak-password') {
          message = "Password must be at least 6 characters";
        }
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Account")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            // 🌱 PLANT NAME FIELD (NEW)
            TextField(
              controller: plantController,
              decoration: const InputDecoration(
                labelText: "Plant Name (e.g. Tomato)",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: isLoading ? null : register,
              child: isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text("Create Account"),
            ),
          ],
        ),
      ),
    );
  }
}