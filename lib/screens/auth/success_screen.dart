import 'package:flutter/material.dart';
import '../profile/profile_screen.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D5A3D),
      body: Stack(
        children: [

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                // ── EMOJI ────────────────────────────────────
                Container(
                  width: 150,
                  height: 150,
                  decoration: const BoxDecoration(
                    color: Color(0xFFB7E6EA),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      '😝',
                      style: TextStyle(fontSize: 80),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // ── TEXTE ─────────────────────────────────────
                const Text(
                  'Password Has Been\nChanged Successfully',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Color(0xFFFFFFFF),
                    height: 1.4,
                  ),
                ),

                const SizedBox(height: 40),

                // ── BOUTON LOG IN ─────────────────────────────
                SizedBox(
                  width: 207,
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFB7E6EA),
                      shape: const StadiumBorder(),
                      elevation: 0,
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfileScreen(),
                        ),
                        (route) => false,
                      );
                    },
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF093030),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),

          // ── FLECHE RETOUR ──────────────────────────────────
          Positioned(
            bottom: 20,
            left: 18,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back,
                color: Color(0xFFFFFFFF),
                size: 22,
              ),
            ),
          ),

        ],
      ),
    );
  }
}