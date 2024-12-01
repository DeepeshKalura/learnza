import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:image_picker/image_picker.dart';

import '../../../model/posts/posts_model.dart';
import '../../../model/users/users_model.dart';
import '../../../providers/post_provider.dart';
import '../../common/widget/drawer_widget.dart';
import '../menu_widget.dart';
import 'widget/card_post_student_widget.dart';

class PostStudentScreen extends StatefulWidget {
  const PostStudentScreen({super.key});

  @override
  State<PostStudentScreen> createState() => _PostStudentScreenState();
}

class _PostStudentScreenState extends State<PostStudentScreen> {
  final _formKey = GlobalKey<ShadFormState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _contentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scafoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scafoldKey,
      drawer: kIsWeb
          ? null
          : const DrawerWidget(
              currentIndex: 0,
            ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            leading: kIsWeb
                ? const MenuWidget()
                : IconButton(
                    icon: const Icon(LucideIcons.menu),
                    onPressed: () {
                      scafoldKey.currentState!.openDrawer();
                    },
                  ),
            title: const Text('Student Screen'),
            actions: [
              IconButton(
                icon: const Icon(LucideIcons.plus),
                onPressed: () {
                  showShadDialog(
                    context: context,
                    builder: (context) => Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ShadDialog(
                        radius: BorderRadius.circular(10),
                        actionsAxis: Axis.horizontal,
                        title: const Text(
                          'Add Post',
                          textAlign: TextAlign.left,
                        ),
                        actions: [
                          ShadButton.outline(
                            width: 100,
                            child: const Text(
                              'Cancel',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            onPressed: () {
                              context.pop();
                            },
                          ),
                          ShadButton(
                            width: 100,
                            onPressed: _savePost,
                            child: Consumer<PostProvider>(
                              builder: (context, postProvider, child) {
                                return postProvider.isLoading
                                    ? const Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      )
                                    : const Text(
                                        'Post',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      );
                              },
                            ),
                          ),
                        ],
                        child: ShadForm(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ShadInputFormField(
                                id: 'titleOfPost',
                                label: const Text("Title"),
                                placeholder: const Text(
                                  "Write a Title for post here",
                                ),
                                controller: _titleController,
                                validator: (value) => value.isEmpty == true
                                    ? 'Title cannot be empty'
                                    : null,
                              ),
                              const SizedBox(height: 10),
                              ShadInputFormField(
                                label: const Text("Content"),
                                controller: _contentController,
                                placeholder: const Text(
                                  'write a content of the post here',
                                ),
                                maxLines: 7,
                                validator: (value) => value.isEmpty == true
                                    ? 'Content cannot be empty'
                                    : null,
                              ),
                              const SizedBox(height: 10),

                              //  Image Picker Section

                              const Text(
                                'Thumbnail',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Consumer<PostProvider>(
                                  builder: (context, postProvider, child) {
                                final thumbnail = postProvider.thumbnail;

                                return Column(
                                  children: [
                                    if (thumbnail != null) ...[
                                      Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.file(
                                              File(thumbnail.path),
                                              height: 200,
                                              width: double.infinity,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Positioned(
                                            top: 8,
                                            right: 8,
                                            child: GestureDetector(
                                              onTap: () =>
                                                  postProvider.removeImage(),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(4),
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: const Icon(
                                                  Icons.close,
                                                  size: 20,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                    ShadButton.outline(
                                      onPressed: postProvider.pickImage,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Icon(LucideIcons.image),
                                          const SizedBox(width: 8),
                                          Text(
                                            thumbnail == null
                                                ? 'Select Thumbnail'
                                                : 'Change Thumbnail',
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (thumbnail == null) ...[
                                      const SizedBox(height: 8),
                                      Text(
                                        'Recommended size: 1200x1200px',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                    ],
                                  ],
                                );
                              }),
                              const SizedBox(height: 16),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          SliverFillRemaining(
            child: StreamBuilder<Map<PostsModel, UsersModel>>(
              stream:
                  context.read<PostProvider>().getPostsAndUsersWithPagination(
                        20,
                      ),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                Map<PostsModel, UsersModel> data = snapshot.data!;
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final post = data.keys.elementAt(index);
                    final user = data[post]!;
                    return CardPostStudentWidget(post: post, user: user);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget imageWidgetOrNot(XFile thumbnail) {
    if (kIsWeb) {
      return Image.network(
        thumbnail.path,
      );
    } else {
      return Image.file(
        File(
          thumbnail.path,
        ),
      );
    }
  }

  Future<void> _savePost() async {
    final postProvider = context.read<PostProvider>();

    try {
      if (_formKey.currentState!.validate()) {
        await postProvider.createPost(
            title: _titleController.text, content: _contentController.text);

        _titleController.clear();
        _contentController.clear();

        postProvider.isLoading = false;
        postProvider.thumbnail = null;
        if (mounted) {
          ShadToaster.of(context).show(
            const ShadToast(
              backgroundColor: Colors.green,
              description: Text("Post have been post"),
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ShadToaster.of(context).show(
          ShadToast.destructive(
            description: Text(e.toString()),
          ),
        );
      }
    } finally {
      if (mounted) {
        context.pop();
      }
    }
  }
}
