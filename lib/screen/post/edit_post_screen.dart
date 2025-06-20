// lib/screen/post/edit_post_screen.dart
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learnza/model/posts/posts_model.dart';
import 'package:learnza/providers/post_provider.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class EditPostScreen extends StatefulWidget {
  final PostsModel? post;
  const EditPostScreen({super.key, this.post});

  @override
  State<EditPostScreen> createState() => _EditPostScreenState();
}

class _EditPostScreenState extends State<EditPostScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _contentController;
  XFile? _newThumbnail;
  bool _removeThumbnail = false;

  bool get isEditMode => widget.post != null;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.post?.title ?? '');
    _contentController =
        TextEditingController(text: widget.post?.content ?? '');
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _newThumbnail = image;
        _removeThumbnail = false;
      });
    }
  }

  void _onRemoveImage() {
    setState(() {
      _newThumbnail = null;
      _removeThumbnail = true;
    });
  }

  Future<void> _savePost() async {
    if (_formKey.currentState!.validate()) {
      final provider = context.read<PostProvider>();

      // --- CHANGE 4: Differentiate between creating and updating.
      if (isEditMode) {
        // We are editing an existing post
        await provider.updatePost(
          post: widget.post!, // We know post is not null here
          newTitle: _titleController.text,
          newContent: _contentController.text,
          newThumbnail: _newThumbnail,
          removeThumbnail: _removeThumbnail,
        );
      } else {
        // We are creating a new post
        // NOTE: You will need to implement `createPost` in your PostProvider.
        await provider.createPost(
          title: _titleController.text,
          content: _contentController.text,
          thumbnail: _newThumbnail,
        );
      }

      if (mounted) {
        context.pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PostProvider>();
    return Scaffold(
      // --- CHANGE 5: Make the AppBar title dynamic.
      appBar: AppBar(title: Text(isEditMode ? 'Edit Post' : 'Create Post')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (v) => v!.isEmpty ? 'Title is required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _contentController,
                decoration: const InputDecoration(labelText: 'Content'),
                maxLines: 8,
                validator: (v) => v!.isEmpty ? 'Content is required' : null,
              ),
              const SizedBox(height: 16),
              _buildThumbnailSection(),
              const SizedBox(height: 24),
              ShadButton(
                onPressed: provider.isLoading ? null : _savePost,
                child: provider.isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation(Colors.white)),
                      )
                    // --- CHANGE 6: Make the button text dynamic.
                    : Text(isEditMode ? 'Save Changes' : 'Create Post'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildThumbnailSection() {
    Widget currentImage;
    if (_removeThumbnail) {
      currentImage = const SizedBox.shrink();
    } else if (_newThumbnail != null) {
      currentImage =
          Image.file(File(_newThumbnail!.path), height: 150, fit: BoxFit.cover);
    }
    // --- CHANGE 7: Use null-aware operator to safely access thumbnailUrl.
    else if (widget.post?.thumbnailUrl != null) {
      currentImage = Image.network(widget.post!.thumbnailUrl!,
          height: 150, fit: BoxFit.cover);
    } else {
      currentImage = const SizedBox.shrink();
    }

    // --- CHANGE 8: Simplify logic for button visibility and text.
    final bool hasImage = (_newThumbnail != null ||
        (widget.post?.thumbnailUrl != null && !_removeThumbnail));

    return Column(
      children: [
        if (hasImage)
          ClipRRect(
              borderRadius: BorderRadius.circular(8), child: currentImage),
        if (hasImage) const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              icon: const Icon(Icons.image),
              label: Text(hasImage ? 'Change Image' : 'Add Image'),
              onPressed: _pickImage,
            ),
            if (hasImage)
              TextButton.icon(
                icon: const Icon(Icons.delete, color: Colors.red),
                label: const Text('Remove Image',
                    style: TextStyle(color: Colors.red)),
                onPressed: _onRemoveImage,
              ),
          ],
        ),
      ],
    );
  }
}
