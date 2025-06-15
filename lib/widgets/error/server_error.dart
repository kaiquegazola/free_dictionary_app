import 'package:flutter/material.dart';

import 'error_state.dart';

class ServerErrorWidget extends StatelessWidget {
  const ServerErrorWidget({
    super.key,
    this.onTryAgain,
  });

  final VoidCallback? onTryAgain;

  @override
  Widget build(BuildContext context) {
    return ErrorState(
      icon: Icons.error_outline_rounded,
      title: 'Server error',
      message: 'Something went wrong. Please try again later.',
      onButtonPressed: onTryAgain,
    );
  }
} 