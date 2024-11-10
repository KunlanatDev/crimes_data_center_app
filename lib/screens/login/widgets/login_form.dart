import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final ColorScheme colors;

  const LoginForm({
    super.key,
    required this.phoneController,
    required this.passwordController,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: colors.primary.withOpacity(0.2)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: phoneController,
              decoration:
                  _buildInputDecoration('เบอร์โทรศัพท์', Icons.phone, colors),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: _buildInputDecoration('รหัสผ่าน', Icons.lock, colors),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // // Validate inputs
                // if (phoneController.text.isNotEmpty &&
                //     passwordController.text.isNotEmpty) {
                //   // Navigate to dashboard
                //   Navigator.pushReplacementNamed(context, '/dashboard');
                // } else {
                //   // Show validation error
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     const SnackBar(
                //       content: Text('กรุณากรอกข้อมูลให้ครบถ้วน'),
                //       backgroundColor: Colors.red,
                //     ),
                //   );
                // }
                Navigator.pushReplacementNamed(context, '/dashboard');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
              ),
              child: const Text(
                'เข้าสู่ระบบ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Kanit',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration(
      String hint, IconData icon, ColorScheme colors) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: Icon(icon, color: colors.primary),
      filled: true,
      fillColor: colors.surface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: colors.primary.withOpacity(0.2)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: colors.primary, width: 2),
      ),
    );
  }
}
