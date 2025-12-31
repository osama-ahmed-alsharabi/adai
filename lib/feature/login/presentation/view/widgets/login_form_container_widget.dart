import 'package:flutter/material.dart';
import 'package:adai/core/utils/app_color.dart';

class LoginWaveContainer extends StatelessWidget {
  const LoginWaveContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipPath(
        clipper: LoginExactWaveClipper(),
        child: Container(
          width: double.infinity,
          color: AppColor.primaryColor,
          padding: const EdgeInsets.fromLTRB(
            24,
            80,
            24,
            0,
          ), // Increased top padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Welcome Text
              const Text(
                'مرحباً',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'DGHeaven',
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'قم بتسجيل الدخول..',
                style: TextStyle(color: Color(0xFFB1B1B1), fontSize: 16),
              ),

              const SizedBox(height: 32),

              // Phone Number Field
              _buildLabel('رقم الجوال'),
              const SizedBox(height: 8),
              _buildTextField(
                hint: 'قم بإدخال رقم الجوال',
                icon: Icons.mail_outline,
              ),

              const SizedBox(height: 24),

              // Password Field
              _buildLabel('كلمة المرور'),
              const SizedBox(height: 8),
              _buildTextField(
                hint: 'قم بإدخال كلمة المرور',
                icon: Icons.lock_outline,
                isPassword: true,
              ),

              const SizedBox(height: 16),

              // Forgot Password
              const Text(
                'نسيت كلمة المرور؟',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 32),

              // Login Button
              Container(
                width: double.infinity,
                height: 55,
                decoration: BoxDecoration(
                  color: const Color(0xFF8A8ED8),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.arrow_back, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      'تسجـيــل الدخــــول',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Create Account Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'إنشاء حساب',
                    style: TextStyle(
                      color: Color(0xFF8A8ED8),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'لا تمتلك حساب؟ ',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildTextField({
    required String hint,
    required IconData icon,
    bool isPassword = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        textAlign: TextAlign.right,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
          prefixIcon: isPassword
              ? const Icon(
                  Icons.visibility_outlined,
                  color: AppColor.primaryColor,
                )
              : null,
          suffixIcon: Icon(icon, color: AppColor.primaryColor),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
        ),
      ),
    );
  }
}

class LoginExactWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var h = size.height;
    var w = size.width;
    final path = Path();

    // Top Curve: Starts lower at sides (50), Peaks at center (0)
    // This creates a Hill / Convex shape
    path.moveTo(0, 50);
    path.quadraticBezierTo(
      w / 2,
      -20,
      w,
      50,
    ); // Control point higher than 0 to make it rounder

    // Right Side
    path.lineTo(w, h - 80);

    // Bottom Curve: Convex Down
    // Starts (w, h-80), Lowest (w/2, h), Ends (0, h-80)
    path.quadraticBezierTo(w / 2, h + 20, 0, h - 80);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
