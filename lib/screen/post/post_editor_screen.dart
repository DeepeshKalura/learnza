import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../providers/state/posts/post_editor_sate_provider.dart';
import '../../utils/theme.dart';

class PostEditorScreen extends StatefulWidget {
  const PostEditorScreen({super.key});

  @override
  State<PostEditorScreen> createState() => _PostEditorScreenState();
}

class _PostEditorScreenState extends State<PostEditorScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _submitPost(PostEditorStateProvider provider) {
    if (_formKey.currentState!.validate() && !provider.isLoading) {
      provider.setIsLoading(true);

      provider.createPost(
        title: _titleController.text.trim(),
        description: _contentController.text.trim(),
      );

      if (provider.isPostCreated) {
        provider.isPostCreated = false;
        provider.setIsLoading(false);
        if (mounted) {
          context.pop();
        }
      }
    }
  }

  void _pickImage(PostEditorStateProvider provider) {
    if (!provider.isLoading) {
      provider.pickImage();
    }
  }

  void _resetForm(PostEditorStateProvider provider) {
    _titleController.clear();
    _contentController.clear();
    provider.reset();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Consumer<PostEditorStateProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              localizations?.createPostTitle ?? 'Create Post',
              style: ShadTheme.of(context).textTheme.h3.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            automaticallyImplyLeading: false,
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.close,
                  size: 28,
                ),
                onPressed: () => context.pop(),
              ),
            ],
          ),
          body: Container(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildTitleTextField(provider, context, localizations),
                  const SizedBox(height: 16),
                  _buildContentTextField(provider, context, localizations),
                  const SizedBox(height: 16),
                  _buildImagePickerSection(provider, localizations),
                  const SizedBox(height: 24),
                  _buildActionButtons(provider, context, localizations),
                  if (provider.error != null)
                    _buildErrorMessage(provider, context),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTitleTextField(PostEditorStateProvider provider,
      BuildContext context, AppLocalizations? localizations) {
    return TextFormField(
      controller: _titleController,
      decoration: InputDecoration(
        labelText: localizations?.postTitleLabel ?? 'Post Title',
        hintText: localizations?.postContentHint ?? 'Enter an engaging title',
        prefixIcon: Icon(
          Icons.title,
          color: ShadTheme.of(context).colorScheme.primary,
        ),
        suffixIcon: _titleController.text.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () => _titleController.clear(),
              )
            : null,
        filled: true,
        fillColor: ShadTheme.of(context).colorScheme.accent.withOpacity(0.1),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: ShadTheme.of(context).colorScheme.border,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: ShadTheme.of(context).colorScheme.primary,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: ShadTheme.of(context).colorScheme.destructive,
            width: 1.5,
          ),
        ),
      ),
      style: ShadTheme.of(context).textTheme.p.copyWith(
            fontWeight: FontWeight.w500,
          ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return localizations?.postTitleError ?? 'Please enter a title';
        }
        return null;
      },
      enabled: !provider.isLoading,
    );
  }

  Widget _buildContentTextField(PostEditorStateProvider provider,
      BuildContext context, AppLocalizations? localizations) {
    return TextFormField(
      controller: _contentController,
      decoration: InputDecoration(
        labelText: localizations?.postContentLabel ?? 'Post Content',
        hintText: localizations?.postContentHint ?? 'Share your thoughts...',
        alignLabelWithHint: true,
        prefixIcon: Icon(
          Icons.article,
          color: ShadTheme.of(context).colorScheme.primary,
        ),
        suffixIcon: _contentController.text.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () => _contentController.clear(),
              )
            : null,
        filled: true,
        fillColor: ShadTheme.of(context).colorScheme.accent.withOpacity(0.1),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: ShadTheme.of(context).colorScheme.border,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: ShadTheme.of(context).colorScheme.primary,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: ShadTheme.of(context).colorScheme.destructive,
            width: 1.5,
          ),
        ),
      ),
      maxLines: 6,
      minLines: 4,
      style: ShadTheme.of(context).textTheme.p.copyWith(
            fontWeight: FontWeight.w500,
          ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return localizations?.postContentError ?? 'Please enter post content';
        }
        return null;
      },
      enabled: !provider.isLoading,
    );
  }

  Widget _buildImagePickerSection(
    PostEditorStateProvider provider,
    AppLocalizations? localizations,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (provider.thumbnail != null)
          Stack(
            alignment: Alignment.topRight,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(
                  File(provider.thumbnail!.path),
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white54,
                  child: IconButton(
                    icon: const Icon(
                      Icons.clear,
                      color: Colors.red,
                    ),
                    onPressed: provider.isLoading ? null : provider.clearImage,
                  ),
                ),
              ),
            ],
          ),
        const SizedBox(height: 12),
        ShadButton.outline(
          size: ShadButtonSize.lg,
          onPressed: provider.isLoading ? null : () => _pickImage(provider),
          icon: const Icon(
            Icons.image,
          ),
          child: Text(
            provider.thumbnail != null
                ? localizations?.changeImageButton ?? 'Change Image'
                : localizations?.pickImageButton ?? 'Pick Image',
            style: ShadTheme.of(context).textTheme.large.copyWith(
                  color: ShadTheme.of(context).colorScheme.primary,
                  fontSize: 16,
                ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(PostEditorStateProvider provider,
      BuildContext context, AppLocalizations? localizations) {
    return Row(
      children: [
        Expanded(
          child: ShadButton(
            size: ShadButtonSize.lg,
            onPressed: provider.isLoading ? null : () => _submitPost(provider),
            child: provider.isLoading
                ? CircularProgressIndicator(
                    color: ShadTheme.of(context).colorScheme.background,
                  )
                : Text(
                    localizations?.submitPostButton ?? 'Submit Post',
                    style: ShadTheme.of(context).textTheme.large.copyWith(
                          color: ShadTheme.of(context).colorScheme.background,
                          fontSize: 16,
                        ),
                  ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ShadButton.outline(
            size: ShadButtonSize.lg,
            onPressed: provider.isLoading ? null : () => _resetForm(provider),
            child: Text(
              localizations?.resetButton ?? 'Reset',
              style: ShadTheme.of(context).textTheme.large.copyWith(
                    color: ShadTheme.of(context).colorScheme.primary,
                  ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildErrorMessage(
      PostEditorStateProvider provider, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.red.shade200,
          ),
        ),
        child: Row(
          children: [
            const Icon(Icons.error_outline, color: dangerColor),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                provider.error!,
                style: ShadTheme.of(context).textTheme.p.copyWith(
                      color: Colors.red.shade800,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
