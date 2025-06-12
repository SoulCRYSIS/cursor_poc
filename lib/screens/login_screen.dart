import 'package:flutter/material.dart';
import '../components/custom_text_field.dart';
import '../components/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Top image section
              Container(
                width: double.infinity,
                height: 312,
                color: const Color(0xFFEAF2FF),
                child: Center(
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xFFB4DBFF),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Icon(
                      Icons.image_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),

              // Login form section
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 40,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Welcome title
                    const Text(
                      'Welcome!',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF000000),
                        letterSpacing: 0.24,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Email field
                    CustomTextField(
                      controller: _emailController,
                      placeholder: 'Email Address',
                      showTitle: false,
                      state: TextFieldState.normal,
                    ),
                    const SizedBox(height: 16),

                    // Password field with custom implementation
                    Stack(
                      children: [
                        CustomTextField(
                          controller: _passwordController,
                          placeholder: 'Password',
                          showTitle: false,
                          state: TextFieldState.normal,
                        ),
                        Positioned(
                          right: 16,
                          top: 16,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                            child: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: const Color(0xFF8F9098),
                              size: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Forgot password link
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          // TODO: Handle forgot password
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Text(
                          'Forgot password?',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF006FFD),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Login button
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: CustomButton(
                        text: 'Login',
                        variant: ButtonVariant.primary,
                        height: 48,
                        width: double.infinity,
                        onPressed: () {
                          // TODO: Handle login
                        },
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Register text
                    Center(
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            letterSpacing: 0.12,
                          ),
                          children: [
                            TextSpan(
                              text: 'Not a member? ',
                              style: TextStyle(
                                color: Color(0xFF71727A),
                                fontWeight: FontWeight.w400,
                                height: 1.33,
                              ),
                            ),
                            TextSpan(
                              text: 'Register now',
                              style: TextStyle(
                                color: Color(0xFF006FFD),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Divider
                    Container(
                      height: 0.5,
                      width: double.infinity,
                      color: const Color(0xFFD4D6DD),
                    ),
                    const SizedBox(height: 24),

                    // Social login section
                    Column(
                      children: [
                        const Text(
                          'Or continue with',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF71727A),
                            letterSpacing: 0.12,
                            height: 1.33,
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Social buttons row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Google button
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: const Color(0xFFED3241),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Icon(
                                Icons.g_mobiledata,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            const SizedBox(width: 12),

                            // Apple button
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: const Color(0xFF1F2024),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Icon(
                                Icons.apple,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            const SizedBox(width: 12),

                            // Facebook button
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: const Color(0xFF006FFD),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Icon(
                                Icons.facebook,
                                color: Colors.white,
                                size: 20,
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
      ),
    );
  }
}
