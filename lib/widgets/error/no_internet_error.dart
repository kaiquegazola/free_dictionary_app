import 'package:flutter/material.dart';

import 'error_state.dart';

class NoInternetErrorWidget extends StatelessWidget {
  const NoInternetErrorWidget({
    super.key,
    this.onTryAgain,
  });

  final VoidCallback? onTryAgain;

  @override
  Widget build(BuildContext context) {
    return ErrorState(
      icon: Icons.wifi_off_rounded,
      title: 'No internet connection',
      message: 'Please check your connection and try again',
      onButtonPressed: onTryAgain,
    );
  }
} 