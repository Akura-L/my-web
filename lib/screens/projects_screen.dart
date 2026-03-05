import 'package:flutter/material.dart';
import '../data/profile_data.dart';
import '../theme/app_theme.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

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
    final titleSize = isTablet ? 20.0 : 18.0;
    final iconSize = isTablet ? 32.0 : 28.0;

    return Scaffold(
      appBar: AppBar(title: const Text('Projects')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My Projects',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Real-world applications and solutions I\'ve built',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            // Projects - Use GridView for tablet/desktop
            isTablet
                ? GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: isDesktop ? 24 : 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: isDesktop ? 1.3 : 1.2,
                    ),
                    itemCount: ProfileData.projects.length,
                    itemBuilder: (context, index) {
                      final project = ProfileData.projects[index];
                      return _ProjectCard(project: project, isTablet: isTablet);
                    },
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: ProfileData.projects.length,
                    itemBuilder: (context, index) {
                      final project = ProfileData.projects[index];
                      return _ProjectCard(project: project, isTablet: false);
                    },
                  ),
          ],
        ),
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final Project project;
  final bool isTablet;

  const _ProjectCard({required this.project, required this.isTablet});

  @override
  Widget build(BuildContext context) {
    final titleSize = isTablet ? 18.0 : 16.0;
    final descSize = isTablet ? 14.0 : 13.0;
    final iconSize = isTablet ? 28.0 : 24.0;
    final padding = isTablet ? 24.0 : 18.0;

    return Card(
      margin: EdgeInsets.only(bottom: isTablet ? 20 : 14),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(isTablet ? 14 : 10),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    project.icon,
                    color: AppTheme.primaryColor,
                    size: iconSize,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    project.title,
                    style: TextStyle(
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
              style: TextStyle(
                fontSize: descSize,
                color: AppTheme.textSecondary,
                height: 1.5,
              ),
            ),
            SizedBox(height: isTablet ? 18 : 14),
            Text(
              'Technologies:',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: isTablet ? 14 : 13,
                color: AppTheme.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: isTablet ? 10 : 8,
              runSpacing: isTablet ? 10 : 8,
              children: project.technologies.map((tech) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: isTablet ? 14 : 10,
                    vertical: isTablet ? 8 : 5,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.secondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    tech,
                    style: TextStyle(
                      fontSize: isTablet ? 13 : 11,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.secondaryColor,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
