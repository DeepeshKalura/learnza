import 'package:flutter/material.dart';

import 'package:flutter_quill/flutter_quill.dart';

class EditBlogStudentScreen extends StatefulWidget {
  const EditBlogStudentScreen({super.key});

  @override
  State<EditBlogStudentScreen> createState() => _EditBlogStudentScreenState();
}

class _EditBlogStudentScreenState extends State<EditBlogStudentScreen> {
  final QuillController _controller = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Hello"),
          QuillSimpleToolbar(
            controller: _controller,
            configurations: const QuillSimpleToolbarConfigurations(),
          ),
          Expanded(
            child: QuillEditor.basic(
              controller: _controller,
              configurations: const QuillEditorConfigurations(),
            ),
          )
        ],
      ),
    );
  }
}
