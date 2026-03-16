import 'package:flutter/material.dart';
import '../data/profile_data.dart';
import '../theme/app_theme.dart';

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({super.key});

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= AppTheme.tabletBreakpoint;
    final isDesktop = screenWidth >= AppTheme.desktopBreakpoint;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Experience'),
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppTheme.primaryColor,
          unselectedLabelColor: AppTheme.textSecondary,
          indicatorColor: AppTheme.primaryColor,
          tabs: const [
            Tab(text: 'Work', icon: Icon(Icons.work)),
            Tab(text: 'Education', icon: Icon(Icons.school)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _WorkExperienceTab(isTablet: isTablet),
          _EducationTab(isTablet: isTablet),
        ],
      ),
    );
  }
}

class _WorkExperienceTab extends StatelessWidget {
  final bool isTablet;
  const _WorkExperienceTab({required this.isTablet});

  @override
  Widget build(BuildContext context) {
    final padding = isTablet ? 24.0 : 16.0;
    return SingleChildScrollView(
      padding: EdgeInsets.all(padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Work Experience',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: AppTheme.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'My professional journey',
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: AppTheme.textSecondary),
          ),
          const SizedBox(height: 24),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: ProfileData.experiences.length,
            separatorBuilder: (context, index) =>
                SizedBox(height: isTablet ? 20 : 16),
            itemBuilder: (context, index) => _ExperienceCard(
              experience: ProfileData.experiences[index],
              isTablet: isTablet,
            ),
          ),
        ],
      ),
    );
  }
}

class _EducationTab extends StatelessWidget {
  final bool isTablet;
  const _EducationTab({required this.isTablet});

  @override
  Widget build(BuildContext context) {
    final padding = isTablet ? 24.0 : 16.0;
    return SingleChildScrollView(
      padding: EdgeInsets.all(padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Education',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: AppTheme.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Academic background',
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: AppTheme.textSecondary),
          ),
          const SizedBox(height: 24),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: ProfileData.education.length,
            separatorBuilder: (context, index) =>
                SizedBox(height: isTablet ? 20 : 16),
            itemBuilder: (context, index) => _EducationCard(
              education: ProfileData.education[index],
              isTablet: isTablet,
            ),
          ),
        ],
      ),
    );
  }
}

class _ExperienceCard extends StatelessWidget {
  final Experience experience;
  final bool isTablet;

  const _ExperienceCard({required this.experience, required this.isTablet});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppTheme.cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: AppTheme.dividerColor),
      ),
      child: Padding(
        padding: EdgeInsets.all(isTablet ? 24 : 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.work,
                    color: AppTheme.primaryColor,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        experience.title,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppTheme.textPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        experience.company,
                        style: TextStyle(
                          color: AppTheme.primaryColor,
                          fontSize: isTablet ? 16 : 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              '${experience.startDate} - ${experience.endDate} • ${experience.location}',
              style: TextStyle(
                color: AppTheme.textSecondary,
                fontSize: isTablet ? 14 : 13,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              experience.description,
              style: TextStyle(
                color: AppTheme.textSecondary,
                height: 1.6,
                fontSize: isTablet ? 14 : 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EducationCard extends StatelessWidget {
  final Education education;
  final bool isTablet;

  const _EducationCard({required this.education, required this.isTablet});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppTheme.cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: AppTheme.dividerColor),
      ),
      child: Padding(
        padding: EdgeInsets.all(isTablet ? 24 : 20),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.primaryColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                education.icon,
                color: AppTheme.primaryColor,
                size: 28,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    education.degree,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppTheme.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    education.institution,
                    style: TextStyle(
                      color: AppTheme.primaryColor,
                      fontSize: isTablet ? 16 : 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    education.year,
                    style: TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: isTablet ? 14 : 13,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
