import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/theme/app_colors.dart';
import '../providers/user_provider.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleRegister() async {
    final username = _loginController.text.trim();
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      await ref.read(currentUserProvider.notifier).register(username, password);
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
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
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
              minHeight: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom,
            ),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  // Top App Bar
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
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
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                      child: Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 480),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Header
                              Text(
                                'Start Your Ritual',
                                style: textTheme.displayMedium?.copyWith(
                                  color: AppColors.primary,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Set the foundation for your brewing journey. Your data is your own.',
                                style: textTheme.bodyLarge?.copyWith(
                                  color: AppColors.secondary,
                                ),
                              ),
                              const SizedBox(height: 48),

                              // Form Card
                              Container(
                                padding: const EdgeInsets.all(40),
                                decoration: BoxDecoration(
                                  color: AppColors.surfaceContainerLowest,
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: AppColors.secondaryContainer,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.primaryContainer.withValues(alpha: 0.08),
                                      blurRadius: 20,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    _buildUnderlinedTextField(
                                      label: 'LOGIN',
                                      hint: 'Enter your username',
                                      controller: _loginController,
                                      textTheme: textTheme,
                                    ),
                                    const SizedBox(height: 32),
                                    _buildUnderlinedTextField(
                                      label: 'PASSWORD',
                                      hint: '••••••••',
                                      controller: _passwordController,
                                      isPassword: true,
                                      obscureText: _obscurePassword,
                                      onToggleVisibility: () {
                                        setState(() {
                                          _obscurePassword = !_obscurePassword;
                                        });
                                      },
                                      textTheme: textTheme,
                                    ),
                                    const SizedBox(height: 32),
                                    _buildUnderlinedTextField(
                                      label: 'CONFIRM PASSWORD',
                                      hint: '••••••••',
                                      controller: _confirmPasswordController,
                                      isPassword: true,
                                      obscureText: _obscureConfirmPassword,
                                      onToggleVisibility: () {
                                        setState(() {
                                          _obscureConfirmPassword = !_obscureConfirmPassword;
                                        });
                                      },
                                      textTheme: textTheme,
                                    ),
                                    const SizedBox(height: 32),
                                    
                                    // Privacy Note
                                    Container(
                                      padding: const EdgeInsets.all(24),
                                      decoration: BoxDecoration(
                                        color: AppColors.surfaceContainer,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Icon(
                                            Icons.lock_outline,
                                            color: AppColors.secondary,
                                            size: 20,
                                          ),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: Text(
                                              'Everything stays on your device. We value your focus and privacy; no accounts or cloud sync required.',
                                              style: textTheme.bodyMedium?.copyWith(
                                                color: AppColors.secondary,
                                                height: 1.6,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 40),

                                    // Action
                                    ElevatedButton(
                                      onPressed: _isLoading ? null : _handleRegister,
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.primary,
                                        foregroundColor: AppColors.onPrimary,
                                        padding: const EdgeInsets.symmetric(vertical: 20),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(32),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          if (_isLoading) ...[
                                            const SizedBox(
                                              width: 20,
                                              height: 20,
                                              child: CircularProgressIndicator(
                                                strokeWidth: 2,
                                                valueColor: AlwaysStoppedAnimation<Color>(AppColors.onPrimary),
                                              ),
                                            ),
                                            const SizedBox(width: 12),
                                            Text(
                                              'Setting up...',
                                              style: textTheme.bodyLarge?.copyWith(
                                                color: AppColors.onPrimary,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ] else ...[
                                            Text(
                                              'Create Account',
                                              style: textTheme.bodyLarge?.copyWith(
                                                color: AppColors.onPrimary,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const SizedBox(width: 12),
                                            const Icon(Icons.arrow_forward, size: 20),
                                          ],
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 32),

                              // Sign in mention
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Already have an account?',
                                    style: textTheme.bodyMedium?.copyWith(
                                      color: AppColors.secondary,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      context.push('/login');
                                    },
                                    child: Text(
                                      'Login',
                                      style: textTheme.bodyMedium?.copyWith(
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Footer
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
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
                            color: AppColors.secondary,
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
      style: textTheme.bodyMedium?.copyWith(
        color: AppColors.secondary,
      ),
    );
  }

  Widget _buildUnderlinedTextField({
    required String label,
    required String hint,
    required TextEditingController controller,
    bool isPassword = false,
    bool obscureText = false,
    VoidCallback? onToggleVisibility,
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
        TextField(
          controller: controller,
          obscureText: isPassword && obscureText,
          style: textTheme.bodyLarge?.copyWith(
            color: AppColors.onSurface,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: textTheme.bodyLarge?.copyWith(
              color: AppColors.outline,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.outlineVariant),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary, width: 2),
            ),
            isDense: true,
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility,
                      color: AppColors.outline,
                    ),
                    onPressed: onToggleVisibility,
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
