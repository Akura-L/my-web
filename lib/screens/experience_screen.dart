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
    // Get responsive values
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= AppTheme.tabletBreakpoint;
    final isDesktop = screenWidth >= 1200;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Experience'),
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppTheme.primaryColor,
          unselectedLabelColor: AppTheme.textSecondary,
          indicatorColor: AppTheme.primaryColor,
          labelStyle: TextStyle(fontSize: isTablet ? 15 : 14),
          tabs: [
            Tab(text: 'Work', icon: Icon(isTablet ? Icons.work : null)),
            Tab(text: 'Education', icon: Icon(isTablet ? Icons.school : null)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [_WorkExperienceTab(), _EducationTab()],
      ),
    );
  }
}

class _WorkExperienceTab extends StatelessWidget {
  const _WorkExperienceTab();

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

    return SingleChildScrollView(
      padding: EdgeInsets.all(padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Work Experience',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'My professional journey',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),
          // Use GridView for tablet/desktop
          isTablet
              ? GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: isDesktop ? 24 : 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: isDesktop ? 1.4 : 1.3,
                  ),
                  itemCount: ProfileData.experiences.length,
                  itemBuilder: (context, index) {
                    final experience = ProfileData.experiences[index];
                    return _TimelineItem(
                      experience: experience,
                      isLast: index == ProfileData.experiences.length - 1,
                      isTablet: isTablet,
                    );
                  },
                )
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: ProfileData.experiences.length,
                  itemBuilder: (context, index) {
                    final experience = ProfileData.experiences[index];
                    return _TimelineItem(
                      experience: experience,
                      isLast: index == ProfileData.experiences.length - 1,
                      isTablet: false,
                    );
                  },
                ),
        ],
      ),
    );
  }
}

class _EducationTab extends StatelessWidget {
  const _EducationTab();

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

    return SingleChildScrollView(
      padding: EdgeInsets.all(padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Education', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 8),
          Text(
            'Academic background',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),
          // Use GridView for tablet/desktop
          isTablet
              ? GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: isDesktop ? 24 : 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: isDesktop ? 1.6 : 1.4,
                  ),
                  itemCount: ProfileData.education.length,
                  itemBuilder: (context, index) {
                    final edu = ProfileData.education[index];
                    return _TimelineItem(
                      education: edu,
                      isLast: index == ProfileData.education.length - 1,
                      isTablet: isTablet,
                    );
                  },
                )
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: ProfileData.education.length,
                  itemBuilder: (context, index) {
                    final edu = ProfileData.education[index];
                    return _TimelineItem(
                      education: edu,
                      isLast: index == ProfileData.education.length - 1,
                      isTablet: false,
                    );
                  },
                ),
        ],
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  final Experience? experience;
  final Education? education;
  final bool isLast;
  final bool isTablet;

  const _TimelineItem({
    this.experience,
    this.education,
    required this.isLast,
    required this.isTablet,
  }) : assert(experience != null || education != null);

  @override
  Widget build(BuildContext context) {
    final isWork = experience != null;
    final title = isWork ? experience!.title : education!.degree;
    final subtitle = isWork ? experience!.company : education!.institution;
    final date = isWork
        ? '${experience!.startDate} - ${experience!.endDate}'
        : education!.year;
    final description = isWork ? experience!.description : '';
    final icon = isWork ? Icons.work : education!.icon;
    final location = isWork ? experience!.location : education!.location;

    // Responsive values
    final timelineWidth = isTablet ? 44.0 : 40.0;
    final iconSize = isTablet ? 40.0 : 36.0;
    final cardPadding = isTablet ? 20.0 : 16.0;
    final titleSize = isTablet ? 18.0 : 16.0;
    final subtitleSize = isTablet ? 15.0 : 14.0;
    final iconInCardSize = isTablet ? 20.0 : 18.0;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline
          SizedBox(
            width: timelineWidth,
            child: Column(
              children: [
                Container(
                  width: iconSize,
                  height: iconSize,
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.primaryColor.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(icon, color: Colors.white, size: iconInCardSize),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: AppTheme.primaryColor.withOpacity(0.3),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(width: isTablet ? 16 : 12),
          // Content
          Expanded(
            child: Card(
              margin: EdgeInsets.only(bottom: isTablet ? 24 : 20),
              child: Padding(
                padding: EdgeInsets.all(cardPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: titleSize,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: subtitleSize,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: isTablet ? 15 : 14,
                          color: AppTheme.textSecondary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          date,
                          style: TextStyle(
                            fontSize: isTablet ? 13 : 12,
                            color: AppTheme.textSecondary,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Icon(
                          Icons.location_on,
                          size: isTablet ? 15 : 14,
                          color: AppTheme.textSecondary,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            location,
                            style: TextStyle(
                              fontSize: isTablet ? 13 : 12,
                              color: AppTheme.textSecondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (isWork && description.isNotEmpty) ...[
                      const SizedBox(height: 12),
                      const Divider(),
                      const SizedBox(height: 12),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: isTablet ? 14 : 13,
                          color: AppTheme.textSecondary,
                          height: 1.5,
                        ),
                      ),
                    ],
                    if (!isWork && education!.grade != null) ...[
                      const SizedBox(height: 8),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: isTablet ? 12 : 10,
                          vertical: isTablet ? 6 : 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Grade: ${education!.grade}',
                          style: TextStyle(
                            fontSize: isTablet ? 13 : 12,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
