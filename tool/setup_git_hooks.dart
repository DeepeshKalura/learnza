import 'dart:io';

Future<void> main() async {
  final hookFile = File('.git/hooks/pre-commit');
  await hookFile.parent.create(recursive: true);

  // The hook script
  await hookFile.writeAsString(r'''#!/bin/sh
# 1️⃣ FORMAT staged Dart files
echo "🖋️ Running dart format on staged files..."
if ! git diff --cached --name-only --diff-filter=ACM | grep '\.dart$' | xargs dart format --set-exit-if-changed; then
  echo "❌ dart format found issues. Please run 'dart format .' and re-stage."
  exit 1
fi

# 2️⃣ APPLY auto-fixes
echo "🔧 Applying dart fix --apply..."
dart fix --apply

# 3️⃣ ANALYZE (warnings/errors will be printed but won't abort)
echo "📊 Running flutter analyze (warnings will not block commit)..."
flutter analyze || echo "⚠️ Analysis completed with issues (commit will proceed)."

# 4️⃣ RUN TESTS (failures _will_ block)
echo "🧪 Running flutter test..."
if ! flutter test --coverage; then
  echo "❌ Tests failed. Aborting commit."
  exit 1
fi

echo "✅ Pre-commit checks passed."
exit 0
''');

  // Make it executable (Linux/macOS)
  await Process.run('chmod', ['a+x', hookFile.path]);
}
