import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // ✅ Contrôleurs vides — le texte apparaît comme hint
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController    = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    super.dispose();
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
                'Edit My Profile',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Color(0xFFFFFFFF),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // ── AVATAR avec icône caméra ──────────────────────────
          Stack(
            children: [
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
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: const Color(0xFF316D4F),
                    borderRadius: BorderRadius.circular(21),
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    color: Color(0xFFFFFFFF),
                    size: 14,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // ── CARTE BLANCHE ────────────────────────────────────
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
                      horizontal: 20,
                      vertical: 30,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        const SizedBox(height: 10),

                        // ── ACCOUNT SETTINGS ─────────────────
                        const Text(
                          'Account Settings',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Color(0xFF093030),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // ── LABEL USERNAME ───────────────────
                        const Text(
                          'Username',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Color(0xFF093030),
                          ),
                        ),
                        const SizedBox(height: 8),

                        // ── CHAMP USERNAME ───────────────────
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                            color: const Color(0xFFB7E6EA),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            controller: _usernameController,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                              color: Color(0xFF093030),
                            ),
                            decoration: const InputDecoration(
                              // ✅ hintText au lieu de text dans controller
                              hintText: 'John Smith',
                              hintStyle: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w300,
                                fontSize: 13,
                                color: Color(0x73093030),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // ── LABEL EMAIL ──────────────────────
                        const Text(
                          'Email Address',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Color(0xFF093030),
                          ),
                        ),
                        const SizedBox(height: 8),

                        // ── CHAMP EMAIL ──────────────────────
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                            color: const Color(0xFFB7E6EA),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                              color: Color(0xFF093030),
                            ),
                            decoration: const InputDecoration(
                              // ✅ hintText au lieu de text dans controller
                              hintText: 'example@example.com',
                              hintStyle: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w300,
                                fontSize: 13,
                                color: Color(0x73093030),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),

                        const SizedBox(height: 40),

                        // ── BOUTON UPDATE PROFILE ────────────
                        Center(
                          child: SizedBox(
                            width: 169,
                            height: 36,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF316D4F),
                                shape: const StadiumBorder(),
                                elevation: 0,
                              ),
                              onPressed: () => Navigator.pop(context),
                              child: const Text(
                                'Update Profile',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
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
              icon: const Icon(
                Icons.home_outlined,
                color: Color(0xFF316D4F),
                size: 26,
              ),
            ),

            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.eco_outlined,
                color: Color(0xFF316D4F),
                size: 26,
              ),
            ),

            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0xFFF2F8FF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.smart_toy_outlined,
                color: Color(0xFF316D4F),
                size: 24,
              ),
            ),

            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.person,
                color: Color(0xFF316D4F),
                size: 26,
              ),
            ),

          ],
        ),
      ),
    );
  }
}