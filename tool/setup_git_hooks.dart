import 'dart:io';

Future<void> main() async {
  final hook = File('.git/hooks/pre-commit');
  await hook.parent.create(recursive: true);
  await hook.writeAsString(r'''
#!/bin/sh
exec dart run dart_pre_commit
''');
  // On Linux (and other non-Windows), make it executable:
  await Process.run('chmod', ['a+x', hook.path]);
}
