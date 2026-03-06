import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'utils/theme.dart';
import 'pages/onboarding_page.dart';
import 'providers/profile_provider.dart';
import 'pages/home_page.dart';

import 'models/profile.dart';
import 'models/message.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive for local storage
  await Hive.initFlutter();

  // Register adapters
  Hive.registerAdapter(ProfileAdapter());
  Hive.registerAdapter(MessageStatusAdapter());
  Hive.registerAdapter(MessageAdapter());

  // Open boxes
  final settingsBox = await Hive.openBox('settings');

  runApp(
    ProviderScope(
      overrides: [
        settingsBoxProvider.overrideWithValue(settingsBox),
      ],
      child: const TerraCommApp(),
    ),
  );
}

class TerraCommApp extends ConsumerWidget {
  const TerraCommApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider);

    return MaterialApp(
      title: 'TerraComm',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      // If user has a profile, go to Home, else Onboarding
      home: profile == null ? const OnboardingPage() : const HomePage(),
    );
  }
}
