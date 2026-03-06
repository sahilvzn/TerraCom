import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

import '../models/profile.dart';

// Provides access to the Hive box for settings/profile
final settingsBoxProvider = Provider<Box>((ref) => throw UnimplementedError());

final profileProvider = StateNotifierProvider<ProfileNotifier, Profile?>((ref) {
  return ProfileNotifier(ref);
});

class ProfileNotifier extends StateNotifier<Profile?> {
  final Ref ref;
  
  ProfileNotifier(this.ref) : super(null) {
    _loadProfile();
  }

  void _loadProfile() {
    final box = ref.read(settingsBoxProvider);
    final profileJson = box.get('profile');
    if (profileJson != null) {
      // Assuming simple json serialization
      try {
        state = Profile.fromJson(Map<String, dynamic>.from(profileJson));
      } catch (e) {
        // Fallback
      }
    }
  }

  Future<void> createProfile(String name) async {
    final box = ref.read(settingsBoxProvider);
    
    // Generate a beautiful random color for the profile avatar
    final colors = [
      '#FF5252', '#FF4081', '#E040FB', '#7C4DFF', 
      '#536DFE', '#448AFF', '#40C4FF', '#18FFFF', 
      '#64FFDA', '#69F0AE', '#B2FF59', '#EEFF41', 
      '#FFFF00', '#FFD740', '#FFAB40', '#FF6E40'
    ];
    colors.shuffle();

    final profile = Profile(
      id: const Uuid().v4(),
      name: name.trim(),
      photoColor: colors.first,
      createdAt: DateTime.now(),
    );

    // Save
    await box.put('profile', profile.toJson());
    state = profile;
  }
}
