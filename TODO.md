# Flutter Portfolio App - Error Fixes TODO

## Plan Implementation Steps (Approved)

1. **[ ]** Create TODO.md (current step - done)
2. **[x]** Add `linkedin` field to `lib/data/profile_data.dart`
3. **[x]** Define `tabletBreakpoint` const in `lib/theme/app_theme.dart`
4. **[ ]** Fix `test/widget_test.dart` import path
5. **[x]** Update `lib/main.dart` to use `MainNavigation()` as home
6. **[ ]** Fix `lib/screens/home_screen.dart`:
   - Remove unused imports/code (`dart:io`, `image_picker`, `_profileImage`, `_pickImage`, empty GestureDetector)
   - Add `@override` to `createState()`
   - Add `GoogleFonts.poppins()` to all Text styles
   - Update _HeroSection to use `ProfileData.linkedin`
   - Remove duplicate widgets (`_ProjectCard`, `_RefereeCard`, `_ContactRow`, `_ContactSection`, etc.)
   - Add try-catch to `_launchUrl`
   - Simplify to core sections without redundancy
7. **[ ]** Run `flutter analyze` to verify no linter errors
8. **[ ]** Run `flutter test` to verify tests pass
9. **[ ]** Run `flutter pub get` if needed
10. **[ ]** Test app: `flutter run`
11. **[ ]** attempt_completion once all fixed

**Progress:** Tracking step-by-step. Current: Step 1 complete.


