import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../auth/login_screen.dart';
import 'edit_profile_screen.dart';
import 'settings_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _username  = 'Loading...';
  String _email     = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() => _email = user.email ?? '');
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      if (doc.exists) {
        setState(() {
          _username = doc.data()?['username'] ?? user.email ?? '';
        });
      } else {
        setState(() => _username = user.email ?? '');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D5A3D),
      body: Column(
        children: [

          const SizedBox(height: 60),
          const Text(
            'My Profile',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Color(0xFFFFFFFF),
            ),
          ),
          const SizedBox(height: 20),

          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF316D4F),
                width: 2,
              ),
              image: const DecorationImage(
                image: AssetImage('assets/images/profile.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 16),

          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.only(
                  topLeft:  Radius.circular(44),
                  topRight: Radius.circular(44),
                ),
              ),
              child: Stack(
                children: [

                  SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 35,
                    ),
                    child: Column(
                      children: [

                        const SizedBox(height: 10),

                        // ── NOM FIREBASE ─────────────────────
                        Text(
                          _username,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            letterSpacing: 1,
                            color: Color(0xFF0E3E3E),
                          ),
                        ),

                        const SizedBox(height: 4),

                        // ── EMAIL FIREBASE ───────────────────
                        Text(
                          _email,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            letterSpacing: 1,
                            color: Color(0xFF757575),
                          ),
                        ),

                        const SizedBox(height: 40),

                        _buildMenuItem(
                          icon: Icons.person_outline,
                          label: 'Edit Profile',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const EditProfileScreen(),
                              ),
                            ).then((_) => _loadUserData());
                          },
                        ),

                        const SizedBox(height: 34),

                        _buildMenuItem(
                          icon: Icons.settings_outlined,
                          label: 'Setting',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SettingsScreen(),
                              ),
                            );
                          },
                        ),

                        const SizedBox(height: 34),

                        _buildMenuItem(
                          icon: Icons.headset_mic_outlined,
                          label: 'Help',
                          onTap: () {},
                        ),

                        const SizedBox(height: 34),

                        _buildMenuItem(
                          icon: Icons.logout,
                          label: 'Logout',
                          onTap: () => _showLogoutDialog(context),
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

  Widget _buildMenuItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 57,
            height: 53,
            decoration: BoxDecoration(
              color: const Color(0xFF316D4F),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Icon(icon, color: const Color(0xFFF1FFF3), size: 26),
          ),
          const SizedBox(width: 13),
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 15,
              color: Color(0xFF093030),
            ),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: const Color(0x33B7E6EA),
      builder: (context) => Dialog(
        alignment: Alignment.bottomCenter,
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          decoration: BoxDecoration(
            color: const Color(0xFFB7E6EA),
            borderRadius: BorderRadius.circular(27),
            border: Border.all(color: const Color(0xFF316D4F), width: 1),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Logout',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Color(0xFF316D4F),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                'are you sure you want to log out?',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0xFF0E3E3E),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        height: 41,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Center(
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color(0xFF316D4F),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        await FirebaseAuth.instance.signOut();
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                          (route) => false,
                        );
                      },
                      child: Container(
                        height: 41,
                        decoration: BoxDecoration(
                          color: const Color(0xFF316D4F),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Center(
                          child: Text(
                            'Yes, Logout',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}