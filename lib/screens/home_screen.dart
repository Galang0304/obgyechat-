import 'package:flutter/material.dart';
import '../main.dart';
import '../constants/image_paths.dart';
import '../utils/placeholder_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              _buildQuickActions(context),
              _buildPregnancyProgress(),
              _buildUpcomingAppointments(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.pink[50],
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 40,
                  color: Colors.pink[300],
                ),
              ),
              const SizedBox(width: 16),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat Pagi,',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'Ibu Sarah',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Card(
            elevation: 0,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildPregnancyInfo('Usia Kehamilan', '12 Minggu'),
                  const VerticalDivider(),
                  _buildPregnancyInfo('Perkiraan Lahir', '15 Sep 2024'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPregnancyInfo(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Aksi Cepat',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildActionButton(
                label: 'Tanya\nAsisten',
                icon: Icons.chat_bubble_outline,
                color: Colors.blue,
                onTap: () => _navigateToScreen(context, 1),
              ),
              _buildActionButton(
                label: 'Cek\nKalender',
                icon: Icons.calendar_today,
                color: Colors.orange,
                onTap: () => _navigateToScreen(context, 2),
              ),
              _buildActionButton(
                label: 'Baca\nArtikel',
                icon: Icons.article_outlined,
                color: Colors.green,
                onTap: () => _navigateToScreen(context, 3),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required String label,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              color: color,
              size: 32,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPregnancyProgress() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.pink[100],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Perkembangan Janin',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              ImagePaths.week12,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return PlaceholderImage(
                  category: 'Pregnancy',
                  height: 150,
                  backgroundColor: Colors.pink[50],
                  iconColor: Colors.pink[300],
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          LinearProgressIndicator(
            value: 12 / 40, // 12 weeks out of 40 weeks
            backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.pink[400]!),
          ),
          const SizedBox(height: 16),
          const Text(
            'Minggu ke-12: Ukuran janin sebesar buah limau. Organ-organ vital seperti hati dan ginjal mulai berfungsi.',
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildUpcomingAppointments() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Jadwal Pemeriksaan',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.medical_services,
                  color: Colors.green[400],
                ),
              ),
              title: const Text('Pemeriksaan USG'),
              subtitle: const Text('20 April 2024 • 10:00'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // TODO: Navigate to appointment details
              },
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToScreen(BuildContext context, int index) {
    final bottomNavBar = (context.findAncestorStateOfType<MainScreenState>());
    if (bottomNavBar != null) {
      bottomNavBar.setIndex(index);
    }
  }
} 