import 'package:flutter/material.dart';

class ProfileData {
  static const String linkedin = 'https://github.com/Akura-L';
  static const String github = 'https://github.com/Akura-L';

  // Personal Information
  static const String name = 'Louis Alvin Akura';
  static const String title =
      'Full-Stack Developer | Flutter Mobile Developer | Transportation Technology';
  static const String email = 'akuralouis3@gmail.com';
  static const String phone = '0798 155 454';
  static const String location = 'Nairobi, Kenya';
  static const String summary =
      '''Software developer specializing in cross-platform mobile application development using Flutter and Dart with experience building scalable real-world systems including transportation platforms, financial management systems, and enterprise applications. Skilled in mobile architecture, backend integrations, and multi-role user systems with real-time functionality. Strong focus on performance optimization, clean architecture, and user-centric design to deliver reliable and scalable digital solutions.''';

  // Skills - Updated with new CV skills
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
      name: 'Kotlin',
      icon: Icons.android,
      proficiency: 0.80,
      category: 'Mobile',
    ),
    Skill(
      name: 'Python',
      icon: Icons.code,
      proficiency: 0.75,
      category: 'Languages',
    ),
    Skill(
      name: 'Supabase',
      icon: Icons.storage,
      proficiency: 0.80,
      category: 'Backend',
    ),
    Skill(
      name: 'Firebase',
      icon: Icons.cloud,
      proficiency: 0.85,
      category: 'Backend',
    ),
    Skill(
      name: 'Google Maps API',
      icon: Icons.map,
      proficiency: 0.85,
      category: 'APIs',
    ),
    Skill(
      name: 'Provider',
      icon: Icons.layers,
      proficiency: 0.90,
      category: 'State Mgmt',
    ),
    Skill(
      name: 'REST APIs',
      icon: Icons.api,
      proficiency: 0.90,
      category: 'Backend',
    ),
  ];

  // Projects - Updated with new CV projects
  static const List<Project> projects = [
    Project(
      title: 'TRANSFA – Transportation Management Platform',
      description:
          'Comprehensive Flutter-based transportation system supporting ride booking, fleet management, and multi-role user coordination. Features authentication, Google Maps, in-app chat, and role-based access.',
      technologies: [
        'Flutter',
        'Provider',
        'Go Router',
        'Google Maps API',
        'Shared Preferences',
      ],
      icon: Icons.directions_car,
      github: 'https://github.com/Akura-L/Transfa',
    ),
    Project(
      title: 'SACCO Management System',
      description:
          'Financial management platform for SACCO organizations to manage member transactions and cooperative operations.',
      technologies: ['Flutter', 'Supabase', 'Firebase'],
      icon: Icons.account_balance,
      github: 'https://github.com/Akura-L/Sacco-msacco',
    ),
    Project(
      title: 'SACCO Teller Application',
      description:
          'Teller interface for SACCO cashiers to process financial transactions and serve cooperative members.',
      technologies: ['Flutter', 'REST API'],
      icon: Icons.point_of_sale,
      github: 'https://github.com/Akura-L/sacco-teller',
    ),
    Project(
      title: 'Real-Time Online Bidding System',
      description:
          'Full-stack bidding platform with live updates, authentication, and real-time auction functionality.',
      technologies: ['Flutter', 'Node.js', 'MongoDB', 'WebSocket'],
      icon: Icons.gavel,
    ),
  ];

  // Experiences - Added new ones from CV
  static const List<Experience> experiences = [
    Experience(
      title: 'Mobile App Developer',
      company: 'Ndai Africa',
      location: 'Westlands, Nairobi',
      startDate: 'Jan 2026',
      endDate: 'Present',
      description:
          '''Developing cross-platform mobile applications using Flutter.
Designing responsive UI components optimized for performance and usability.
Integrating backend APIs for real-time data synchronization.
Collaborating with development teams to deliver scalable mobile features.''',
    ),
    Experience(
      title: 'Web Developer',
      company: 'Scotch Extreme',
      location: 'Nairobi',
      startDate: 'Aug 2025',
      endDate: 'Nov 2025',
      description:
          '''Designed and deployed company website improving online visibility.
Developed responsive web interfaces using HTML, CSS, JavaScript.
Implemented communication features connecting customers with services.''',
    ),
    Experience(
      title: 'Software & App Developer',
      company: 'Coretec Solutions',
      location: 'Westlands, Nairobi',
      startDate: 'May 2024',
      endDate: 'Aug 2024',
      description:
          '''Redesigned SACCO financial management system into cross-platform Flutter app.
Transformed single-device system to multi-device platform.
Digitized SACCO processes improving reporting accuracy and efficiency.
Improved usability for administrators and members.''',
    ),
    Experience(
      title: 'Assistant IT Personnel',
      company: 'Rophine Field School',
      location: 'Kamulu',
      startDate: 'May 2023',
      endDate: 'Sep 2023',
      description: '''Provided IT support for hardware, software, networking.
Assisted with troubleshooting, maintenance, configuration.
Helped resolve technical issues for operational efficiency.''',
    ),
  ];

  // Education - Updated with CV
  static const List<Education> education = [
    Education(
      degree: 'Bachelor of Applied Computer Science',
      institution: 'Daystar University',
      location: 'Athi River Campus',
      year: 'Class of 2025',
      icon: Icons.school,
    ),
    Education(
      degree: 'KCSE',
      institution: 'Mang\'u High School',
      year: 'Class of 2020',
      icon: Icons.school,
    ),
    Education(
      degree: 'KCPE',
      institution: 'Rophine Group of Schools',
      year: 'Class of 2016',
      icon: Icons.school,
    ),
  ];

  // Referees - Updated phone numbers
  static const List<Referee> referees = [
    Referee(
      name: 'Fredrick Ogore',
      title: 'Lecturer',
      institution: 'Daystar University',
      phone: '0717 105 568',
    ),
    Referee(
      name: 'Francis Kaigwa',
      title: 'Industrial Supervisor',
      institution: 'Coretec Solutions',
      phone: '0729 851 927',
    ),
  ];

  // Current Learning - Updated
  static const List<String> currentlyLearning = [
    'Cybersecurity',
    'Advanced Software Development',
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
  final String? github;

  const Project({
    required this.title,
    required this.description,
    required this.technologies,
    required this.icon,
    this.github,
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
  final String? location;
  final String year;
  final IconData icon;

  const Education({
    required this.degree,
    required this.institution,
    this.location,
    required this.year,
    required this.icon,
  });
}

class Referee {
  final String name;
  final String title;
  final String institution;
  final String phone;

  const Referee({
    required this.name,
    required this.title,
    required this.institution,
    required this.phone,
  });

  get email => null;
}
