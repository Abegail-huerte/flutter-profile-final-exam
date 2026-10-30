import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const double coverHeight = 220;
  static const double avatarRadius = 75;
  static const Color facebookBlue = Color(0xFF1877F2);
  static const Color lightGrey = Color(0xFFE4E6EB);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              _buildProfileInfo(),
              _buildActionButtons(),
              _buildPrivacyNotice(),
              _buildTabs(),
              _buildPersonalDetails(),
            ],
          ),
        ),
      ),
    );
  }

  // Cover photo, top icons and the profile picture overlapping both areas.
  Widget _buildHeader() {
    return SizedBox(
      height: coverHeight + 40,
      child: Stack(
        children: [
          Container(height: coverHeight, color: Colors.blue),
          // White content area with rounded top that the avatar overlaps.
          Positioned(
            top: coverHeight - 20,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
            ),
          ),
          const Positioned(
            top: 8,
            left: 8,
            right: 8,
            child: Row(
              children: [
                Icon(Icons.menu, color: Colors.white, size: 30),
                Spacer(),
                Icon(Icons.edit_outlined, color: Colors.white, size: 26),
                SizedBox(width: 16),
                Icon(Icons.search, color: Colors.white, size: 28),
                SizedBox(width: 16),
                Icon(Icons.more_horiz, color: Colors.white, size: 28),
              ],
            ),
          ),
          const Positioned(
            top: coverHeight - 60,
            right: 12,
            child: Icon(Icons.camera_alt, color: Colors.white, size: 28),
          ),
          Positioned(
            top: coverHeight - avatarRadius - 40,
            left: 0,
            right: 0,
            child: Center(
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: avatarRadius + 4,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: avatarRadius,
                      backgroundImage: AssetImage('assets/images/profile.png'),
                    ),
                  ),
                  Positioned(
                    right: 4,
                    bottom: 8,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: lightGrey,
                      child: Icon(Icons.camera_alt, size: 18, color: Colors.grey.shade900),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileInfo() {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            const Center(
              child: Text(
                'Abegail O. Huerte',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              right: 12,
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 16,
                    backgroundColor: lightGrey,
                    child: Icon(Icons.keyboard_arrow_down, color: Colors.black),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text('3 posts', style: TextStyle(color: Colors.grey.shade700)),
        const SizedBox(height: 14),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on, size: 18),
            SizedBox(width: 6),
            Text('Iloilo City'),
          ],
        ),
        const SizedBox(height: 14),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add_circle_outline),
              label: const Text('Add to story'),
              style: ElevatedButton.styleFrom(
                backgroundColor: facebookBlue,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.edit),
              label: const Text('Edit profile'),
              style: ElevatedButton.styleFrom(
                backgroundColor: lightGrey,
                foregroundColor: Colors.black,
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrivacyNotice() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(10, 18, 10, 8),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: lightGrey,
            child: Icon(Icons.shield, color: Colors.black, size: 20),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'You locked your profile',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text('Learn more', style: TextStyle(color: facebookBlue)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    Widget tab(String label, {bool selected = false}) {
      return Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFFE7F0FD) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(color: selected ? facebookBlue : Colors.black),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
      child: Wrap(
        children: [
          tab('All', selected: true),
          tab('Photos'),
          tab('Reels'),
        ],
      ),
    );
  }

  Widget _buildPersonalDetails() {
    Widget detail(IconData icon, String text) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Icon(icon, size: 24),
            const SizedBox(width: 20),
            Expanded(child: Text(text)),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const Row(
            children: [
              Expanded(
                child: Text(
                  'Personal details',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Icon(Icons.edit_outlined),
            ],
          ),
          const SizedBox(height: 8),
          detail(Icons.location_on_outlined, 'Iloilo City, Philippines'),
          detail(Icons.home_outlined, 'Pavia, Iloilo'),
          detail(Icons.cake_outlined, 'January 15, 2000'),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
