import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:agrigrader_flutter/theme.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Simulated Camera Preview
          Positioned.fill(
            child: Image.network(
              'https://images.unsplash.com/photo-1592417817098-8fd3d0f3aa05?auto=format&fit=crop&q=80&w=1000',
              fit: BoxFit.cover,
            ),
          ),
          // Dark Overlay
          Positioned.fill(
            child: Container(color: Colors.black.withValues(alpha: 0.3)),
          ),
          // Top Bar
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCircleButton(
                    context,
                    LucideIcons.arrowLeft,
                    onPressed: () => Navigator.pop(context),
                  ),
                  Text(
                    'Grade Produce',
                    style: AppTextStyles.h2.copyWith(color: Colors.white),
                  ),
                  _buildCircleButton(context, LucideIcons.helpCircle),
                ],
              ),
            ),
          ),
          // Right Side Actions
          Positioned(
            right: 16,
            top: MediaQuery.of(context).size.height * 0.2,
            child: Column(
              children: [
                _buildActionButtons(LucideIcons.zap),
                const SizedBox(height: 16),
                _buildActionButtons(LucideIcons.clock),
                const SizedBox(height: 16),
                _buildActionButtons(LucideIcons.grid),
              ],
            ),
          ),
          // Capture Frame
          Center(
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  _buildFrameCorner(topLeft: true),
                  _buildFrameCorner(topRight: true),
                  _buildFrameCorner(bottomLeft: true),
                  _buildFrameCorner(bottomRight: true),
                  const Center(
                    child: Icon(
                      LucideIcons.plus,
                      color: Colors.white24,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Instruction Label
          Positioned(
            top: MediaQuery.of(context).size.height * 0.7,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Align crop within the frame',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          // Bottom Sheet
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildBottomControls(),
          ),
        ],
      ),
    );
  }

  Widget _buildCircleButton(
    BuildContext context,
    IconData icon, {
    VoidCallback? onPressed,
  }) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black26,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: onPressed ?? () {},
      ),
    );
  }

  Widget _buildActionButtons(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.black26,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white, size: 24),
    );
  }

  Widget _buildFrameCorner({
    bool topLeft = false,
    bool topRight = false,
    bool bottomLeft = false,
    bool bottomRight = false,
  }) {
    return Positioned(
      top: topLeft || topRight ? -2 : null,
      bottom: bottomLeft || bottomRight ? -2 : null,
      left: topLeft || bottomLeft ? -2 : null,
      right: topRight || bottomRight ? -2 : null,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          border: Border(
            top: topLeft || topRight
                ? const BorderSide(color: AppColors.primary, width: 4)
                : BorderSide.none,
            bottom: bottomLeft || bottomRight
                ? const BorderSide(color: AppColors.primary, width: 4)
                : BorderSide.none,
            left: topLeft || bottomLeft
                ? const BorderSide(color: AppColors.primary, width: 4)
                : BorderSide.none,
            right: topRight || bottomRight
                ? const BorderSide(color: AppColors.primary, width: 4)
                : BorderSide.none,
          ),
          borderRadius: BorderRadius.only(
            topLeft: topLeft ? const Radius.circular(10) : Radius.zero,
            topRight: topRight ? const Radius.circular(10) : Radius.zero,
            bottomLeft: bottomLeft ? const Radius.circular(10) : Radius.zero,
            bottomRight: bottomRight ? const Radius.circular(10) : Radius.zero,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomControls() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 40),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Capture Crop',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.textMain,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Ensure good lighting for accurate grading',
            style: TextStyle(color: AppColors.textSecondary),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(LucideIcons.camera, color: Colors.white),
              label: const Text(
                'Take Photo',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(LucideIcons.image, color: AppColors.textMain),
              label: const Text(
                'Upload from Gallery',
                style: TextStyle(color: AppColors.textMain, fontSize: 16),
              ),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.grey.shade200),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Supported Formats: JPG, PNG',
            style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}
