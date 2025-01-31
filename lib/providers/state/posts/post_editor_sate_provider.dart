import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learnza/locator/injector.dart' as di;

import '../../model/post_provider.dart';

class PostEditorStateProvider extends ChangeNotifier {
  // State variables
  bool isLoading = false;
  bool isPostCreated = false;
  String? error;
  XFile? thumbnail;

  // Method to clear image
  void clearImage() {
    thumbnail = null;
    notifyListeners();
  }

  Future<void> pickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1200,
        maxHeight: 1200,
        imageQuality: 85,
      );

      thumbnail = image;
    } catch (e, s) {
      developer.log('Error picking image:', error: e, stackTrace: s);
      error = e.toString();
    } finally {
      notifyListeners();
    }
  }
  // Create post

  Future<void> createPost(
      {required String title, required String description}) async {
    isLoading = true;
    notifyListeners();

    try {
      await di.injector<PostProvider>().createPost(
            title: title,
            description: description,
            thumbnail: thumbnail,
          );
      isPostCreated = true;
    } catch (e, s) {
      error = e.toString();
      developer.log(
        'Error creating post:',
        error: e,
        stackTrace: s,
      );
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // Method to reset state
  void reset() {
    isLoading = false;
    isPostCreated = false;
    error = null;
    thumbnail = null;
    notifyListeners();
  }

  // Cleanup
  @override
  void dispose() {
    reset();
    super.dispose();
  }
}
