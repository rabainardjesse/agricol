import 'package:flutter/material.dart';
import '../../services/auth_service.dart';
import 'security_pin_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  late final AuthService _authService;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _authService = AuthService();
  }

  void _sendResetEmail() async {
    if (_emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Entre ton email !')),
      );
      return;
    }

    setState(() => _isLoading = true);

    String? error = await _authService.resetPassword(
      _emailController.text.trim(),
    );

    setState(() => _isLoading = false);

    if (error == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email de réinitialisation envoyé !'),
          backgroundColor: Color(0xFF316D4F),
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SecurityPinScreen(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error)),
      );
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
            'Forgot Password',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 30,
              color: Color(0xFFFFFFFF),
            ),
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
                      horizontal: 30,
                      vertical: 35,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        const SizedBox(height: 20),

                        const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Color(0xFF0E3E3E),
                          ),
                        ),

                        const SizedBox(height: 8),

                        const Text(
                          "Don't worry, it happens to the best of us! Enter your registered email address below. We'll send you a 6-digit verification code to securely log you into your account.",
                          style: TextStyle(
                            fontFamily: 'League Spartan',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xFF0E3E3E),
                            height: 1.4,
                          ),
                        ),

                        const SizedBox(height: 40),

                        const Text(
                          'Enter Email Address',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Color(0xFF093030),
                          ),
                        ),

                        const SizedBox(height: 8),

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
                              fontSize: 15,
                              color: Color(0xFF093030),
                            ),
                            decoration: const InputDecoration(
                              hintText: 'example@example.com',
                              hintStyle: TextStyle(
                                color: Color(0x73093030),
                                fontSize: 15,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),

                        const SizedBox(height: 40),

                        Center(
                          child: SizedBox(
                            width: 169,
                            height: 45,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF093030),
                                shape: const StadiumBorder(),
                                elevation: 0,
                              ),
                              onPressed: _isLoading ? null : _sendResetEmail,
                              child: _isLoading
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    )
                                  : const Text(
                                      'Next Step',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFFFFFFFF),
                                      ),
                                    ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 80),

                        Center(
                          child: Text.rich(
                            TextSpan(
                              text: "Don't have an account? ",
                              style: const TextStyle(
                                fontFamily: 'League Spartan',
                                fontWeight: FontWeight.w300,
                                fontSize: 13,
                                color: Color(0xFF4B4544),
                              ),
                              children: [
                                WidgetSpan(
                                  child: GestureDetector(
                                    onTap: () => Navigator.pop(context),
                                    child: const Text(
                                      'Sign Up',
                                      style: TextStyle(
                                        fontFamily: 'League Spartan',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13,
                                        color: Color(0xFF093030),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        Center(
                          child: SizedBox(
                            width: 169,
                            height: 32,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFB7E6EA),
                                shape: const StadiumBorder(),
                                elevation: 0,
                              ),
                              onPressed: () => Navigator.pop(context),
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF093030),
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 70),
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
    );
  }
}