import 'dart:io';

Future<void> main() async {
  final hookFile = File('.git/hooks/pre-commit');
  // Ensure the hooks directory exists
  await hookFile.parent.create(recursive: true);

  // The guarded hook script
  const hookScript = r'''#!/bin/sh

# 1️⃣ FORMAT staged Dart files (only if any are staged)
staged_dart_files=()
while IFS= read -r -d $'\0' file; do
    staged_dart_files+=("$file")
done < <(git diff --cached --name-only -z --diff-filter=ACM | grep -z '\.dart$')

if [ ${#staged_dart_files[@]} -gt 0 ]; then
  echo "🖋️ Running dart format on staged files..."
  dart format --set-exit-if-changed "${staged_dart_files[@]}"
  if [ $? -ne 0 ]; then
    echo "❌ dart format found issues. Please run 'dart format .' and re-stage."
    exit 1
  fi
else
  echo "ℹ️ No Dart files staged for formatting."
fi


# 2️⃣ APPLY auto-fixes
echo "🔧 Applying dart fix --apply..."
dart fix --apply

# 3️⃣ ANALYZE (warnings/errors will be printed but won't block commit)
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
''';

  // Write the script and make it executable
  await hookFile.writeAsString(hookScript);
  await Process.run('chmod', ['a+x', hookFile.path]);
}
