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

    return Scaffold(
      appBar: AppBar(title: const Text('Skills')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
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
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.85,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: ProfileData.skills.length,
              itemBuilder: (context, index) {
                final skill = ProfileData.skills[index];
                return _SkillCard(skill: skill);
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
              return _CategorySection(category: entry.key, skills: entry.value);
            }),
          ],
        ),
      ),
    );
  }
}

class _SkillCard extends StatelessWidget {
  final Skill skill;

  const _SkillCard({required this.skill});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularPercentIndicator(
              radius: 25,
              lineWidth: 4,
              percent: skill.proficiency,
              center: Icon(skill.icon, size: 20, color: AppTheme.primaryColor),
              progressColor: AppTheme.primaryColor,
              backgroundColor: AppTheme.primaryColor.withOpacity(0.2),
              circularStrokeCap: CircularStrokeCap.round,
            ),
            const SizedBox(height: 8),
            Text(
              skill.name,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),
            Text(
              '${(skill.proficiency * 100).toInt()}%',
              style: TextStyle(fontSize: 11, color: AppTheme.textSecondary),
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
