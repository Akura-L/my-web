import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/profile_data.dart';
import '../theme/app_theme.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  final bool isTablet;

  const ProjectCard({super.key, required this.project, required this.isTablet});

  @override
  Widget build(BuildContext context) {
    final margin = isTablet ? 18.0 : 14.0;
    final padding = isTablet ? 22.0 : 18.0;
    final iconPadding = isTablet ? 14.0 : 10.0;
    final iconSize = isTablet ? 28.0 : 24.0;
    final titleSize = isTablet ? 18.0 : 16.0;
    final descSize = isTablet ? 14.0 : 13.0;
    final spacing = isTablet ? 10.0 : 6.0;
    final techPaddingH = isTablet ? 14.0 : 10.0;
    final techPaddingV = isTablet ? 8.0 : 5.0;
    final techFontSize = isTablet ? 13.0 : 11.0;

    return Container(
      margin: EdgeInsets.only(bottom: margin),
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.dividerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(iconPadding),
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  project.icon,
                  color: AppTheme.primaryColor,
                  size: iconSize,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  project.title,
                  style: GoogleFonts.poppins(
                    fontSize: titleSize,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textPrimary,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: isTablet ? 18 : 14),
          Text(
            project.description,
            style: GoogleFonts.poppins(
              fontSize: descSize,
              color: AppTheme.textSecondary,
              height: 1.5,
            ),
          ),
          SizedBox(height: isTablet ? 18 : 14),
          Wrap(
            spacing: spacing,
            runSpacing: spacing,
            children: project.technologies.map((tech) {
              return Container(
                padding: EdgeInsets.symmetric(
                  horizontal: techPaddingH,
                  vertical: techPaddingV,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.secondaryColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  tech,
                  style: GoogleFonts.poppins(
                    fontSize: techFontSize,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.primaryColor,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
