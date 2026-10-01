import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/profile_data.dart';
import '../theme/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();
  final _sectionKeys = List.generate(5, (_) => GlobalKey());

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _goTo(int index) {
    final context = _sectionKeys[index].currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        alignment: 0.04,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 900;
          final horizontalPadding = constraints.maxWidth >= 1200
              ? 88.0
              : constraints.maxWidth >= 700
              ? 48.0
              : 22.0;

          return CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: _TopBar(
                  horizontalPadding: horizontalPadding,
                  isWide: isWide,
                  onNavigate: _goTo,
                ),
              ),
              SliverToBoxAdapter(
                child: _Hero(
                  horizontalPadding: horizontalPadding,
                  isWide: isWide,
                  onProjects: () => _goTo(2),
                  onContact: () => _goTo(4),
                ),
              ),
              SliverToBoxAdapter(
                child: _About(
                  key: _sectionKeys[0],
                  horizontalPadding: horizontalPadding,
                  isWide: isWide,
                ),
              ),
              SliverToBoxAdapter(
                child: _Skills(
                  key: _sectionKeys[1],
                  horizontalPadding: horizontalPadding,
                  isWide: isWide,
                ),
              ),
              SliverToBoxAdapter(
                child: _Projects(
                  key: _sectionKeys[2],
                  horizontalPadding: horizontalPadding,
                  isWide: isWide,
                ),
              ),
              SliverToBoxAdapter(
                child: _Experience(
                  key: _sectionKeys[3],
                  horizontalPadding: horizontalPadding,
                  isWide: isWide,
                ),
              ),
              SliverToBoxAdapter(
                child: _Contact(
                  key: _sectionKeys[4],
                  horizontalPadding: horizontalPadding,
                  isWide: isWide,
                ),
              ),
              SliverToBoxAdapter(
                child: _Footer(horizontalPadding: horizontalPadding),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({
    required this.horizontalPadding,
    required this.isWide,
    required this.onNavigate,
  });

  final double horizontalPadding;
  final bool isWide;
  final ValueChanged<int> onNavigate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: 20,
      ),
      decoration: const BoxDecoration(
        color: AppTheme.backgroundColor,
        border: Border(bottom: BorderSide(color: AppTheme.dividerColor)),
      ),
      child: Row(
        children: [
          Text(
            'LA.',
            style: GoogleFonts.manrope(
              color: AppTheme.primaryColor,
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),
          const Spacer(),
          if (isWide)
            Row(
              children: [
                _NavLink(label: 'About', onTap: () => onNavigate(0)),
                _NavLink(label: 'Expertise', onTap: () => onNavigate(1)),
                _NavLink(label: 'Projects', onTap: () => onNavigate(2)),
                _NavLink(label: 'Experience', onTap: () => onNavigate(3)),
                const SizedBox(width: 12),
                OutlinedButton.icon(
                  onPressed: () => onNavigate(4),
                  icon: const Icon(Icons.arrow_outward, size: 16),
                  label: const Text('Get in touch'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppTheme.textPrimary,
                    side: const BorderSide(color: AppTheme.dividerColor),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ],
            )
          else
            IconButton(
              tooltip: 'Contact',
              onPressed: () => onNavigate(4),
              icon: const Icon(Icons.mail_outline),
            ),
        ],
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  const _NavLink({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => TextButton(
    onPressed: onTap,
    style: TextButton.styleFrom(
      foregroundColor: AppTheme.textSecondary,
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 12),
    ),
    child: Text(label),
  );
}

class _Hero extends StatelessWidget {
  const _Hero({
    required this.horizontalPadding,
    required this.isWide,
    required this.onProjects,
    required this.onContact,
  });

  final double horizontalPadding;
  final bool isWide;
  final VoidCallback onProjects;
  final VoidCallback onContact;

  @override
  Widget build(BuildContext context) {
    final titleSize = isWide ? 66.0 : 44.0;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        horizontalPadding,
        isWide ? 108 : 72,
        horizontalPadding,
        isWide ? 100 : 72,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xFFEAF3EE), AppTheme.backgroundColor],
          stops: [0, 0.65],
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1250),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _Eyebrow(label: 'FLUTTER MOBILE DEVELOPER  /  FULL-STACK ENGINEER'),
                    const SizedBox(height: 22),
                    Text(
                      'Louis Alvin\nAkura',
                      style: GoogleFonts.manrope(
                        color: AppTheme.textPrimary,
                        fontSize: titleSize,
                        height: 1.04,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 650),
                      child: Text(
                        ProfileData.summary,
                        style: GoogleFonts.dmSans(
                          color: AppTheme.textSecondary,
                          fontSize: isWide ? 18 : 16,
                          height: 1.7,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        FilledButton.icon(
                          onPressed: onProjects,
                          icon: const Icon(Icons.arrow_downward, size: 17),
                          label: const Text('Explore my work'),
                          style: FilledButton.styleFrom(
                            backgroundColor: AppTheme.primaryColor,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 17,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        OutlinedButton.icon(
                          onPressed: onContact,
                          icon: const Icon(Icons.mail_outline, size: 18),
                          label: const Text('Contact me'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppTheme.textPrimary,
                            side: const BorderSide(color: AppTheme.dividerColor),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 17,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    Wrap(
                      spacing: 20,
                      runSpacing: 8,
                      children: const [
                        _HeroMeta(icon: Icons.location_on_outlined, label: 'Nairobi, Kenya'),
                        _HeroMeta(icon: Icons.work_history_outlined, label: '2+ years building products'),
                      ],
                    ),
                  ],
                ),
              ),
              if (isWide) ...[
                const SizedBox(width: 72),
                const Expanded(flex: 4, child: _HeroPanel()),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _HeroPanel extends StatelessWidget {
  const _HeroPanel();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 310, maxHeight: 370),
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppTheme.textPrimary,
        borderRadius: BorderRadius.circular(6),
        boxShadow: const [
          BoxShadow(color: Color(0x1820342C), blurRadius: 36, offset: Offset(0, 18)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.terminal, color: AppTheme.primaryColor),
              const SizedBox(width: 10),
              Text(
                'BUILDING FOR REAL-WORLD USE',
                style: GoogleFonts.dmSans(
                  color: AppTheme.primaryColor,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.8,
                ),
              ),
            ],
          ),
          Text(
            'Thoughtful software.\nUseful by design.',
            style: GoogleFonts.manrope(
              color: AppTheme.backgroundColor,
              fontSize: 31,
              height: 1.15,
              fontWeight: FontWeight.w800,
            ),
          ),
          const Divider(color: Color(0xFFD9E2DC)),
          Wrap(
            spacing: 18,
            runSpacing: 10,
            children: const [
              _FocusItem(icon: Icons.phone_iphone, label: 'Mobile'),
              _FocusItem(icon: Icons.language, label: 'Web'),
              _FocusItem(icon: Icons.hub_outlined, label: 'Systems'),
            ],
          ),
        ],
      ),
    );
  }
}

class _FocusItem extends StatelessWidget {
  const _FocusItem({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(icon, size: 17, color: AppTheme.primaryColor),
      const SizedBox(width: 7),
      Text(label, style: GoogleFonts.dmSans(color: AppTheme.backgroundColor)),
    ],
  );
}

class _HeroMeta extends StatelessWidget {
  const _HeroMeta({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(icon, size: 17, color: AppTheme.primaryColor),
      const SizedBox(width: 6),
      Text(
        label,
        style: GoogleFonts.dmSans(color: AppTheme.textSecondary, fontSize: 14),
      ),
    ],
  );
}

class _About extends StatelessWidget {
  const _About({super.key, required this.horizontalPadding, required this.isWide});
  final double horizontalPadding;
  final bool isWide;

  @override
  Widget build(BuildContext context) => _Section(
    horizontalPadding: horizontalPadding,
    background: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeading(
          eyebrow: 'A LITTLE ABOUT ME',
          title: 'Engineering with\npeople and process in mind.',
          isWide: isWide,
        ),
        const SizedBox(height: 28),
        Wrap(
          spacing: 70,
          runSpacing: 24,
          children: [
            SizedBox(
              width: isWide ? 540 : double.infinity,
              child: Text(
                'I build cross-platform and web products for business, commerce, transport, and financial workflows. My work spans responsive interfaces, real-time data, integrations, and the details that make software dependable in day-to-day use.',
                style: GoogleFonts.dmSans(
                  color: AppTheme.textSecondary,
                  fontSize: 17,
                  height: 1.75,
                ),
              ),
            ),
            SizedBox(
              width: isWide ? 430 : double.infinity,
              child: const Column(
                children: [
                  _FactRow(value: '55%', label: 'faster Flutter build pipeline'),
                  _FactRow(value: '4+', label: 'product domains delivered'),
                  _FactRow(value: '2025', label: 'Applied Computer Science graduate'),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

class _FactRow extends StatelessWidget {
  const _FactRow({required this.value, required this.label});
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(vertical: 14),
    decoration: const BoxDecoration(
      border: Border(bottom: BorderSide(color: AppTheme.dividerColor)),
    ),
    child: Row(
      children: [
        SizedBox(
          width: 82,
          child: Text(
            value,
            style: GoogleFonts.manrope(
              color: AppTheme.primaryColor,
              fontSize: 23,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        Expanded(
          child: Text(
            label,
            style: GoogleFonts.dmSans(color: AppTheme.textPrimary, fontSize: 15),
          ),
        ),
      ],
    ),
  );
}

class _Skills extends StatelessWidget {
  const _Skills({super.key, required this.horizontalPadding, required this.isWide});
  final double horizontalPadding;
  final bool isWide;

  @override
  Widget build(BuildContext context) => _Section(
    horizontalPadding: horizontalPadding,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeading(eyebrow: 'CAPABILITIES', title: 'Tools I work with', isWide: isWide),
        const SizedBox(height: 30),
        Wrap(
          spacing: 34,
          runSpacing: 28,
          children: [
            _SkillGroup(title: 'LANGUAGES', skills: const ['Dart', 'TypeScript', 'JavaScript', 'Kotlin', 'Python', 'HTML', 'CSS']),
            _SkillGroup(title: 'FRAMEWORKS & PLATFORMS', skills: const ['Flutter', 'Vite', 'Firebase', 'Supabase', 'REST APIs']),
            _SkillGroup(title: 'ENGINEERING', skills: const ['Clean Architecture', 'Provider', 'MVC', 'Git', 'Postman', 'Google Maps API']),
          ],
        ),
      ],
    ),
  );
}

class _SkillGroup extends StatelessWidget {
  const _SkillGroup({required this.title, required this.skills});
  final String title;
  final List<String> skills;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: 300,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.dmSans(
            color: AppTheme.primaryColor,
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.7,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: skills
              .map(
                (skill) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppTheme.dividerColor),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    skill,
                    style: GoogleFonts.dmSans(
                      color: AppTheme.textPrimary,
                      fontSize: 13,
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

class _Projects extends StatelessWidget {
  const _Projects({super.key, required this.horizontalPadding, required this.isWide});
  final double horizontalPadding;
  final bool isWide;

  @override
  Widget build(BuildContext context) => _Section(
    key: const ValueKey('projects-section'),
    horizontalPadding: horizontalPadding,
    background: AppTheme.darkSurface,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeading(
          eyebrow: 'SELECTED WORK',
          title: 'Products built to solve things.',
          isWide: isWide,
          inverted: true,
        ),
        const SizedBox(height: 32),
        LayoutBuilder(
          builder: (context, constraints) {
            final columns = constraints.maxWidth > 900 ? 3 : constraints.maxWidth > 580 ? 2 : 1;
            final itemWidth = (constraints.maxWidth - (columns - 1) * 18) / columns;
            return Wrap(
              spacing: 18,
              runSpacing: 18,
              children: ProfileData.projects
                  .map((project) => SizedBox(
                    width: itemWidth,
                    child: _ProjectCard(project: project),
                  ))
                  .toList(),
            );
          },
        ),
      ],
    ),
  );
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({required this.project});
  final Project project;

  @override
  Widget build(BuildContext context) => Container(
    constraints: const BoxConstraints(minHeight: 245),
    padding: const EdgeInsets.all(22),
    decoration: BoxDecoration(
      color: AppTheme.darkCard,
      border: Border.all(color: const Color(0xFF34433B)),
      borderRadius: BorderRadius.circular(5),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(project.icon, color: AppTheme.accentColor, size: 24),
        const SizedBox(height: 19),
        Text(
          project.title,
          style: GoogleFonts.manrope(
            color: Colors.white,
            fontSize: 19,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 9),
        Text(
          project.description,
          style: GoogleFonts.dmSans(
            color: const Color(0xFFBBC7C0),
            fontSize: 14,
            height: 1.55,
          ),
        ),
        const SizedBox(height: 18),
        Wrap(
          spacing: 7,
          runSpacing: 6,
          children: project.technologies
              .map((technology) => Text(
                technology,
                style: GoogleFonts.dmSans(
                  color: AppTheme.accentColor,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ))
              .toList(),
        ),
      ],
    ),
  );
}

class _Experience extends StatelessWidget {
  const _Experience({super.key, required this.horizontalPadding, required this.isWide});
  final double horizontalPadding;
  final bool isWide;

  @override
  Widget build(BuildContext context) => _Section(
    horizontalPadding: horizontalPadding,
    background: Colors.white,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeading(eyebrow: 'CAREER', title: 'Experience & education', isWide: isWide),
        const SizedBox(height: 28),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 980),
          child: Column(
            children: [
              ...ProfileData.experiences.map((experience) => _ExperienceRow(experience: experience)),
              const _EducationRow(),
            ],
          ),
        ),
      ],
    ),
  );
}

class _ExperienceRow extends StatelessWidget {
  const _ExperienceRow({required this.experience});
  final Experience experience;

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 22),
    decoration: const BoxDecoration(
      border: Border(bottom: BorderSide(color: AppTheme.dividerColor)),
    ),
    child: LayoutBuilder(
      builder: (context, constraints) {
        final compact = constraints.maxWidth < 650;
        final dates = '${experience.startDate} – ${experience.endDate}';
        final details = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(experience.title, style: GoogleFonts.manrope(fontSize: 18, fontWeight: FontWeight.w700, color: AppTheme.textPrimary)),
            const SizedBox(height: 3),
            Text('${experience.company} · ${experience.location}', style: GoogleFonts.dmSans(fontSize: 14, color: AppTheme.primaryColor, fontWeight: FontWeight.w600)),
            const SizedBox(height: 9),
            Text(experience.description, style: GoogleFonts.dmSans(fontSize: 14, height: 1.55, color: AppTheme.textSecondary)),
          ],
        );
        if (compact) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(dates, style: GoogleFonts.dmSans(color: AppTheme.textSecondary, fontSize: 13)),
              const SizedBox(height: 8),
              details,
            ],
          );
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 190, child: Text(dates, style: GoogleFonts.dmSans(color: AppTheme.textSecondary, fontSize: 13))),
            Expanded(child: details),
          ],
        );
      },
    ),
  );
}

class _EducationRow extends StatelessWidget {
  const _EducationRow();

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 22),
    child: LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxWidth < 650;
        final details = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('BSc, Applied Computer Science', style: GoogleFonts.manrope(fontSize: 18, fontWeight: FontWeight.w700, color: AppTheme.textPrimary)),
            const SizedBox(height: 3),
            Text('Daystar University · Nairobi', style: GoogleFonts.dmSans(fontSize: 14, color: AppTheme.primaryColor, fontWeight: FontWeight.w600)),
            const SizedBox(height: 9),
            Text('Certifications: Cisco Cybersecurity, Advanced Software Development, SEO Optimization', style: GoogleFonts.dmSans(fontSize: 14, height: 1.55, color: AppTheme.textSecondary)),
          ],
        );
        if (isCompact) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Graduated 2025', style: GoogleFonts.dmSans(color: AppTheme.textSecondary, fontSize: 13)),
              const SizedBox(height: 8),
              details,
            ],
          );
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 190, child: Text('Graduated 2025', style: GoogleFonts.dmSans(color: AppTheme.textSecondary, fontSize: 13))),
            Expanded(child: details),
          ],
        );
      },
    ),
  );
}

class _Contact extends StatelessWidget {
  const _Contact({super.key, required this.horizontalPadding, required this.isWide});
  final double horizontalPadding;
  final bool isWide;

  @override
  Widget build(BuildContext context) => _Section(
    horizontalPadding: horizontalPadding,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SectionHeading(eyebrow: 'CONTACT', title: 'Let’s build something\nuseful together.', isWide: isWide),
              const SizedBox(height: 24),
              Text('Available for mobile and web product work, collaborations, and thoughtful conversations.', style: GoogleFonts.dmSans(color: AppTheme.textSecondary, fontSize: 16, height: 1.65)),
              const SizedBox(height: 24),
              Wrap(
                spacing: 20,
                runSpacing: 12,
                children: [
                  _ContactLink(icon: Icons.mail_outline, label: ProfileData.email, url: 'mailto:${ProfileData.email}'),
                  _ContactLink(icon: Icons.phone_outlined, label: ProfileData.phone, url: 'tel:${ProfileData.phone.replaceAll(' ', '')}'),
                  _ContactLink(icon: Icons.link, label: 'LinkedIn', url: ProfileData.linkedIn),
                  _ContactLink(icon: Icons.code, label: 'GitHub', url: ProfileData.github),
                ],
              ),
            ],
          ),
        ),
        if (isWide) ...[
          const SizedBox(width: 50),
          const Icon(Icons.north_east, color: AppTheme.accentColor, size: 100),
        ],
      ],
    ),
  );
}

class _ContactLink extends StatelessWidget {
  const _ContactLink({required this.icon, required this.label, required this.url});
  final IconData icon;
  final String label;
  final String url;

  Future<void> _open() async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) => TextButton.icon(
    onPressed: _open,
    icon: Icon(icon, size: 17),
    label: Text(label),
    style: TextButton.styleFrom(
      foregroundColor: AppTheme.primaryColor,
      padding: EdgeInsets.zero,
    ),
  );
}

class _Footer extends StatelessWidget {
  const _Footer({required this.horizontalPadding});
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 22),
    decoration: const BoxDecoration(
      color: AppTheme.darkSurface,
      border: Border(top: BorderSide(color: Color(0xFF34433B))),
    ),
    child: Row(
      children: [
        Text('LOUIS ALVIN AKURA', style: GoogleFonts.dmSans(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700)),
        const Spacer(),
        Text('Nairobi, Kenya  ·  © 2026', style: GoogleFonts.dmSans(color: const Color(0xFFBBC7C0), fontSize: 12)),
      ],
    ),
  );
}

class _Section extends StatelessWidget {
  const _Section({
    super.key,
    required this.horizontalPadding,
    required this.child,
    this.background = AppTheme.backgroundColor,
  });

  final double horizontalPadding;
  final Widget child;
  final Color background;

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    color: background,
    padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 76),
    child: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1250),
        child: child,
      ),
    ),
  );
}

class _SectionHeading extends StatelessWidget {
  const _SectionHeading({
    required this.eyebrow,
    required this.title,
    required this.isWide,
    this.inverted = false,
  });

  final String eyebrow;
  final String title;
  final bool isWide;
  final bool inverted;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _Eyebrow(label: eyebrow, inverted: inverted),
      const SizedBox(height: 12),
      Text(
        title,
        style: GoogleFonts.manrope(
          color: inverted ? Colors.white : AppTheme.textPrimary,
          fontSize: isWide ? 35 : 28,
          height: 1.18,
          fontWeight: FontWeight.w800,
        ),
      ),
    ],
  );
}

class _Eyebrow extends StatelessWidget {
  const _Eyebrow({required this.label, this.inverted = false});
  final String label;
  final bool inverted;

  @override
  Widget build(BuildContext context) => Text(
    label,
    style: GoogleFonts.dmSans(
      color: inverted ? AppTheme.accentColor : AppTheme.primaryColor,
      fontSize: 11,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.8,
    ),
  );
}