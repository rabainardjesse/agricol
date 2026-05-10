import 'package:flutter/material.dart';

class PasswordSettingsScreen extends StatefulWidget {
  const PasswordSettingsScreen({super.key});

  @override
  State<PasswordSettingsScreen> createState() =>
      _PasswordSettingsScreenState();
}

class _PasswordSettingsScreenState extends State<PasswordSettingsScreen> {
  final TextEditingController _currentPassController = TextEditingController();
  final TextEditingController _newPassController     = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();

  bool _obscureCurrent = true;
  bool _obscureNew     = true;
  bool _obscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D5A3D),
      body: Column(
        children: [

          // ── HEADER VERT ──────────────────────────────────────
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
                'Password Settings',
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

          // ── CARTE VERTE CLAIRE ───────────────────────────────
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
                      vertical: 40,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        // ── CURRENT PASSWORD ─────────────────
                        const Text(
                          'Current Password',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Color(0xFF093030),
                          ),
                        ),
                        const SizedBox(height: 8),
                        _buildPasswordField(
                          controller: _currentPassController,
                          obscure: _obscureCurrent,
                          onToggle: () => setState(() {
                            _obscureCurrent = !_obscureCurrent;
                          }),
                        ),

                        const SizedBox(height: 20),

                        // ── NEW PASSWORD ─────────────────────
                        const Text(
                          'New Password',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Color(0xFF0E3E3E),
                          ),
                        ),
                        const SizedBox(height: 8),
                        _buildPasswordField(
                          controller: _newPassController,
                          obscure: _obscureNew,
                          onToggle: () => setState(() {
                            _obscureNew = !_obscureNew;
                          }),
                        ),

                        const SizedBox(height: 20),

                        // ── CONFIRM NEW PASSWORD ─────────────
                        const Text(
                          'Confirm New Password',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Color(0xFF0E3E3E),
                          ),
                        ),
                        const SizedBox(height: 8),
                        _buildPasswordField(
                          controller: _confirmPassController,
                          obscure: _obscureConfirm,
                          onToggle: () => setState(() {
                            _obscureConfirm = !_obscureConfirm;
                          }),
                        ),

                        const SizedBox(height: 60),

                        // ── BOUTON CHANGE PASSWORD ───────────
                        Center(
                          child: SizedBox(
                            width: 218,
                            height: 45,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF316D4F),
                                shape: const StadiumBorder(),
                                elevation: 0,
                              ),
                              onPressed: () => Navigator.pop(context),
                              child: const Text(
                                'Change Password',
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

                  // ── FLECHE RETOUR BAS ────────────────────────
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

      // ── BOTTOM NAV BAR ───────────────────────────────────────
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

  // ── WIDGET CHAMP PASSWORD ────────────────────────────────────
  Widget _buildPasswordField({
    required TextEditingController controller,
    required bool obscure,
    required VoidCallback onToggle,
  }) {
    return Container(
      height: 41,
      decoration: BoxDecoration(
        color: const Color(0xFFB7E6EA),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: obscure,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                letterSpacing: 6,
                color: Color(0xFF0E3E3E),
              ),
              decoration: const InputDecoration(
                hintText: '••••••••',
                hintStyle: TextStyle(
                  fontSize: 12,
                  letterSpacing: 4,
                  color: Color(0x730E3E3E),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20, vertical: 10,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          GestureDetector(
            onTap: onToggle,
            child: Padding(
              padding: const EdgeInsets.only(right: 14),
              child: Icon(
                obscure
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: const Color(0xFF0E3E3E),
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}