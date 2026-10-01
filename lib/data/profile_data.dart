import 'package:flutter/material.dart';

class ProfileData {
  // Personal Information
  static const String name = 'Louis Alvin Akura';
  static const String title = 'Flutter Mobile Developer | Full-Stack Engineer';
  static const String email = 'akuralouis3@gmail.com';
  static const String phone = '+254 798 155 454';
  static const String location = 'Nairobi, Kenya';
  static const String linkedIn = 'https://linkedin.com/in/louis-akura-b959a8357';
  static const String github = 'https://github.com/Akura-L';
  static const String summary =
      '''Full-Stack Developer and mobile/web application developer with 2+ years of experience building business, marketplace, transport, and financial technology solutions. Delivered a multi-role transport management platform handling real-time booking, live chat, and Google Maps integration, and reduced build time from 11 minutes to under 5 through targeted optimization. Focused on scalable, responsive applications, clean UI/UX, workflow automation, and business process optimization.''';

  // Skills with proficiency levels (0.0 to 1.0)
  static const List<Skill> skills = [
    Skill(
      name: 'Flutter',
      icon: Icons.flutter_dash,
      proficiency: 0.95,
      category: 'Mobile',
    ),
    Skill(
      name: 'Dart',
      icon: Icons.code,
      proficiency: 0.90,
      category: 'Mobile',
    ),
    Skill(
      name: 'Firebase',
      icon: Icons.cloud,
      proficiency: 0.85,
      category: 'Backend',
    ),
    Skill(
      name: 'Supabase',
      icon: Icons.storage,
      proficiency: 0.80,
      category: 'Backend',
    ),
    Skill(
      name: 'TypeScript',
      icon: Icons.javascript,
      proficiency: 0.85,
      category: 'Backend',
    ),
    Skill(
      name: 'Google Maps API',
      icon: Icons.map,
      proficiency: 0.80,
      category: 'Integrations',
    ),
    Skill(name: 'REST APIs', icon: Icons.api, proficiency: 0.90, category: 'Backend'),
    Skill(name: 'Vite', icon: Icons.bolt, proficiency: 0.80, category: 'Frontend'),
    Skill(name: 'Kotlin', icon: Icons.code, proficiency: 0.70, category: 'Languages'),
    Skill(name: 'Python', icon: Icons.code, proficiency: 0.70, category: 'Languages'),
  ];

  // Projects
  static const List<Project> projects = [
    Project(
      title: 'TRANSFA',
      description:
          'Multi-role transport management platform for users, drivers, managers, and sales agents, with live tracking, booking, and chat.',
      technologies: ['Flutter', 'Firebase', 'Google Maps', 'FCM'],
      icon: Icons.route,
    ),
    Project(
      title: 'SACCO Management System',
      description:
          'Cross-platform financial system for member registration, loan management, transaction logic, and financial reporting.',
      technologies: ['Flutter', 'Dart', 'Firebase', 'Reporting'],
      icon: Icons.account_balance,
    ),
    Project(
      title: 'Business Order Management',
      description:
          'TypeScript business application focused on order tracking, process automation, and operational workflows for small and medium businesses.',
      technologies: ['TypeScript', 'Vite', 'Workflow design'],
      icon: Icons.inventory_2_outlined,
    ),
    Project(
      title: 'Klembay',
      description:
          'Mobile-first thrift marketplace concept with product listings and a straightforward digital shopping experience.',
      technologies: ['Flutter', 'Dart', 'Marketplace'],
      icon: Icons.storefront_outlined,
    ),
    Project(
      title: 'Renty',
      description:
          'Rental platform concept covering user flows for booking, renting, and service-based operations.',
      technologies: ['Flutter', 'Dart', 'Rental platform'],
      icon: Icons.key_outlined,
    ),
    Project(
      title: 'Portfolio Website',
      description:
          'Personal portfolio presenting professional work, profile information, and front-end development practice.',
      technologies: ['Flutter Web', 'Responsive UI'],
      icon: Icons.web,
    ),
  ];

  // Work Experience
  static const List<Experience> experiences = [
    Experience(
      title: 'Mobile App Developer',
      company: 'Ndai Africa',
      location: 'Nairobi',
      startDate: 'Jan 2026',
      endDate: 'Present',
      description:
          'Develop cross-platform Flutter applications with real-time Firebase synchronization and REST APIs. Build responsive interfaces and integrate backend services for mobile and web clients.',
      isWork: true,
    ),
    Experience(
      title: 'Independent Developer / Project-Based Software Engineer',
      company: 'Freelance',
      location: 'Ongoing',
      startDate: 'Ongoing',
      endDate: 'Present',
      description:
          'Design and develop applications across business, commerce, transport, and financial sectors using Flutter/Dart and TypeScript.',
      isWork: true,
    ),
    Experience(
      title: 'Web Developer',
      company: 'Scotch Extreme',
      location: 'Nairobi',
      startDate: 'Aug 2025',
      endDate: 'Nov 2025',
      description:
          'Designed and deployed the company website, building responsive desktop and mobile interfaces and applying SEO and performance optimizations.',
      isWork: true,
    ),
    Experience(
      title: 'Software Developer Intern',
      company: 'Coretec Solutions',
      location: 'Nairobi',
      startDate: 'May 2024',
      endDate: 'Aug 2024',
      description:
          'Migrated a legacy SACCO financial system to a cross-platform Flutter application and redesigned reporting to improve accuracy and reduce manual reconciliation.',
      isWork: true,
    ),
    Experience(
      title: 'Assistant IT Personnel',
      company: 'Rophine Field School',
      location: 'Nairobi',
      startDate: 'May 2023',
      endDate: 'Sep 2023',
      description:
          'Provided hands-on IT support and troubleshooting for staff and students, maintained systems, and supported the school network and devices.',
      isWork: true,
    ),
  ];

  // Education
  static const List<Education> education = [
    Education(
      degree: 'BSc, Applied Computer Science',
      institution: 'Daystar University',
      location: 'Nairobi',
      year: 'Graduated 2025',
      icon: Icons.school,
    ),
  ];

  // Referees
  static const List<Referee> referees = [
    Referee(
      name: 'Fredrick Ogore',
      title: 'Lecturer',
      institution: 'Daystar University',
      phone: '0717 105 568',
      email: 'fogore@daystar.ac.ke',
    ),
    Referee(
      name: 'Francis Kaigwa',
      title: 'Industrial Supervisor',
      institution: 'Coretec Solutions',
      phone: '0729 851 927',
      email: 'francis.kaigwa@coretec.co.ke',
    ),
  ];

  // Current Learning
  static const List<String> currentlyLearning = [
    'Cybersecurity',
    'Advanced Software Development',
    'SEO Optimization',
  ];
}

class Skill {
  final String name;
  final IconData icon;
  final double proficiency;
  final String category;

  const Skill({
    required this.name,
    required this.icon,
    required this.proficiency,
    required this.category,
  });
}

class Project {
  final String title;
  final String description;
  final List<String> technologies;
  final IconData icon;

  const Project({
    required this.title,
    required this.description,
    required this.technologies,
    required this.icon,
  });
}

class Experience {
  final String title;
  final String company;
  final String location;
  final String startDate;
  final String endDate;
  final String description;
  final bool isWork;

  const Experience({
    required this.title,
    required this.company,
    required this.location,
    required this.startDate,
    required this.endDate,
    required this.description,
    this.isWork = true,
  });
}

class Education {
  final String degree;
  final String institution;
  final String location;
  final String year;
  final String? grade;
  final IconData icon;

  const Education({
    required this.degree,
    required this.institution,
    required this.location,
    required this.year,
    this.grade,
    required this.icon,
  });
}

class Referee {
  final String name;
  final String title;
  final String institution;
  final String phone;
  final String? email;

  const Referee({
    required this.name,
    required this.title,
    required this.institution,
    required this.phone,
    this.email,
  });
}
