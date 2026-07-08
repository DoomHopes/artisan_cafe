import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/theme/app_colors.dart';
import '../providers/user_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    final username = _usernameController.text.trim();
    final password = _passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter username and password')),
      );
      return;
    }

    try {
      await ref.read(currentUserProvider.notifier).login(username, password);
      if (mounted) {
        context.go('/');
      }
    } catch (e) {
      if (mounted) {
        String message = e.toString();
        if (message.startsWith('Exception: ')) {
          message = message.substring('Exception: '.length);
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight:
                  MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom,
            ),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  // Header
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 48,
                      horizontal: 24,
                    ),
                    child: Center(
                      child: Text(
                        'Artisan Cafe',
                        style: textTheme.headlineMedium?.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),

                  // Main Content Canvas
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 40,
                      ),
                      child: Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 448),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Hero Iconography
                              Container(
                                width: 80,
                                height: 80,
                                decoration: const BoxDecoration(
                                  color: AppColors.secondaryContainer,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.coffee_maker_outlined,
                                  color: AppColors.primary,
                                  size: 40,
                                ),
                              ),
                              const SizedBox(height: 48),

                              // Headlines
                              Text(
                                'Welcome Back',
                                style: textTheme.displaySmall?.copyWith(
                                  color: AppColors.primary,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Ready for your next brewing ritual?',
                                style: textTheme.bodyLarge?.copyWith(
                                  color: AppColors.secondary,
                                ),
                              ),
                              const SizedBox(height: 48),

                              // Form
                              Container(
                                padding: const EdgeInsets.all(24),
                                decoration: BoxDecoration(
                                  color: AppColors.surfaceContainerLow,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: AppColors.secondaryContainer
                                        .withValues(alpha: 0.5),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.primaryContainer
                                          .withValues(alpha: 0.08),
                                      blurRadius: 20,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    _buildTextField(
                                      label: 'LOGIN',
                                      hint: 'Username or Email',
                                      controller: _usernameController,
                                      textTheme: textTheme,
                                    ),
                                    const SizedBox(height: 24),
                                    _buildTextField(
                                      label: 'PASSWORD',
                                      hint: '••••••••',
                                      controller: _passwordController,
                                      isPassword: true,
                                      textTheme: textTheme,
                                    ),
                                    const SizedBox(height: 32),

                                    // Actions
                                    OutlinedButton(
                                      onPressed: _handleLogin,
                                      style: OutlinedButton.styleFrom(
                                        foregroundColor: AppColors.primary,
                                        side: const BorderSide(
                                          color: AppColors.primary,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 20,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        textStyle: textTheme.labelLarge,
                                      ),
                                      child: const Text('LOGIN'),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 48),

                              // Subtle Actions
                              TextButton.icon(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.cloud_download_outlined,
                                  size: 16,
                                ),
                                label: const Text('RESTORE FROM BACKUP'),
                                style: TextButton.styleFrom(
                                  foregroundColor: AppColors.secondary,
                                  textStyle: textTheme.labelMedium?.copyWith(
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 32,
                                    height: 1,
                                    color: AppColors.outlineVariant,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'OR',
                                    style: textTheme.labelSmall?.copyWith(
                                      color: AppColors.outlineVariant,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    width: 32,
                                    height: 1,
                                    color: AppColors.outlineVariant,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              TextButton(
                                onPressed: () {
                                  context.push('/register');
                                },
                                style: TextButton.styleFrom(
                                  foregroundColor: AppColors.secondary,
                                ),
                                child: Text(
                                  'Create a new profile',
                                  style: textTheme.bodyMedium?.copyWith(
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Footer
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 24,
                      horizontal: 24,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: AppColors.secondaryContainer),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          '© 2024 Ethos Brewing Rituals',
                          style: textTheme.bodyMedium?.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildFooterLink('Privacy', textTheme),
                            const SizedBox(width: 24),
                            _buildFooterLink('Terms', textTheme),
                            const SizedBox(width: 24),
                            _buildFooterLink('Support', textTheme),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFooterLink(String text, TextTheme textTheme) {
    return Text(
      text,
      style: textTheme.bodyMedium?.copyWith(color: AppColors.secondary),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required TextEditingController controller,
    bool isPassword = false,
    required TextTheme textTheme,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: textTheme.labelMedium?.copyWith(
            color: AppColors.secondary,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: isPassword && _obscurePassword,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: textTheme.bodyLarge?.copyWith(color: AppColors.outline),
            filled: true,
            fillColor: AppColors.surface,
            contentPadding: const EdgeInsets.all(20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.outline),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.outline),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: AppColors.outline,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
