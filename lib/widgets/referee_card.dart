import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/profile_data.dart';
import '../theme/app_theme.dart';

class RefereeCard extends StatelessWidget {
  final Referee referee;
  final bool isTablet;

  const RefereeCard({super.key, required this.referee, required this.isTablet});

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final margin = isTablet ? 16.0 : 12.0;
    final padding = isTablet ? 18.0 : 14.0;
    final avatarSize = isTablet ? 28.0 : 24.0;

    return Container(
      margin: EdgeInsets.only(bottom: margin),
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppTheme.dividerColor),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppTheme.primaryColor,
            radius: avatarSize,
            child: Text(
              referee.name.split(' ').map((e) => e[0]).take(2).join(),
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: isTablet ? 14 : 12,
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
                  style: GoogleFonts.poppins(
                    fontSize: isTablet ? 16 : 14,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textPrimary,
                  ),
                ),
                Text(
                  '${referee.title} - ${referee.institution}',
                  style: GoogleFonts.poppins(
                    fontSize: isTablet ? 13 : 12,
                    color: AppTheme.textSecondary,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    InkWell(
                      onTap: () => _launchUrl('tel:${referee.phone}'),
                      child: Row(
                        children: [
                          Icon(
                            Icons.phone,
                            size: isTablet ? 14 : 12,
                            color: AppTheme.primaryColor,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            referee.phone,
                            style: GoogleFonts.poppins(
                              fontSize: isTablet ? 12 : 11,
                              color: AppTheme.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (referee.email?.isNotEmpty == true) ...[
                      SizedBox(width: isTablet ? 16 : 12),
                      InkWell(
                        onTap: () => _launchUrl('mailto:${referee.email}'),
                        child: Row(
                          children: [
                            Icon(
                              Icons.email,
                              size: isTablet ? 14 : 12,
                              color: AppTheme.primaryColor,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Email',
                              style: GoogleFonts.poppins(
                                fontSize: isTablet ? 12 : 11,
                                color: AppTheme.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
