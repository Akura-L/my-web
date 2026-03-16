# Portfolio App Development Plan for Akura Louis Alvin

## Information Gathered
- **Name**: Akura Louis Alvin
- **Education**: Bachelor of Applied Computer Science (Daystar University, Class of 2025)
- **Profession**: Full-stack Mobile/Web Developer (Flutter specialist)
- **Skills**: Flutter, Supabase, Firebase, Node.js, MongoDB, REST APIs, SQL, Machine Learning
- **Work Experience**: 
  - Software & App Developer at Coretec Solutions (May-Aug 2024)
  - Assistant IT Personnel at Rophine Field School (May-Sep 2023)
- **Projects**: Real-time bidding system, E-commerce platform, Product scraping/WooCommerce automation, 3D welding tool
- **Referees**: Fredrick Ogore (0717 105 568), Francis Kaigwa (0729 851 927)

## Plan

### Phase 1: Project Setup & Dependencies
1. Update pubspec.yaml with required dependencies (google_fonts, flutter_svg, url_launcher, etc.)
2. Create app theme and color scheme

### Phase 2: Data Models
1. Create models for Profile, Project, Skill, Experience, Education, Reference

### Phase 3: App Structure - Navigation
1. Implement bottom navigation with multiple tabs:
   - Home/Profile
   - Skills
   - Projects
   - Experience
   - Contact

### Phase 4: UI Implementation
1. **Home Screen**: Hero section with name, title, profile image placeholder, and brief intro
2. **Skills Screen**: Grid of technical skills with icons
3. **Projects Screen**: Cards showcasing projects with descriptions and tech stacks
4. **Experience Screen**: Timeline of work experience and education
5. **Contact Screen**: Contact info and referee details

### Phase 5: Refinement
1. Add animations and transitions
2. Polish UI/UX
3. Test and fix issues

## Files to Create/Modify
1. `lib/main.dart` - Main app entry with navigation
2. `lib/theme/app_theme.dart` - Custom theme
3. `lib/data/profile_data.dart` - Static profile data
4. `lib/models/` - Data models
5. `lib/screens/` - All screen widgets
6. `lib/widgets/` - Reusable widgets

## Dependencies to Add
- google_fonts: ^6.1.0
- url_launcher: ^6.2.2
- flutter_svg: ^2.0.9
- percent_indicator: ^4.2.3

## Follow-up Steps
1. Update pubspec.yaml with new dependencies
2. Create theme configuration
3. Implement all screens
4. Build and test the app

