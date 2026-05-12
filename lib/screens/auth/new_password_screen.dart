import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'success_screen.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final TextEditingController _passwordController =
      TextEditingController();

  final TextEditingController _confirmPassController =
      TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  // ---------------- CHANGE PASSWORD FUNCTION ----------------
  Future<void> _changePassword() async {
    String newPassword = _passwordController.text.trim();
    String confirmPassword = _confirmPassController.text.trim();

    // Check empty fields
    if (newPassword.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill all fields"),
        ),
      );
      return;
    }

    // Check password match
    if (newPassword != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Passwords do not match"),
        ),
      );
      return;
    }

    // Check password length
    if (newPassword.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password must be at least 6 characters"),
        ),
      );
      return;
    }

    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("No user logged in"),
          ),
        );
        return;
      }

      // Update password in Firebase
      await user.updatePassword(newPassword);

      if (!mounted) return;

      // Navigate to success screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SuccessScreen(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage = "Password change failed";

      if (e.code == 'requires-recent-login') {
        errorMessage =
            "Please login again before changing password";
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error: $e"),
        ),
      );
    }
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D5A3D),
      body: Column(
        children: [
          const SizedBox(height: 60),

          const Text(
            'New Password',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 30,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 30),

          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFFF1FFF3),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
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
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),

                        const Text(
                          'New Password',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF093030),
                          ),
                        ),

                        const SizedBox(height: 8),

                        // PASSWORD FIELD
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color(0xFFB7E6EA),
                            borderRadius:
                                BorderRadius.circular(18),
                          ),
                          child: TextField(
                            controller: _passwordController,
                            obscureText: _obscurePassword,
                            decoration: InputDecoration(
                              hintText: "Enter new password",
                              border: InputBorder.none,
                              contentPadding:
                                  const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 15,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscurePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscurePassword =
                                        !_obscurePassword;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        const Text(
                          'Confirm Password',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF093030),
                          ),
                        ),

                        const SizedBox(height: 8),

                        // CONFIRM PASSWORD FIELD
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color(0xFFB7E6EA),
                            borderRadius:
                                BorderRadius.circular(18),
                          ),
                          child: TextField(
                            controller:
                                _confirmPassController,
                            obscureText:
                                _obscureConfirmPassword,
                            decoration: InputDecoration(
                              hintText:
                                  "Confirm new password",
                              border: InputBorder.none,
                              contentPadding:
                                  const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 15,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureConfirmPassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscureConfirmPassword =
                                        !_obscureConfirmPassword;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 180),

                        // CHANGE PASSWORD BUTTON
                        SizedBox(
                          width: double.infinity,
                          height: 45,
                          child: ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color(0xFF093030),
                              shape:
                                  const StadiumBorder(),
                            ),

                            // HERE IS THE FIX
                            onPressed: _changePassword,

                            child: const Text(
                              "Change Password",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight:
                                    FontWeight.w600,
                                color: Colors.white,
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
                      onTap: () =>
                          Navigator.pop(context),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Color(0xFF093030),
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