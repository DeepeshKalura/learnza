// In future i will tries to give a way to write blog

// import 'package:flutter/material.dart';
// import 'package:flutter_quill/flutter_quill.dart' as quill;
// import 'package:go_router/go_router.dart';
// import 'package:provider/provider.dart';
// import 'package:shadcn_ui/shadcn_ui.dart';

// import '../../providers/post_provider.dart';

// class EditBlogStudentScreen extends StatefulWidget {
//   const EditBlogStudentScreen({super.key});

//   @override
//   State<EditBlogStudentScreen> createState() => _EditBlogStudentScreenState();
// }

// class _EditBlogStudentScreenState extends State<EditBlogStudentScreen> {
//   var isLoading = false;
//   final quill.QuillController _controller = quill.QuillController.basic();

//   final TextEditingController _titleController = TextEditingController();
//   bool isHeadingMode = false;

//   final _scrollController = ScrollController();
//   final _focusNode = FocusNode();

//   @override
//   void initState() {
//     super.initState();
//     _controller.addListener(_onTextChanged);

//     _controller.readOnly = false;
//   }

//   void _onTextChanged() {
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(LucideIcons.x),
//           onPressed: () {
//             if (_controller.document.isEmpty()) {
//               context.pop();
//             } else {
//               ShadDialog(
//                 title: const Text('Discard changes?'),
//                 description: const Text(
//                   'Are you sure you want to discard the changes?',
//                 ),
//                 actions: [
//                   TextButton(
//                     onPressed: () {
//                       context.pop();
//                     },
//                     child: const Text('Cancel'),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       context.pop();
//                       context.pop();
//                     },
//                     child: const Text('Discard'),
//                   ),
//                 ],
//               );
//             }
//           },
//         ),
//         actions: [
//           if (isLoading)
//             const Center(child: CircularProgressIndicator())
//           else
//             IconButton(
//               icon: const Icon(LucideIcons.save),
//               onPressed: _saveBlogPost,
//             ),
//         ],
//       ),
//       body: Column(
//         children: [
//           quill.QuillSimpleToolbar(
//             controller: _controller,
//             configurations: const quill.QuillSimpleToolbarConfigurations(),
//           ),
//           quill.QuillEditor.basic(
//             controller: _controller,
//             configurations: const quill.QuillEditorConfigurations(
//               placeholder: "Hint...",
//               autoFocus: false,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> _saveBlogPost() async {
//     if (_titleController.text.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please enter a title')),
//       );
//       return;
//     }

//     setState(() => isLoading = true);

//     try {
//       final content = _controller.document.toDelta().toJson();
//       final contentString = content.toString();

//       print(contentString);

//       // Get the provider instance
//       final blogProvider = context.read<PostProvider>();

//       // Create new blog post
//       blogProvider.createPost(
//         _titleController.text,
//         contentString,
//       );

//       // Show success message
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Blog post saved successfully!')),
//       );

//       // Navigate back
//       Navigator.pop(context);
//     } catch (e) {
//       ShadAlert(
//           iconSrc: LucideIcons.terminal,
//           title: const Text('Heads up!'),
//           description: Text('Error saving blog post: $e'));
//     } finally {
//       setState(() => isLoading = false);
//     }
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }
