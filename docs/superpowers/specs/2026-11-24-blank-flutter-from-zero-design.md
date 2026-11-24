# Blank Flutter From Zero Design

## Intent

Create a truly blank Flutter app at `C:\dev\mini_pokemon_from_zero`. Use it as the manual practice project. The user creates every file by hand in VS Code after I explain its purpose and give the code.

## Why

The existing rebuild worktree already contains SQLite, PokéAPI detail code, widgets, and tests. That conflicts with the requested learning method. A blank scaffold removes every prebuilt piece except the Flutter starter files.

## Goals

- New standalone Flutter project made with `flutter create`.
- Fresh local git history. No remote writes.
- Start state: default counter app, default widget test, no added packages.
- No `domain`, `data`, `presentation`, BLoC, HTTP, SQLite, or custom widgets at start.
- Manual loop per file: explain purpose, give complete code, user creates file in VS Code, user saves, I verify.
- Final app must match `C:\dev\mini_pokemon_clean_architecture` behavior for the senior demo.
- Original worktrees stay untouched and serve as answer key.

## Non-goals

- No collect, edit, favorite, delete, or SQLite in the first slice.
- No copying old source files into the blank project.
- No pushing, pulling, merging, or PR.

## Approaches

1. **New folder `C:\dev\mini_pokemon_from_zero`** (chosen). Clean scaffold, clean history, no confusion with existing worktrees.
2. Reset `C:\dev\mini_pokemon_rebuild` in place. Rejected: messy branch history and stale commits.
3. Blank `lib` only inside current worktree. Rejected: not truly blank; old tests and config remain.

## Constraints

- Flutter and Dart commands run in Windows PowerShell, not WSL.
- Local only.
- The existing design file `2026-11-24-guided-recall-rebuild-discover-flow-design.md` still defines final rebuild order and parity rules. This design only replaces the practice starting point.
- Old tests become the oracle again when each slice starts.

## Left to builder after approval

- Run `flutter create` at the target path.
- Open the new folder in VS Code.
- Write the implementation plan for the first file.
