import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:onest_all_router_app/views/widgets/custom_text_field_widget.dart';
import 'package:onest_all_router_app/viewmodels/login_viewmodel.dart';


class LoginScreen extends StatefulWidget {
  final String? gatewayIp;

  const LoginScreen({super.key, this.gatewayIp});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F5FC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color(0xFF1B1B1E),
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Login',
          style: GoogleFonts.outfit(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1B1B1E),
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    // Lottie JSON Animation
                    Lottie.asset(
                      'assets/animations/router_rotating.json',
                      height: 140,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 40),
                    // Username Field
                    CustomTextFieldWidget(
                      label: 'Username',
                      hint: 'Enter your username',
                      controller: _usernameController,
                      focusNode: _usernameFocusNode,
                    ),
                    const SizedBox(height: 20),
                    // Password Field
                    CustomTextFieldWidget(
                      label: 'Password',
                      hint: 'Enter your password',
                      controller: _passwordController,
                      focusNode: _passwordFocusNode,
                      obscureText: _obscurePassword,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        child: Icon(
                          _obscurePassword
                              ? Icons.visibility_off_rounded
                              : Icons.visibility_rounded,
                          color: const Color(0xFF5E6272),
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Login button
            Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 24.0),
              child: Row(
                children: [
                  Expanded(
                    child: Consumer<LoginViewmodel>(
                      builder: (context, viewModel, child) {
                        return ElevatedButton(
                          onPressed: viewModel.isLoading
                              ? null
                              : () async {
                                  final username = _usernameController.text.trim();
                                  final password = _passwordController.text.trim();

                                  if (username.isEmpty || password.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Please enter both username and password.',
                                          style: GoogleFonts.outfit(),
                                        ),
                                        backgroundColor: const Color(0xFFE20613),
                                      ),
                                    );
                                    return;
                                  }

                                  final String computedBaseUrl = widget.gatewayIp != null && widget.gatewayIp!.isNotEmpty
                                      ? 'http://${widget.gatewayIp}'
                                      : 'http://192.168.1.1';
                                  final String wholeUrl = '$computedBaseUrl/userRpm/LoginRpm.htm?Save=Save';

                                  debugPrint('[LoginScreen] Method: login');
                                  debugPrint('[LoginScreen] Username: $username');
                                  debugPrint('[LoginScreen] Password: $password');
                                  debugPrint('[LoginScreen] Base URL: $computedBaseUrl');
                                  debugPrint('[LoginScreen] Whole URL: $wholeUrl');

                                  final success = await viewModel.login(
                                    username: username,
                                    password: password,
                                    baseUrl: computedBaseUrl,
                                  );

                                  if (!context.mounted) return;

                                  if (success) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Successfully logged in!',
                                          style: GoogleFonts.outfit(),
                                        ),
                                        backgroundColor: const Color(0xFF2D29D4),
                                      ),
                                    );
                                    // Here you can navigate further if needed:
                                    // Navigator.pushReplacement(context, ...);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          viewModel.errorMessage ?? 'Login failed.',
                                          style: GoogleFonts.outfit(),
                                        ),
                                        backgroundColor: const Color(0xFFE20613),
                                      ),
                                    );
                                  }
                                },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2D29D4),
                            foregroundColor: Colors.white,
                            disabledBackgroundColor: const Color(0xFF2D29D4).withAlpha(153),
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 0,
                          ),
                          child: viewModel.isLoading
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                  ),
                                )
                              : Text(
                                  'Log In',
                                  style: GoogleFonts.outfit(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

