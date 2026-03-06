import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:permission_handler/permission_handler.dart';

import '../providers/profile_provider.dart';
import 'home_page.dart';

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  final _nameController = TextEditingController();
  bool _isLoading = false;

  Future<bool> _requestPermissions() async {
    // Request nearby connections permissions gracefully
    final statuses = await [
      Permission.bluetooth,
      Permission.bluetoothAdvertise,
      Permission.bluetoothConnect,
      Permission.bluetoothScan,
      Permission.location,
      Permission.nearbyWifiDevices,
    ].request();

    bool allGranted = true;
    for (var status in statuses.values) {
      if (!status.isGranted) allGranted = false;
    }
    return allGranted;
  }

  Future<void> _submit() async {
    final name = _nameController.text.trim();
    if (name.isEmpty) return;

    setState(() => _isLoading = true);

    bool granted = await _requestPermissions();
    if (!granted && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Some permissions were denied. Mesh networking may be limited.'),
          backgroundColor: Theme.of(context).colorScheme.error,
        )
      );
    }

    await ref.read(profileProvider.notifier).createProfile(name);

    // Push to HomePage when done
    if (mounted) {
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (_) => const HomePage())
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 48),
              
              // Animated Logo / Brand
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.wifi_tethering_rounded,
                  size: 64,
                  color: Theme.of(context).primaryColor,
                ),
              ).animate().scale(duration: 600.ms, curve: Curves.easeOutBack),
              
              const SizedBox(height: 32),
              
              Text(
                'TerraComm',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -1,
                ),
              ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2, end: 0),
              
              const SizedBox(height: 8),
              
              Text(
                'When everything fails, we don\'t.\nWorks with zero internet or cellular.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).textTheme.bodyLarge?.color?.withValues(alpha: 0.7),
                  height: 1.4,
                ),
              ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.2, end: 0),
              
              const SizedBox(height: 48),
              
              TextField(
                controller: _nameController,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  hintText: 'Enter your name or alias',
                  prefixIcon: Icon(Icons.person_outline),
                ),
                onSubmitted: (_) => _submit(),
              ).animate().fadeIn(delay: 600.ms).slideY(begin: 0.2, end: 0),
              
              const SizedBox(height: 48),
              
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _submit,
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                          ),
                        )
                      : const Text('Connect to Mesh'),
                ),
              ).animate().fadeIn(delay: 800.ms).slideY(begin: 0.2, end: 0),
              
              const SizedBox(height: 16),
              
              Center(
                child: Text(
                  'Your messages are encrypted end-to-end.',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white54,
                  ),
                ),
              ).animate().fadeIn(delay: 1000.ms),
            ],
          ),
        ),
      ),
    );
  }
}
