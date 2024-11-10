import 'package:flutter/material.dart';

import 'widgets/login_form.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback toggleTheme;

  const LoginScreen({super.key, required this.toggleTheme});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: colors.background,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              // Background Pattern
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: colors.background,
                    image: DecorationImage(
                      image: AssetImage(
                        isDark
                            ? 'assets/patterns/dark_pattern.png'
                            : 'assets/patterns/light_pattern.png',
                      ),
                      opacity: 0.1,
                      repeat: ImageRepeat.repeat,
                    ),
                  ),
                ),
              ),
              // Content
              constraints.maxWidth > 1200
                  ? _buildWebLayout(colors)
                  : constraints.maxWidth > 600
                      ? _buildTabletLayout(colors)
                      : _buildMobileLayout(colors),
              // Theme Toggle
              Positioned(
                top: 20,
                right: 20,
                child: IconButton(
                  icon: Icon(
                    isDark ? Icons.light_mode : Icons.dark_mode,
                    color: colors.primary,
                  ),
                  onPressed: widget.toggleTheme,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildLoginForm(ColorScheme colors) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LogoHeader(),
        // Rest of the form with enhanced styling
        LoginForm(
          phoneController: _phoneController,
          passwordController: _passwordController,
          colors: colors,
        ),
      ],
    );
  }

  // Keep your existing layout methods but wrap content in Container with gradient background
  Widget _buildWebLayout(ColorScheme colors) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        padding: const EdgeInsets.all(32),
        child: _buildLoginForm(colors),
      ),
    );
  }

  // Your existing layout methods with ColorScheme parameter
  Widget _buildMobileLayout(ColorScheme colors) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: _buildLoginForm(colors),
        ),
      ),
    );
  }

  Widget _buildTabletLayout(ColorScheme colors) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500),
            padding: const EdgeInsets.all(32.0),
            child: _buildLoginForm(colors),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

class LogoHeader extends StatelessWidget {
  const LogoHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      height: 120,
      margin: const EdgeInsets.only(bottom: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/logo/police_emblem.png',
            height: 100,
          ),
          const SizedBox(width: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Royal Thai Police',
                style: TextStyle(
                  color: colors.primary,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Kanit',
                ),
              ),
              Text(
                'Data Center',
                style: TextStyle(
                  color: colors.secondary,
                  fontSize: 24,
                  fontFamily: 'Kanit',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
