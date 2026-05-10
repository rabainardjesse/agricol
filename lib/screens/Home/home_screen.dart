import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1FFF3),
      body: SafeArea(
        child: Column(
          children: [

            // ── CONTENU SCROLLABLE ─────────────────────────────
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const SizedBox(height: 16),

                    // ── HEADER ───────────────────────────────────
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        // photo profil + nom
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 28,
                              backgroundImage: AssetImage(
                                'assets/images/profile.png',
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'John Doe',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Color(0xFF0E3E3E),
                                  ),
                                ),
                                Text(
                                  'example@example.com',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 11,
                                    color: Color(0xFF9E9E9E),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        // bouton about us
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xFF093030),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              const Text(
                                'about us',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  color: Color(0xFF093030),
                                ),
                              ),
                              const SizedBox(width: 6),
                              Image.asset(
                                'assets/images/plant.png',
                                width: 20,
                                height: 20,
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),

                    const SizedBox(height: 20),

                    // ── TITRE PRINCIPAL ──────────────────────────
                    const Text(
                      'Monitor Your\nSmart Plant',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: Color(0xFF0E3E3E),
                        height: 1.3,
                      ),
                    ),

                    const SizedBox(height: 24),

                    // ── MY PLANT ─────────────────────────────────
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'My Plant',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color(0xFF0E3E3E),
                          ),
                        ),
                        const Icon(
                          Icons.chevron_right,
                          color: Color(0xFF0E3E3E),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // ── CARTE PLANTE ─────────────────────────────
                    Container(
                      width: double.infinity,
                      height: 219,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFFB2EBF2),
                            Color(0xFFE0F7FA),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Stack(
                        children: [

                          // image plante à gauche
                          Positioned(
                            left: 0,
                            bottom: 0,
                            child: Image.asset(
                              'assets/images/plant.png',
                              width: 160,
                              height: 190,
                              fit: BoxFit.contain,
                            ),
                          ),

                          // infos à droite
                          Positioned(
                            right: 16,
                            top: 30,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                // nom de la plante
                                const Text(
                                  "Bird's Nest\nFern",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Color(0xFF0E3E3E),
                                  ),
                                ),

                                const SizedBox(height: 20),

                                // température
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.wb_sunny_outlined,
                                      color: Color(0xFF093030),
                                      size: 22,
                                    ),
                                    const SizedBox(width: 8),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'Room temperature',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 10,
                                            color: Color(0xFF9E9E9E),
                                          ),
                                        ),
                                        Text(
                                          '24°C',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18,
                                            color: Color(0xFF0E3E3E),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 16),

                                // humidité
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.lightbulb_outline,
                                      color: Color(0xFF093030),
                                      size: 22,
                                    ),
                                    const SizedBox(width: 8),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'Water level',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 10,
                                            color: Color(0xFF9E9E9E),
                                          ),
                                        ),
                                        Text(
                                          '76%',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18,
                                            color: Color(0xFF0E3E3E),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ),

                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // ── AI ASSISTANT ─────────────────────────────
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'AI Assistant',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color(0xFF0E3E3E),
                          ),
                        ),
                        const Icon(
                          Icons.chevron_right,
                          color: Color(0xFF0E3E3E),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // ── CARTE AI ──────────────────────────────────
                    Container(
                      width: double.infinity,
                      height: 219,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFFB2EBF2),
                            Color(0xFFE0F7FA),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Stack(
                        children: [

                          // image robot à gauche
                          Positioned(
                            left: 0,
                            bottom: 0,
                            child: Image.asset(
                              'assets/images/robot.png',
                              width: 160,
                              height: 190,
                              fit: BoxFit.contain,
                            ),
                          ),

                          // infos à droite
                          Positioned(
                            right: 16,
                            top: 40,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                const Text(
                                  'Planty 🌿',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Color(0xFF0E3E3E),
                                  ),
                                ),

                                const SizedBox(height: 8),

                                const SizedBox(
                                  width: 150,
                                  child: Text(
                                    'Ask me anything about your plant\'s health!',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      color: Color(0xFF0E3E3E),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 16),

                                // bouton chat
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFFFFFF),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Row(
                                    children: [
                                      Text(
                                        'Chat with Planty',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF093030),
                                        ),
                                      ),
                                      SizedBox(width: 4),
                                      Icon(
                                        Icons.arrow_forward,
                                        size: 14,
                                        color: Color(0xFF093030),
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),

                        ],
                      ),
                    ),

                    const SizedBox(height: 90),
                  ],
                ),
              ),
            ),

          ],
        ),
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

            // Home
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.home_outlined,
                color: Color(0xFF093030),
                size: 28,
              ),
            ),

            // Plant
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.eco_outlined,
                color: Color(0xFF9E9E9E),
                size: 28,
              ),
            ),

            // Profile photo
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),

            // Settings
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.person_outline,
                color: Color(0xFF9E9E9E),
                size: 28,
              ),
            ),

          ],
        ),
      ),
    );
  }
}