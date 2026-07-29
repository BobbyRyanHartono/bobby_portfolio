import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'bobby_portfolio_app.dart';
import 'core/constants/test_keys.dart';

void main() {
  runApp(
    const ProviderScope(
      child: BobbyPortfolioApp(key: TestKeys.app),
    ),
  );
}

