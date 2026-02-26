import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:agrigrader_flutter/theme.dart';
import 'package:agrigrader_flutter/models.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 20),
              _buildSearchBar(),
              const SizedBox(height: 20),
              _buildGuideBanner(),
              const SizedBox(height: 30),
              _buildSectionTitle('Category'),
              const SizedBox(height: 15),
              _buildCategories(),
              const SizedBox(height: 30),
              _buildMarketFlashHeader(),
              const SizedBox(height: 15),
              _buildMarketTabs(),
              const SizedBox(height: 20),
              _buildMarketList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(LucideIcons.mapPin, color: AppColors.primary, size: 20),
            const SizedBox(width: 8),
            Text('California, USA', style: AppTextStyles.bodyLarge),
            const Icon(LucideIcons.chevronDown, size: 16),
          ],
        ),
        Row(
          children: [
            _buildIconButton(LucideIcons.user),
            const SizedBox(width: 12),
            _buildIconButton(LucideIcons.bell, hasBadge: true),
          ],
        ),
      ],
    );
  }

  Widget _buildIconButton(IconData icon, {bool hasBadge = false}) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Icon(icon, size: 20, color: AppColors.textMain),
        ),
        if (hasBadge)
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                color: Color(0xFFFB5E5E),
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Search Produce or Grade',
          icon: Icon(LucideIcons.search, color: AppColors.textSecondary),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildGuideBanner() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        image: const DecorationImage(
          image: NetworkImage(
            'https://images.unsplash.com/photo-1500937386664-56d1dfef3854?auto=format&fit=crop&q=80&w=1000',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Colors.black.withValues(alpha: 0.7), Colors.transparent],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Quality Grading Guide:',
              style: GoogleFonts.lexend(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Learn to grade like a pro!\nGet better prices.',
              style: GoogleFonts.inter(
                color: Colors.white.withValues(alpha: 0.9),
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: AppColors.textMain,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text('View Guide'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(title, style: AppTextStyles.h2);
  }

  Widget _buildCategories() {
    final categories = [
      {'name': 'Tomato', 'icon': '🍅', 'color': const Color(0xFFFFEBEE)},
      {'name': 'Apple', 'icon': '🍎', 'color': const Color(0xFFFFEBEE)},
      {'name': 'Bell Pepper', 'icon': '🫑', 'color': const Color(0xFFE8F5E9)},
      {'name': 'Grapes', 'icon': '🍇', 'color': const Color(0xFFF3E5F5)},
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: categories.map((cat) => _buildCategoryItem(cat)).toList(),
    );
  }

  Widget _buildCategoryItem(Map<String, dynamic> cat) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: cat['color'],
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(cat['icon'], style: const TextStyle(fontSize: 32)),
        ),
        const SizedBox(height: 8),
        Text(cat['name'], style: AppTextStyles.bodyMedium),
      ],
    );
  }

  Widget _buildMarketFlashHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Market Price Flash', style: AppTextStyles.h2),
            Text('Real-time updates', style: AppTextStyles.caption),
          ],
        ),
        Row(
          children: [
            Text('Closing in: ', style: AppTextStyles.caption),
            Text(
              '02 : 15 : 48',
              style: AppTextStyles.bodyLarge.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMarketTabs() {
    final tabs = ['All', 'Top Risers', 'Local', 'Export'];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: tabs.map((tab) => _buildTab(tab, tab == 'All')).toList(),
      ),
    );
  }

  Widget _buildTab(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF2D4739) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : AppColors.textSecondary,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildMarketList() {
    final items = [
      MarketPrice(
        cropName: 'Tomato (Roma)',
        variety: 'Variety',
        price: 1.50,
        change: 0.20,
        imageUrl:
            'https://images.unsplash.com/photo-1518977676601-b53f02bad67b?auto=format&fit=crop&q=80&w=200',
      ),
      MarketPrice(
        cropName: 'Apple (Fuji)',
        variety: 'Variety',
        price: 2.10,
        change: -0.05,
        imageUrl:
            'https://images.unsplash.com/photo-1567306226416-28f0efdc88ce?auto=format&fit=crop&q=80&w=200',
      ),
    ];

    return Row(
      children: items
          .map((item) => Expanded(child: _buildMarketCard(item)))
          .toList(),
    );
  }

  Widget _buildMarketCard(MarketPrice item) {
    return Card(
      margin: const EdgeInsets.only(right: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                item.imageUrl,
                height: 80,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              item.cropName,
              style: AppTextStyles.bodyMedium.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  '\$${item.price.toStringAsFixed(2)}/lb',
                  style: AppTextStyles.bodyMedium,
                ),
                const SizedBox(width: 4),
                Text(
                  '(${item.change >= 0 ? '+' : ''}${item.change.toStringAsFixed(2)})',
                  style: TextStyle(
                    fontSize: 12,
                    color: item.change >= 0 ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
