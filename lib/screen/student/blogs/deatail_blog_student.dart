import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:intl/intl.dart';
import '../../../model/posts/posts_model.dart';

class DetailBlogStudentScreen extends StatefulWidget {
  const DetailBlogStudentScreen({super.key, required this.post});
  final PostsModel post;

  @override
  State<DetailBlogStudentScreen> createState() =>
      _DetailBlogStudentScreenState();
}

class _DetailBlogStudentScreenState extends State<DetailBlogStudentScreen> {
  late QuillController _controller;

  @override
  void initState() {
    super.initState();
    _initQuillController();
  }

  void _initQuillController() {
    try {
      // Parse the content from string to Delta
      final contentJson = jsonDecode(widget.post.content);
      final document = Document.fromJson(contentJson);
      _controller = QuillController(
        document: document,
        selection: const TextSelection.collapsed(offset: 0),
      );
    } catch (e) {
      // Fallback if parsing fails
      _controller = QuillController.basic();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Custom App Bar
          SliverAppBar(
            expandedHeight: 120,
            floating: true,
            pinned: true,
            elevation: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 16,
                ),
                alignment: Alignment.bottomLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.post.title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 12,
                          child: Icon(Icons.person, size: 16),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          widget.post.authorId,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Icon(
                          Icons.access_time,
                          size: 16,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          DateFormat('MMM d, yyyy').format(
                            DateTime.parse(widget.post.createdAt.toString()),
                          ),
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Blog Content
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: QuillEditor.basic(
                    controller: _controller,
                    configurations: const QuillEditorConfigurations(
                      checkBoxReadOnly: true,
                      showCursor: false,
                      padding: EdgeInsets.all(16),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Bottom Padding
          const SliverPadding(padding: EdgeInsets.only(bottom: 32)),
        ],
      ),
      // Optional: Add a floating action button for actions like share, bookmark, etc.
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement share functionality
          // Share.share('Check out this blog post: ${widget.post.title}');
        },
        child: const Icon(Icons.share),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
