import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/profile_data.dart';
import '../theme/app_theme.dart';
import '../widgets/project_card.dart';
import '../widgets/referee_card.dart';
import '../widgets/contact_row.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isTablet = constraints.maxWidth >= AppTheme.tabletBreakpoint;
          final isDesktop = constraints.maxWidth >= AppTheme.desktopBreakpoint;
          final isWideMobile = constraints.maxWidth >= 500;

          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: _HeroSection(isTablet: isTablet, isDesktop: isDesktop),
              ),
              SliverToBoxAdapter(
                child: _AboutSection(isTablet: isTablet, isDesktop: isDesktop),
              ),
              SliverToBoxAdapter(child: _StatsSection(isTablet: isTablet)),
              SliverToBoxAdapter(
                child: _SkillsSection(isTablet: isTablet, isDesktop: isDesktop),
              ),
              SliverToBoxAdapter(
                child: _ProjectsSection(
                  isTablet: isTablet,
                  isDesktop: isDesktop,
                  isWideMobile: isWideMobile,
                ),
              ),
              SliverToBoxAdapter(
                child: _ExperienceSection(
                  isTablet: isTablet,
                  isDesktop: isDesktop,
                ),
              ),
              SliverToBoxAdapter(
                child: _EducationSection(
                  isTablet: isTablet,
                  isDesktop: isDesktop,
                ),
              ),
              SliverToBoxAdapter(
                child: _ContactSection(
                  isTablet: isTablet,
                  isDesktop: isDesktop,
                ),
              ),
              SliverToBoxAdapter(child: _FooterSection(isTablet: isTablet)),
              SliverToBoxAdapter(child: SizedBox(height: isTablet ? 60 : 40)),
            ],
          );
        },
      ),
    );
  }
}

Future<void> _launchUrl(String url) async {
  final uri = Uri.parse(url);
  try {
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  } catch (e) {
    debugPrint('Could not launch $url: $e');
  }
}

class _HeroSection extends StatelessWidget {
  final bool isTablet;
  final bool isDesktop;

  const _HeroSection({required this.isTablet, required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    final avatarSize = isDesktop ? 160.0 : (isTablet ? 140.0 : 130.0);
    final iconSize = isDesktop ? 80.0 : (isTablet ? 70.0 : 60.0);
    final nameSize = isDesktop ? 36.0 : (isTablet ? 32.0 : 28.0);
    final padding = isDesktop ? 48.0 : (isTablet ? 36.0 : 24.0);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(padding, 70.0, padding, 50.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppTheme.primaryColor.withOpacity(0.15),
            AppTheme.backgroundColor,
          ],
        ),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: avatarSize,
                height: avatarSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [AppTheme.primaryColor, AppTheme.secondaryColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.primaryColor.withOpacity(0.3),
                      blurRadius: 30,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.person,
                    size: iconSize,
                    color: Colors.black54,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(isTablet ? 10 : 8),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: Icon(
                    Icons.camera_alt,
                    size: isTablet ? 20 : 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: isTablet ? 32 : 24),
          Text(
            ProfileData.name,
            style: GoogleFonts.poppins(
              fontSize: nameSize,
              fontWeight: FontWeight.bold,
              color: AppTheme.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isTablet ? 12 : 8),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: isTablet ? 28 : 20,
              vertical: isTablet ? 14 : 10,
            ),
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: AppTheme.primaryColor.withOpacity(0.3)),
            ),
            child: Text(
              ProfileData.title,
              style: GoogleFonts.poppins(
                fontSize: isTablet ? 17 : 15,
                color: AppTheme.primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: isTablet ? 24 : 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on,
                color: AppTheme.textSecondary,
                size: isTablet ? 18 : 16,
              ),
              const SizedBox(width: 4),
              Text(
                ProfileData.location,
                style: GoogleFonts.poppins(
                  color: AppTheme.textSecondary,
                  fontSize: isTablet ? 16 : 14,
                ),
              ),
            ],
          ),
          SizedBox(height: isTablet ? 32 : 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => _launchUrl('mailto:${ProfileData.email}'),
                child: Container(
                  padding: EdgeInsets.all(isTablet ? 16 : 12),
                  decoration: BoxDecoration(
                    color: AppTheme.surfaceColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppTheme.dividerColor),
                  ),
                  child: Icon(
                    Icons.email,
                    color: AppTheme.primaryColor,
                    size: isTablet ? 26 : 22,
                  ),
                ),
              ),
              SizedBox(width: isTablet ? 16 : 12),
              GestureDetector(
                onTap: () => _launchUrl('tel:${ProfileData.phone}'),
                child: Container(
                  padding: EdgeInsets.all(isTablet ? 16 : 12),
                  decoration: BoxDecoration(
                    color: AppTheme.surfaceColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppTheme.dividerColor),
                  ),
                  child: Icon(
                    Icons.phone,
                    color: AppTheme.primaryColor,
                    size: isTablet ? 26 : 22,
                  ),
                ),
              ),
              SizedBox(width: isTablet ? 16 : 12),
              GestureDetector(
                onTap: () => _launchUrl(ProfileData.linkedin),
                child: Container(
                  padding: EdgeInsets.all(isTablet ? 16 : 12),
                  decoration: BoxDecoration(
                    color: AppTheme.surfaceColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppTheme.dividerColor),
                  ),
                  child: Icon(
                    Icons.link,
                    color: AppTheme.primaryColor,
                    size: isTablet ? 26 : 22,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AboutSection extends StatelessWidget {
  final bool isTablet;
  final bool isDesktop;

  const _AboutSection({required this.isTablet, required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    final padding = isDesktop ? 32.0 : (isTablet ? 24.0 : 20.0);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeader(
            title: 'About Me',
            icon: Icons.person,
            isTablet: isTablet,
          ),
          const SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(isTablet ? 24 : 20),
            decoration: BoxDecoration(
              color: AppTheme.cardColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppTheme.dividerColor),
            ),
            child: Text(
              ProfileData.summary,
              style: GoogleFonts.poppins(
                fontSize: isTablet ? 16 : 15,
                color: AppTheme.textSecondary,
                height: 1.7,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatsSection extends StatelessWidget {
  final bool isTablet;

  const _StatsSection({required this.isTablet});

  @override
  Widget build(BuildContext context) {
    final padding = isTablet ? 24.0 : 20.0;

    return Padding(
      padding: EdgeInsets.all(padding),
      child: Row(
        children: [
          Expanded(
            child: _StatCard(
              icon: Icons.work,
              value: '1+',
              label: 'Years Exp.',
              isTablet: isTablet,
            ),
          ),
          SizedBox(width: isTablet ? 16 : 12),
          Expanded(
            child: _StatCard(
              icon: Icons.folder,
              value: '${ProfileData.projects.length}',
              label: 'Projects',
              isTablet: isTablet,
            ),
          ),
          SizedBox(width: isTablet ? 16 : 12),
          Expanded(
            child: _StatCard(
              icon: Icons.code,
              value: '${ProfileData.skills.length}',
              label: 'Skills',
              isTablet: isTablet,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final bool isTablet;

  const _StatCard({
    required this.icon,
    required this.value,
    required this.label,
    required this.isTablet,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isTablet ? 28 : 20,
        horizontal: isTablet ? 16 : 12,
      ),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.dividerColor),
      ),
      child: Column(
        children: [
          Icon(icon, color: AppTheme.primaryColor, size: isTablet ? 36 : 28),
          const SizedBox(height: 8),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: isTablet ? 28 : 22,
              fontWeight: FontWeight.bold,
              color: AppTheme.textPrimary,
            ),
          ),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: isTablet ? 14 : 12,
              color: AppTheme.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _SkillsSection extends StatelessWidget {
  final bool isTablet;
  final bool isDesktop;

  const _SkillsSection({required this.isTablet, required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    final padding = isDesktop ? 32.0 : (isTablet ? 24.0 : 20.0);
    final crossAxisCount = isDesktop ? 5 : (isTablet ? 4 : 3);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeader(
            title: 'Skills',
            icon: Icons.psychology,
            isTablet: isTablet,
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: isTablet ? 16 : 12,
              mainAxisSpacing: isTablet ? 16 : 12,
              childAspectRatio: 0.85,
            ),
            itemCount: ProfileData.skills.length,
            itemBuilder: (context, index) => _SkillItem(
              skill: ProfileData.skills[index],
              isTablet: isTablet,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Currently Learning',
            style: GoogleFonts.poppins(
              fontSize: isTablet ? 18 : 16,
              fontWeight: FontWeight.w600,
              color: AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: isTablet ? 12 : 8,
            runSpacing: isTablet ? 12 : 8,
            children: ProfileData.currentlyLearning
                .map(
                  (skill) => Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: isTablet ? 18 : 14,
                      vertical: isTablet ? 10 : 8,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: AppTheme.primaryColor.withOpacity(0.3),
                      ),
                    ),
                    child: Text(
                      skill,
                      style: GoogleFonts.poppins(
                        fontSize: isTablet ? 15 : 13,
                        color: AppTheme.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _SkillItem extends StatelessWidget {
  final Skill skill;
  final bool isTablet;

  const _SkillItem({required this.skill, required this.isTablet});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(isTablet ? 12 : 8),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.dividerColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            skill.icon,
            size: isTablet ? 36 : 28,
            color: AppTheme.primaryColor,
          ),
          SizedBox(height: isTablet ? 10 : 8),
          Text(
            skill.name,
            style: GoogleFonts.poppins(
              fontSize: isTablet ? 13 : 11,
              fontWeight: FontWeight.w600,
              color: AppTheme.textPrimary,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: isTablet ? 4 : 2),
          Text(
            '${(skill.proficiency * 100).toInt()}%',
            style: GoogleFonts.poppins(
              fontSize: isTablet ? 11 : 9,
              color: AppTheme.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectsSection extends StatelessWidget {
  final bool isTablet;
  final bool isDesktop;
  final bool isWideMobile;

  const _ProjectsSection({
    required this.isTablet,
    required this.isDesktop,
    required this.isWideMobile,
  });

  @override
  Widget build(BuildContext context) {
    final padding = isDesktop ? 32.0 : (isTablet ? 24.0 : 20.0);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeader(
            title: 'Projects',
            icon: Icons.folder,
            isTablet: isTablet,
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isTablet ? 2 : 1,
              crossAxisSpacing: isDesktop ? 24 : 16,
              mainAxisSpacing: 16,
              childAspectRatio: isDesktop ? 1.4 : 1.3,
            ),
            itemCount: ProfileData.projects.length,
            itemBuilder: (context, index) => ProjectCard(
              project: ProfileData.projects[index],
              isTablet: isTablet,
            ),
          ),
        ],
      ),
    );
  }
}

class _ExperienceSection extends StatelessWidget {
  final bool isTablet;
  final bool isDesktop;

  const _ExperienceSection({required this.isTablet, required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    final padding = isDesktop ? 32.0 : (isTablet ? 24.0 : 20.0);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeader(
            title: 'Experience',
            icon: Icons.work,
            isTablet: isTablet,
          ),
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: ProfileData.experiences.length,
            itemBuilder: (context, index) => _TimelineItem(
              experience: ProfileData.experiences[index],
              isLast: index == ProfileData.experiences.length - 1,
              isTablet: isTablet,
            ),
          ),
        ],
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  final Experience experience;
  final bool isLast;
  final bool isTablet;

  const _TimelineItem({
    required this.experience,
    required this.isLast,
    required this.isTablet,
  });

  @override
  Widget build(BuildContext context) {
    final timelineWidth = isTablet ? 40.0 : 36.0;
    final iconSize = isTablet ? 36.0 : 32.0;
    final padding = isTablet ? 20.0 : 16.0;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                  child: Icon(
                    Icons.work,
                    color: Colors.white,
                    size: isTablet ? 18 : 16,
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(width: 2, color: AppTheme.dividerColor),
                  ),
              ],
            ),
          ),
          SizedBox(width: isTablet ? 16 : 14),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom: isTablet ? 20 : 16),
              padding: EdgeInsets.all(padding),
              decoration: BoxDecoration(
                color: AppTheme.cardColor,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppTheme.dividerColor),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    experience.title,
                    style: GoogleFonts.poppins(
                      fontSize: isTablet ? 17 : 15,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    experience.company,
                    style: GoogleFonts.poppins(
                      fontSize: isTablet ? 15 : 14,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: isTablet ? 14 : 13,
                        color: AppTheme.textSecondary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${experience.startDate} - ${experience.endDate}',
                        style: GoogleFonts.poppins(
                          fontSize: isTablet ? 13 : 12,
                          color: AppTheme.textSecondary,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Icon(
                        Icons.location_on,
                        size: isTablet ? 14 : 13,
                        color: AppTheme.textSecondary,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          experience.location,
                          style: GoogleFonts.poppins(
                            fontSize: isTablet ? 13 : 12,
                            color: AppTheme.textSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    experience.description,
                    style: GoogleFonts.poppins(
                      fontSize: isTablet ? 14 : 13,
                      color: AppTheme.textSecondary,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EducationSection extends StatelessWidget {
  final bool isTablet;
  final bool isDesktop;

  const _EducationSection({required this.isTablet, required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    final padding = isDesktop ? 32.0 : (isTablet ? 24.0 : 20.0);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeader(
            title: 'Education',
            icon: Icons.school,
            isTablet: isTablet,
          ),
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: ProfileData.education.length,
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

class _EducationCard extends StatelessWidget {
  final Education education;
  final bool isTablet;

  const _EducationCard({required this.education, required this.isTablet});

  @override
  Widget build(BuildContext context) {
    final margin = isTablet ? 16.0 : 12.0;
    final padding = isTablet ? 20.0 : 16.0;
    final iconPadding = isTablet ? 14.0 : 10.0;
    final iconSize = isTablet ? 28.0 : 24.0;

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
          Container(
            padding: EdgeInsets.all(iconPadding),
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              education.icon,
              color: AppTheme.primaryColor,
              size: iconSize,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  education.degree,
                  style: GoogleFonts.poppins(
                    fontSize: isTablet ? 16 : 14,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  education.institution,
                  style: GoogleFonts.poppins(
                    fontSize: isTablet ? 15 : 13,
                    color: AppTheme.primaryColor,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      education.year,
                      style: GoogleFonts.poppins(
                        fontSize: isTablet ? 13 : 12,
                        color: AppTheme.textSecondary,
                      ),
                    ),
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

class _ContactSection extends StatelessWidget {
  final bool isTablet;
  final bool isDesktop;

  const _ContactSection({required this.isTablet, required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    final padding = isDesktop ? 32.0 : (isTablet ? 24.0 : 20.0);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeader(
            title: 'Contact',
            icon: Icons.contact_mail,
            isTablet: isTablet,
          ),
          const SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(isTablet ? 24 : 20),
            decoration: BoxDecoration(
              color: AppTheme.cardColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppTheme.dividerColor),
            ),
            child: Column(
              children: [
                ContactRow(
                  icon: Icons.email,
                  label: 'Email',
                  value: ProfileData.email,
                  onTap: () => _launchUrl('mailto:${ProfileData.email}'),
                  isTablet: isTablet,
                ),
                Divider(
                  color: AppTheme.dividerColor,
                  height: isTablet ? 28 : 24,
                ),
                ContactRow(
                  icon: Icons.phone,
                  label: 'Phone',
                  value: ProfileData.phone,
                  onTap: () => _launchUrl('tel:${ProfileData.phone}'),
                  isTablet: isTablet,
                ),
                Divider(
                  color: AppTheme.dividerColor,
                  height: isTablet ? 28 : 24,
                ),
                ContactRow(
                  icon: Icons.location_on,
                  label: 'Location',
                  value: ProfileData.location,
                  isTablet: isTablet,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Referees',
            style: GoogleFonts.poppins(
              fontSize: isTablet ? 18 : 16,
              fontWeight: FontWeight.w600,
              color: AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 12),
          ...ProfileData.referees.map(
            (referee) => RefereeCard(referee: referee, isTablet: isTablet),
          ),
        ],
      ),
    );
  }
}

class _FooterSection extends StatelessWidget {
  final bool isTablet;

  const _FooterSection({required this.isTablet});

  @override
  Widget build(BuildContext context) {
    final padding = isTablet ? 32.0 : 20.0;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Column(
        children: [
          const Divider(color: AppTheme.dividerColor),
          const SizedBox(height: 20),
          Text(
            'Made by Alvin',
            style: GoogleFonts.poppins(
              fontSize: isTablet ? 15 : 13,
              color: AppTheme.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '© 2026 ${ProfileData.name}',
            style: GoogleFonts.poppins(
              fontSize: isTablet ? 14 : 12,
              color: AppTheme.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isTablet;

  const _SectionHeader({
    required this.title,
    required this.icon,
    required this.isTablet,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(isTablet ? 10 : 8),
          decoration: BoxDecoration(
            color: AppTheme.primaryColor.withOpacity(0.15),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: AppTheme.primaryColor,
            size: isTablet ? 24 : 20,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: isTablet ? 24 : 20,
            fontWeight: FontWeight.bold,
            color: AppTheme.textPrimary,
          ),
        ),
      ],
    );
  }
}
