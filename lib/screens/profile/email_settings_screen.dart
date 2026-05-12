import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'profile_security_pin_screen.dart';

class EmailSettingsScreen extends StatefulWidget {
  const EmailSettingsScreen({super.key});

  @override
  State<EmailSettingsScreen> createState() => _EmailSettingsScreenState();
}

class _EmailSettingsScreenState extends State<EmailSettingsScreen> {
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;

  void _sendVerification() async {
    if (_emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Entre ton nouvel email !')),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.verifyBeforeUpdateEmail(
          _emailController.text.trim(),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Email de vérification envoyé ! Vérifie ta boîte.'),
            backgroundColor: Color(0xFF316D4F),
          ),
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProfileSecurityPinScreen(),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur: ${e.toString()}')),
      );
    }

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D5A3D),
      body: Column(
        children: [

          const SizedBox(height: 50),

          Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Color(0xFFFFFFFF),
                      size: 22,
                    ),
                  ),
                ),
              ),
              const Text(
                'Email Settings',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Color(0xFFFFFFFF),
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),

          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFFF1FFF3),
                borderRadius: BorderRadius.only(
                  topLeft:  Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
              child: Stack(
                children: [

                  SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 30,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        const SizedBox(height: 10),

                        const Text(
                          'Change Email Adress',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Color(0xFF0E3E3E),
                          ),
                        ),

                        const SizedBox(height: 12),

                        const Text(
                          "Enter the new email address below. We'll send you a 6-digit verification code to securely log you into your account.",
                          style: TextStyle(
                            fontFamily: 'League Spartan',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xFF0E3E3E),
                            height: 1.5,
                          ),
                        ),

                        const SizedBox(height: 60),

                        const Text(
                          'Enter The New Email Address',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Color(0xFF093030),
                          ),
                        ),

                        const SizedBox(height: 10),

                        Container(
                          height: 41,
                          decoration: BoxDecoration(
                            color: const Color(0xFFB7E6EA),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: TextField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              color: Color(0xFF093030),
                            ),
                            decoration: const InputDecoration(
                              hintText: 'example@example.com',
                              hintStyle: TextStyle(
                                color: Color(0x73093030),
                                fontSize: 14,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),

                        const SizedBox(height: 50),

                        Center(
                          child: SizedBox(
                            width: 169,
                            height: 32,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF316D4F),
                                shape: const StadiumBorder(),
                                elevation: 0,
                              ),
                              onPressed: _isLoading ? null : _sendVerification,
                              child: _isLoading
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    )
                                  : const Text(
                                      'Next Step',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        color: Color(0xFFFFFFFF),
                                      ),
                                    ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 80),
                      ],
                    ),
                  ),

                  Positioned(
                    bottom: 20,
                    left: 18,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Color(0xFF093030),
                        size: 22,
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        height: 64,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              blurRadius: 56,
              offset: const Offset(10, 14),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.home_outlined,
                  color: Color(0xFF316D4F), size: 26),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.eco_outlined,
                  color: Color(0xFF316D4F), size: 26),
            ),
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0xFFF2F8FF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.smart_toy_outlined,
                  color: Color(0xFF316D4F), size: 24),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person,
                  color: Color(0xFF316D4F), size: 26),
            ),
          ],
        ),
      ),
    );
  }
}