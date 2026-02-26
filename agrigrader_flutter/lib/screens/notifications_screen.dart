import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:agrigrader_flutter/theme.dart';
import 'package:agrigrader_flutter/models.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(LucideIcons.arrowLeft),
          onPressed: () {},
        ),
        title: Text('Notifications', style: AppTextStyles.h2),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(LucideIcons.settings), onPressed: () {}),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        children: [
          _buildSectionHeader('TODAY'),
          _buildNotificationItem(
            AppNotification(
              id: '1',
              title: 'Sale Confirmed',
              message:
                  'Batch #204 successfully sold to Whole Foods Market. Revenue generated: \$1,240.',
              dateTime: DateTime.now(),
              icon: LucideIcons.tag,
              iconColor: Colors.green,
            ),
            '12:45 PM',
          ),
          _buildNotificationItem(
            AppNotification(
              id: '2',
              title: 'Grading Report Ready',
              message:
                  'Apples - Honeycrisp analysis complete. Average grade: A. View detailed breakdown.',
              dateTime: DateTime.now(),
              icon: LucideIcons.fileText,
              iconColor: Colors.blue,
            ),
            '10:30 AM',
          ),
          _buildNotificationItem(
            AppNotification(
              id: '3',
              title: 'Quality Alert',
              message:
                  'Detected blemishes in Batch #205 exceeding 5% threshold. Please review manually.',
              dateTime: DateTime.now(),
              icon: LucideIcons.alertTriangle,
              iconColor: Colors.orange,
            ),
            '09:15 AM',
          ),
          const SizedBox(height: 20),
          _buildSectionHeader('YESTERDAY'),
          _buildNotificationItem(
            AppNotification(
              id: '4',
              title: 'Weekly Summary',
              message:
                  'Your weekly grading performance report is available. You processed 15 batches.',
              dateTime: DateTime.now(),
              icon: LucideIcons.fileText,
              iconColor: Colors.blue,
            ),
            'Yesterday',
          ),
          _buildNotificationItem(
            AppNotification(
              id: '5',
              title: 'Market Price Update',
              message: 'Tomato prices have increased by 12% in your region.',
              dateTime: DateTime.now(),
              icon: LucideIcons.tag,
              iconColor: Colors.green,
            ),
            'Yesterday',
          ),
          const SizedBox(height: 20),
          _buildSectionHeader('EARLIER'),
          _buildNotificationItem(
            AppNotification(
              id: '6',
              title: 'Sync Error',
              message:
                  'Failed to sync batch #198 due to poor connection. Tap to retry.',
              dateTime: DateTime.now(),
              icon: LucideIcons.refreshCw,
              iconColor: Colors.orange,
            ),
            'Oct 24',
          ),
          _buildNotificationItem(
            AppNotification(
              id: '7',
              title: 'New Buyer Request',
              message: 'Local Co-op is interested in your grade B potatoes.',
              dateTime: DateTime.now(),
              icon: LucideIcons.tag,
              iconColor: Colors.green,
            ),
            'Oct 22',
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
      child: Text(
        title,
        style: AppTextStyles.caption.copyWith(
          letterSpacing: 1.2,
          fontWeight: FontWeight.bold,
          color: Colors.grey.shade500,
        ),
      ),
    );
  }

  Widget _buildNotificationItem(AppNotification notification, String time) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade100)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: notification.iconColor.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              notification.icon,
              color: notification.iconColor,
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      notification.title,
                      style: AppTextStyles.bodyLarge.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(time, style: AppTextStyles.caption),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  notification.message,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
