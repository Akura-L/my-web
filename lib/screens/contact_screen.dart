import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/profile_data.dart';
import '../theme/app_theme.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final uri = Uri.parse('tel:$phoneNumber');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> _sendEmail(String email) async {
    final uri = Uri.parse('mailto:$email');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get responsive values
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= AppTheme.tabletBreakpoint;
    final isDesktop = screenWidth >= 1200;
    final padding = isDesktop
        ? 32.0
        : isTablet
        ? 24.0
        : 16.0;
    final isWideScreen = screenWidth >= 600;

    return Scaffold(
      appBar: AppBar(title: const Text('Contact')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Get In Touch',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Feel free to reach out for collaborations or inquiries',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            // Contact Options
            Card(
              child: Padding(
                padding: EdgeInsets.all(isTablet ? 24 : 20),
                child: Column(
                  children: [
                    _ContactOption(
                      icon: Icons.email,
                      label: 'Email',
                      value: ProfileData.email,
                      onTap: () => _sendEmail(ProfileData.email),
                      isTablet: isTablet,
                    ),
                    const Divider(height: 24),
                    _ContactOption(
                      icon: Icons.phone,
                      label: 'Phone',
                      value: ProfileData.phone,
                      onTap: () => _makePhoneCall(ProfileData.phone),
                      isTablet: isTablet,
                    ),
                    const Divider(height: 24),
                    _ContactOption(
                      icon: Icons.location_on,
                      label: 'Location',
                      value: ProfileData.location,
                      onTap: null,
                      isTablet: isTablet,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            // Referees Section - Use Grid for tablet/desktop
            Text('Referees', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 8),
            Text(
              'Professional references',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            isWideScreen
                ? GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 1.8,
                        ),
                    itemCount: ProfileData.referees.length,
                    itemBuilder: (context, index) {
                      final referee = ProfileData.referees[index];
                      return _RefereeCard(
                        referee: referee,
                        onCall: () => _makePhoneCall(referee.phone),
                        onEmail: referee.email != null
                            ? () => _sendEmail(referee.email!)
                            : null,
                      );
                    },
                  )
                : Column(
                    children: ProfileData.referees.map((referee) {
                      return _RefereeCard(
                        referee: referee,
                        onCall: () => _makePhoneCall(referee.phone),
                        onEmail: referee.email != null
                            ? () => _sendEmail(referee.email!)
                            : null,
                      );
                    }).toList(),
                  ),
            const SizedBox(height: 32),
            // Quick Actions
            Text(
              'Quick Actions',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _ActionButton(
                    icon: Icons.email,
                    label: 'Send Email',
                    onTap: () => _sendEmail(ProfileData.email),
                    isTablet: isTablet,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _ActionButton(
                    icon: Icons.phone,
                    label: 'Call Me',
                    onTap: () => _makePhoneCall(ProfileData.phone),
                    isTablet: isTablet,
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

class _ContactOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback? onTap;
  final bool isTablet;

  const _ContactOption({
    required this.icon,
    required this.label,
    required this.value,
    this.onTap,
    required this.isTablet,
  });

  @override
  Widget build(BuildContext context) {
    final iconSize = isTablet ? 28.0 : 24.0;
    final iconPadding = isTablet ? 12.0 : 10.0;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(iconPadding),
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: AppTheme.primaryColor, size: iconSize),
          ),
          SizedBox(width: isTablet ? 20 : 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: isTablet ? 14 : 12,
                    color: AppTheme.textSecondary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: isTablet ? 17 : 15,
                    fontWeight: FontWeight.w600,
                    color: onTap != null
                        ? AppTheme.primaryColor
                        : AppTheme.textPrimary,
                  ),
                ),
              ],
            ),
          ),
          if (onTap != null)
            const Icon(Icons.chevron_right, color: AppTheme.textSecondary),
        ],
      ),
    );
  }
}

class _RefereeCard extends StatelessWidget {
  final Referee referee;
  final VoidCallback onCall;
  final VoidCallback? onEmail;

  const _RefereeCard({
    required this.referee,
    required this.onCall,
    this.onEmail,
  });

  @override
  Widget build(BuildContext context) {
    final isTablet =
        MediaQuery.of(context).size.width >= AppTheme.tabletBreakpoint;
    final avatarSize = isTablet ? 28.0 : 24.0;
    final fontSize = isTablet ? 14.0 : 13.0;

    return Card(
      margin: EdgeInsets.only(bottom: isTablet ? 16 : 12),
      child: Padding(
        padding: EdgeInsets.all(isTablet ? 20 : 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppTheme.primaryColor,
                  radius: avatarSize,
                  child: Text(
                    referee.name.split(' ').map((e) => e[0]).take(2).join(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: fontSize,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        referee.name,
                        style: TextStyle(
                          fontSize: isTablet ? 17 : 15,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textPrimary,
                        ),
                      ),
                      Text(
                        referee.title,
                        style: TextStyle(
                          fontSize: fontSize,
                          color: AppTheme.textSecondary,
                        ),
                      ),
                      Text(
                        referee.institution,
                        style: TextStyle(
                          fontSize: fontSize - 1,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: onCall,
                    icon: Icon(Icons.phone, size: isTablet ? 20 : 18),
                    label: Text(referee.phone),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppTheme.primaryColor,
                      side: const BorderSide(color: AppTheme.primaryColor),
                      padding: EdgeInsets.symmetric(
                        horizontal: isTablet ? 12 : 8,
                        vertical: isTablet ? 12 : 8,
                      ),
                    ),
                  ),
                ),
                if (onEmail != null) ...[
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: onEmail,
                      icon: Icon(Icons.email, size: isTablet ? 20 : 18),
                      label: const Text('Email'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppTheme.primaryColor,
                        side: const BorderSide(color: AppTheme.primaryColor),
                        padding: EdgeInsets.symmetric(
                          horizontal: isTablet ? 12 : 8,
                          vertical: isTablet ? 12 : 8,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isTablet;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.isTablet,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.primaryColor,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: isTablet ? 20 : 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
