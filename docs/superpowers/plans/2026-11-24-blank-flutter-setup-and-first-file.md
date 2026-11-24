# Blank Flutter Setup and First File Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Create a truly blank Flutter app at `C:\dev\mini_pokemon_from_zero` and manually add the first domain file, `pokemon_summary.dart`.

**Architecture:** Standalone Flutter scaffold with no added packages and no inherited source. The first file is a plain immutable domain entity. The user creates every product file by hand in VS Code after receiving purpose and complete code.

**Tech Stack:** Flutter, Dart.

**Spec:** `docs/superpowers/specs/2026-11-24-blank-flutter-from-zero-design.md`

## Global Constraints

- Target path: `C:\dev\mini_pokemon_from_zero`.
- Flutter and Dart commands run in Windows PowerShell, not WSL.
- Local only. No push, pull, merge, PR, or remote write.
- Do not copy source files from any existing worktree.
- Start state: `flutter create` default counter app and default `test/widget_test.dart`.
- No added packages, no `domain`, `data`, or `presentation` folders before Task 2.
- Manual loop: assistant explains purpose, gives complete code, user creates and saves the file, assistant verifies.
- Final app must still match `C:\dev\mini_pokemon_clean_architecture` behavior for the demo.

## Review Focus

- Blank start must have no `domain`, `data`, or `presentation` folders. Task 1 checks folder list.
- Default scaffold test must pass before manual work. Task 1 runs it.
- Exact file path must be `lib/domain/entities/pokemon_summary.dart`. Task 2 has user create that path.
- Exact public shape: two `final String` fields and one `const` constructor. Task 2 gives the complete code.
- No forbidden imports: `package:flutter`, `dart:io`, `package:http`. Task 2 runs analyzer.

---

### Task 1: Blank scaffold and VS Code setup

**Files:**
- Create: `C:\dev\mini_pokemon_from_zero`
- Copy: design doc and this plan into the new project's `docs/superpowers/` paths

**Interfaces:**
- Consumes: Flutter SDK only.
- Produces: blank Flutter app open in VS Code, ready for manual file creation.

- [ ] **Step 1: Create the project**

Run in Windows PowerShell:

```powershell
flutter create C:\dev\mini_pokemon_from_zero
```

Expected: new Flutter project with default counter app.

- [ ] **Step 2: Verify blank state**

Run:

```powershell
Set-Location 'C:\dev\mini_pokemon_from_zero'
Get-ChildItem lib
Get-ChildItem test
```

Expected: `lib` contains only scaffold files. No `domain`, `data`, or `presentation` folders. `test` contains default `widget_test.dart`.

- [ ] **Step 3: Run baseline test**

Run:

```powershell
flutter test
```

Expected: default scaffold test passes.

- [ ] **Step 4: Copy docs and commit**

Copy the design doc and this plan into matching `docs/superpowers/specs/` and `docs/superpowers/plans/` paths in the new project. Commit locally. No remote write.

- [ ] **Step 5: Open in VS Code**

Open `C:\dev\mini_pokemon_from_zero` in VS Code. Confirm window title shows `mini_pokemon_from_zero`.

---

### Task 2: First manual file, `pokemon_summary.dart`

**Files:**
- Create: `lib/domain/entities/pokemon_summary.dart`

**Interfaces:**
- Consumes: nothing.
- Produces: `PokemonSummary({required String name, required String url})` for later DTO and BLoC files.

**Workflow note:** TDD ordering is waived for this single setup file. The user asked for manual creation first. The gate is analyzer plus existing scaffold test. Later files return to test-first slices.

- [ ] **Step 1: Explain purpose**

Assistant gives the short purpose explanation for this file. No other file is explained in this task.

- [ ] **Step 2: Give complete code**

Assistant gives the full `pokemon_summary.dart` code block. User creates the file at the exact path and pastes it.

- [ ] **Step 3: User saves and reports**

User says `saved`. Do not run checks before that.

- [ ] **Step 4: Verify**

Run in Windows PowerShell:

```powershell
Set-Location 'C:\dev\mini_pokemon_from_zero'
dart analyze lib/domain/entities/pokemon_summary.dart
flutter test
```

Expected: analyzer reports no issues. Default scaffold test passes. File contains no forbidden imports.

- [ ] **Step 5: Commit**

```bash
git add lib/domain/entities/pokemon_summary.dart
git commit -m "feat: add pokemon summary entity"
```
