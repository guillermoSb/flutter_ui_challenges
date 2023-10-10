import 'package:flutter/material.dart';

class LoginScreen01 extends StatelessWidget {
  const LoginScreen01({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.purple[100],
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: colors.primary,
                          ),
                        ),
                      ),
                      Text(
                        'Sign in to your account',
                        style: text.titleSmall?.copyWith(
                          color: colors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      LoginScreen01Button(
                        label: 'Sign in with Google',
                        color: colors.secondary,
                        textColor: colors.onSecondary,
                        leftIcon: Image.asset(
                          'assets/google-icon.png',
                          height: 24,
                          width: 24,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      LoginScreen01Button(
                        label: 'Sign in with Apple',
                        leftIcon: Image.asset(
                          'assets/apple-icon.png',
                          height: 24,
                          width: 24,
                        ),
                        color: colors.secondary,
                        textColor: colors.onSecondary,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              color: colors.secondary,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              'Or continue with',
                              style: text.bodyMedium?.copyWith(
                                color: colors.tertiary,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: colors.secondary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      LoginScreen01Button(
                        label: 'Continue',
                        color: colors.primary,
                        textColor: colors.onPrimary,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class LoginScreen01Button extends StatelessWidget {
  final String label;
  final Color color;
  final Color textColor;
  final Widget? leftIcon;
  const LoginScreen01Button({
    super.key,
    required this.label,
    required this.color,
    required this.textColor,
    this.leftIcon,
  });

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {},
      child: Material(
        color: color,
        child: InkWell(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (leftIcon != null) leftIcon!,
                  if (leftIcon != null)
                    const SizedBox(
                      width: 8,
                    ),
                  Text(
                    label,
                    style: text.bodyMedium?.copyWith(
                      color: textColor,
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
}
