import 'package:chikitsa/constants/color/colors.dart';
import 'package:chikitsa/profile/care_taker.dart';
import 'package:chikitsa/profile/profile_header.dart';
import 'package:chikitsa/profile/section.dart';
import 'package:chikitsa/profile/settings_item.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ChikitsaColors.scaffoldBackgroundColor,
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_new_outlined),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProfileHeader(),
              const Divider(height: 1),
              const SizedBox(height: 16),
              const SectionMainTile(
                title: 'Settings',
              ),
              const SettingItem(
                icon: Icons.notifications_outlined,
                title: 'Notification',
                subtitle: 'Check your medicine notification',
              ),
              const SettingItem(
                icon: Icons.volume_up_outlined,
                title: 'Sound',
                subtitle: 'Ring, Silent, Vibrate',
              ),
              const SettingItem(
                icon: Icons.person_outline,
                title: 'Manage Your Account',
                subtitle: 'Password, Email ID, Phone Number',
              ),
              const SettingItem(
                icon: Icons.notifications_outlined,
                title: 'Notification',
                subtitle: 'Check your medicine notification',
              ),
              const SettingItem(
                icon: Icons.notifications_outlined,
                title: 'Notification',
                subtitle: 'Check your medicine notification',
              ),
              const SizedBox(height: 16),
              const SectionMainTile(title: 'Device'),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: ChikitsaColors.shadeColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const DeviceSettingItem(
                        icon: Icons.speaker,
                        title: 'Connect',
                        subtitle: 'Bluetooth,WiFi',
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const DeviceSettingItem(
                        icon: Icons.bluetooth,
                        title: 'Bluetooth',
                        subtitle: 'Ring,Silent,Vibrate',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const SectionMainTile(title: 'Caretakers: 03'),
              const CareTakerSection(),
              const SizedBox(height: 16),
              const SectionMainTile(title: 'Doctor'),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: ChikitsaColors.shadeColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: const BoxDecoration(
                        color: ChikitsaColors.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.add, color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Add Your Doctor',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Or use ',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          'invite link',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.orange.shade700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LinkText(
                      text: 'Privacy Policy',
                    ),
                    SizedBox(height: 16),
                    LinkText(
                      text: 'Terms of Use',
                    ),
                    SizedBox(height: 16),
                    LinkText(
                      text: 'Rate Us',
                    ),
                    SizedBox(height: 16),
                    LinkText(
                      text: 'Share',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    side: const BorderSide(color: ChikitsaColors.primaryColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  child: const Text(
                    'Log Out',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: ChikitsaColors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
