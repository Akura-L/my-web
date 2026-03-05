import 'package:flutter/material.dart';

class ProfileData {
  // Personal Information
  static const String name = 'Louis Alvin Akura';
  static const String title = 'Full-Stack Mobile/Web Developer';
  static const String email = 'akuralouis3@gmail.com';
  static const String phone = '+254 798 155 454';
  static const String location = 'Nairobi, Kenya';
  static const String summary =
      '''Passionate full-stack developer specializing in Flutter for cross-platform mobile and web applications. Experienced in building real-time systems, e-commerce platforms, and automation solutions. Strong background in backend development with Node.js and MongoDB. Currently pursuing Bachelor of Applied Computer Science at Daystar University.''';

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
      name: 'Node.js',
      icon: Icons.javascript,
      proficiency: 0.85,
      category: 'Backend',
    ),
    Skill(
      name: 'MongoDB',
      icon: Icons.data_object,
      proficiency: 0.80,
      category: 'Database',
    ),
    Skill(
      name: 'REST APIs',
      icon: Icons.api,
      proficiency: 0.90,
      category: 'Backend',
    ),
    Skill(
      name: 'SQL',
      icon: Icons.table_chart,
      proficiency: 0.75,
      category: 'Database',
    ),
    Skill(
      name: 'Machine Learning',
      icon: Icons.psychology,
      proficiency: 0.60,
      category: 'AI/ML',
    ),
  ];

  // Projects
  static const List<Project> projects = [
    Project(
      title: 'Real-Time Online Bidding System',
      description:
          'A full-stack bidding platform with live updates, authentication, and real-time auction functionality.',
      technologies: ['Flutter', 'Node.js', 'MongoDB', 'WebSocket'],
      icon: Icons.gavel,
    ),
    Project(
      title: 'E-Commerce Platform',
      description:
          'Complete e-commerce solution with product listings, search, cart, checkout, order tracking, and admin dashboard.',
      technologies: ['Flutter', 'Supabase', 'Firebase', 'REST API'],
      icon: Icons.shopping_cart,
    ),
    Project(
      title: 'WooCommerce Automation',
      description:
          'Product scraping system that automatically scrapes Armco products and uploads to WooCommerce via REST API with CRON scheduling.',
      technologies: ['Node.js', 'MongoDB', 'WooCommerce REST API', 'CRON'],
      icon: Icons.auto_fix_high,
    ),
    Project(
      title: '3D Welding Tool Web App',
      description:
          'Custom web application for welding dimension calculations with future support for annotations and weld joint labeling.',
      technologies: ['Flutter Web', '3D Rendering', 'Calculations'],
      icon: Icons.construction,
    ),
    Project(
      title: 'SACCO Management System',
      description:
          'Cross-platform SACCO finance management application replacing manual paper-based systems with secure digital solution.',
      technologies: ['Flutter', 'Firebase', 'Real-time Updates'],
      icon: Icons.account_balance,
    ),
  ];

  // Work Experience
  static const List<Experience> experiences = [
    Experience(
      title: 'Software & App Developer',
      company: 'Coretec Solutions',
      location: 'Westlands, Nairobi',
      startDate: 'May 2024',
      endDate: 'August 2024',
      description:
          '''• Led end-to-end redesign of SACCO application to cross-platform solution using Flutter
• Improved accessibility across Android, iOS, and desktop platforms
• Enhanced UI/UX for better user satisfaction
• Replaced manual SACCO finance management with automated digital solution
• Improved transaction tracking, reporting accuracy, and financial transparency''',
      isWork: true,
    ),
    Experience(
      title: 'Assistant IT Personnel',
      company: 'Rophine Field School',
      location: 'Kamulu, Nairobi',
      startDate: 'May 2023',
      endDate: 'September 2023',
      description: '''• Provided IT support for software and hardware systems
• Assisted in network setup, diagnostics, and system troubleshooting''',
      isWork: true,
    ),
  ];

  // Education
  static const List<Education> education = [
    Education(
      degree: 'Bachelor of Applied Computer Science',
      institution: 'Daystar University',
      location: 'Athi River Campus',
      year: 'Class of 2025',
      icon: Icons.school,
    ),
    Education(
      degree: 'Kenya Certificate of Secondary Education (KCSE)',
      institution: "Mang'u High School",
      location: 'Thika',
      year: 'Class of 2020',
      icon: Icons.school,
    ),
    Education(
      degree: 'Kenya Certificate of Primary Education (KCPE)',
      institution: 'Rophine Group of Schools',
      location: 'Kamulu',
      year: 'Class of 2016',

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
    'Advanced SQL Queries',
    'Machine Learning Fundamentals',
    'Cyber Security',
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
