import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../data/profile_data.dart';
import '../theme/app_theme.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Group skills by category
    final Map<String, List<Skill>> groupedSkills = {};
    for (var skill in ProfileData.skills) {
      if (!groupedSkills.containsKey(skill.category)) {
        groupedSkills[skill.category] = [];
      }
      groupedSkills[skill.category]!.add(skill);
    }

    // Get responsive values
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= AppTheme.tabletBreakpoint;
    final isDesktop = screenWidth >= 1200;
    final padding = isDesktop
        ? 32.0
        : isTablet
        ? 24.0
        : 16.0;
    final crossAxisCount = isDesktop
        ? 5
        : isTablet
        ? 4
        : screenWidth >= 500
        ? 3
        : 2;

    return Scaffold(
      appBar: AppBar(title: const Text('Skills')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Technical Skills',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  'My technical expertise and proficiency levels',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 24),
                // Skills Grid
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    childAspectRatio: isTablet ? 0.9 : 0.85,
                    crossAxisSpacing: isTablet ? 12 : 8,
                    mainAxisSpacing: isTablet ? 12 : 8,
                  ),
                  itemCount: ProfileData.skills.length,
                  itemBuilder: (context, index) {
                    final skill = ProfileData.skills[index];
                    return _SkillCard(skill: skill, isTablet: isTablet);
                  },
                ),
                const SizedBox(height: 32),
                // Skills by Category
                Text(
                  'Skills by Category',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 16),
                ...groupedSkills.entries.map((entry) {
                  return _CategorySection(
                    category: entry.key,
                    skills: entry.value,
                  );
                }),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _SkillCard extends StatelessWidget {
  final Skill skill;
  final bool isTablet;

  const _SkillCard({required this.skill, required this.isTablet});

  @override
  Widget build(BuildContext context) {
    final radius = isTablet ? 30.0 : 25.0;
    final lineWidth = isTablet ? 5.0 : 4.0;
    final iconSize = isTablet ? 24.0 : 20.0;
    final fontSize = isTablet ? 13.0 : 12.0;

    return Card(
      child: Padding(
        padding: EdgeInsets.all(isTablet ? 14 : 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularPercentIndicator(
              radius: radius,
              lineWidth: lineWidth,
              percent: skill.proficiency,
              center: Icon(
                skill.icon,
                size: iconSize,
                color: AppTheme.primaryColor,
              ),
              progressColor: AppTheme.primaryColor,
              backgroundColor: AppTheme.primaryColor.withOpacity(0.2),
              circularStrokeCap: CircularStrokeCap.round,
            ),
            SizedBox(height: isTablet ? 10 : 8),
            Text(
              skill.name,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: fontSize),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),
            Text(
              '${(skill.proficiency * 100).toInt()}%',
              style: TextStyle(
                fontSize: fontSize - 1,
                color: AppTheme.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategorySection extends StatelessWidget {
  final String category;
  final List<Skill> skills;

  const _CategorySection({required this.category, required this.skills});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppTheme.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            category,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: AppTheme.primaryColor,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: skills.map((skill) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppTheme.primaryColor.withOpacity(0.3),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(skill.icon, size: 16, color: AppTheme.primaryColor),
                  const SizedBox(width: 6),
                  Text(
                    skill.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
