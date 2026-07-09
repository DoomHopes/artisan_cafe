import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:artisan_cafe/core/extensions/context_extensions.dart';
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
    final l10n = context.l10n;
    final username = _loginController.text.trim();
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.fillAllFields)));
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.passwordsDoNotMatch)));
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
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(message)));
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
    final l10n = context.l10n;

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
                  // Top App Bar
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 48,
                      horizontal: 24,
                    ),
                    child: Center(
                      child: Text(
                        l10n.appName,
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
                          constraints: const BoxConstraints(maxWidth: 480),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Header
                              Text(
                                l10n.startRitual,
                                style: textTheme.displayMedium?.copyWith(
                                  color: AppColors.primary,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                l10n.setFoundation,
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
                                    _buildUnderlinedTextField(
                                      label: l10n.loginLabel,
                                      hint: l10n.enterUsernameHint,
                                      controller: _loginController,
                                      textTheme: textTheme,
                                    ),
                                    const SizedBox(height: 32),
                                    _buildUnderlinedTextField(
                                      label: l10n.passwordLabel,
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
                                      label: l10n.confirmPasswordLabel,
                                      hint: '••••••••',
                                      controller: _confirmPasswordController,
                                      isPassword: true,
                                      obscureText: _obscureConfirmPassword,
                                      onToggleVisibility: () {
                                        setState(() {
                                          _obscureConfirmPassword =
                                              !_obscureConfirmPassword;
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Icon(
                                            Icons.lock_outline,
                                            color: AppColors.secondary,
                                            size: 20,
                                          ),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: Text(
                                              l10n.privacyNote,
                                              style: textTheme.bodyMedium
                                                  ?.copyWith(
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
                                      onPressed: _isLoading
                                          ? null
                                          : _handleRegister,
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.primary,
                                        foregroundColor: AppColors.onPrimary,
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 20,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            32,
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          if (_isLoading) ...[
                                            const SizedBox(
                                              width: 20,
                                              height: 20,
                                              child: CircularProgressIndicator(
                                                strokeWidth: 2,
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                      Color
                                                    >(AppColors.onPrimary),
                                              ),
                                            ),
                                            const SizedBox(width: 12),
                                            Text(
                                              l10n.settingUp,
                                              style: textTheme.bodyLarge
                                                  ?.copyWith(
                                                    color: AppColors.onPrimary,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ] else ...[
                                            Text(
                                              l10n.createAccount,
                                              style: textTheme.bodyLarge
                                                  ?.copyWith(
                                                    color: AppColors.onPrimary,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                            const SizedBox(width: 12),
                                            const Icon(
                                              Icons.arrow_forward,
                                              size: 20,
                                            ),
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
                                    l10n.alreadyHaveAccount,
                                    style: textTheme.bodyMedium?.copyWith(
                                      color: AppColors.secondary,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      context.push('/login');
                                    },
                                    child: Text(
                                      l10n.loginLink,
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
                          l10n.copyrightText,
                          style: textTheme.bodyMedium?.copyWith(
                            color: AppColors.secondary,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildFooterLink(l10n.privacyLink, textTheme),
                            const SizedBox(width: 24),
                            _buildFooterLink(l10n.termsLink, textTheme),
                            const SizedBox(width: 24),
                            _buildFooterLink(l10n.supportLink, textTheme),
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
          style: textTheme.bodyLarge?.copyWith(color: AppColors.onSurface),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: textTheme.bodyLarge?.copyWith(color: AppColors.outline),
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
