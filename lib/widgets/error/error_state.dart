import 'package:flutter/material.dart';

class ErrorState extends StatelessWidget {
  const ErrorState({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
    this.buttonLabel = 'Try Again',
    this.onButtonPressed,
    this.iconColor,
  });

  final IconData icon;
  final String title;
  final String message;
  final String buttonLabel;
  final VoidCallback? onButtonPressed;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 64,
            color: iconColor ?? Theme.of(context).colorScheme.error,
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          if (onButtonPressed != null)
            FilledButton.icon(
              onPressed: onButtonPressed,
              icon: const Icon(Icons.refresh_rounded),
              label: Text(buttonLabel),
            ),
        ],
      ),
    );
  }
} 