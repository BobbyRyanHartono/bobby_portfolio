import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/app_theme.dart';
import 'features/portfolio_home/presentation/providers/portfolio_providers.dart';
import 'features/portfolio_home/presentation/screens/portfolio_home_screen.dart';

class BobbyPortfolioApp extends ConsumerWidget {
  const BobbyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp(
      title: 'Bobby Ryan Hartono - Portfolio',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      home: PortfolioHomeScreen(),
    );
  }
}
