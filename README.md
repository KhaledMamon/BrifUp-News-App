# BrifUp

News App

## Getting Started
# 📌 Team Workflow & Git Rules

---

# Branch Strategy

## Main Branches

* `main`

    * Stable version only.
    * No direct pushes.

* `develop`

    * Integration branch.
    * All completed features are merged here first.

---

## Feature Branches

Each team member must create a feature branch from `develop`.

Examples:

```text
home
profile
bookmark
```

---

# Before Starting Work

Always update your local project first.

```bash
git checkout develop
git pull origin develop
```

Then switch to your feature branch.

```bash
git checkout feature/your-feature
```

If the branch does not exist yet:

```bash
git checkout -b feature/your-feature
```

---

# While Working

Commit your changes with clear commit messages.

Examples:

```text
Add login screen
Implement register API
Update profile UI
```

---

# Push Your Work

```bash
git add .
git commit -m "Your commit message"
git push origin [folder-name]
```

---

# Pull Request

After finishing your task:

* Create a Pull Request.
* Base branch: `develop`
* Compare branch: `your-folder`

The Team Leader will review the code before merging.

---

# Rules

* ❌ Do NOT push directly to `main`.
* ❌ Do NOT push directly to `develop`.
* ✅ Work only on your feature branch.
* ✅ Always Pull before starting new work.
* ✅ Keep commits small and meaningful.
* ✅ Resolve conflicts before creating a Pull Request.
* ✅ Make sure the project builds successfully before pushing.

---

# Important

If you have any issue with Git, Flutter, or Merge Conflicts, contact the Team Leader before making changes to the main project.


This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
