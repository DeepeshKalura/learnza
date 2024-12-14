// Flutter imports:
import 'dart:developer';

import 'package:flutter/material.dart';

// Package imports:

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:go_router/go_router.dart';

import '../../../model/books/books_model.dart';
import '../../../router/app_urls.dart';

class AnnaWebViewScreen extends StatefulWidget {
  const AnnaWebViewScreen({
    super.key,
    required this.url,
    required this.book,
  });
  final String url;
  final BooksModel book;

  @override
  State<AnnaWebViewScreen> createState() => _AnnaWebViewScreenState();
}

class _AnnaWebViewScreenState extends State<AnnaWebViewScreen> {
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;

  final urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Solve Captcha"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: [
                InAppWebView(
                  key: webViewKey,
                  initialUrlRequest: URLRequest(url: WebUri(widget.url)),
                  onWebViewCreated: (controller) {
                    webViewController = controller;
                  },
                  onLoadStart: (controller, url) {},
                  onLoadStop: (controller, url) async {
                    // JavaScript to extract the download link
                    String query = """
                        var downloadElement = document.querySelector('p.mb-4.text-xl.font-bold a');
                        if (downloadElement) {
                            downloadElement.href;
                         } else {
                            null;
                          } 
                      """;

                    String? downloadLink = await webViewController
                        ?.evaluateJavascript(source: query);

                    if (downloadLink != null && downloadLink.isNotEmpty) {
                      log("Download link: $downloadLink");

                      Future.delayed(const Duration(milliseconds: 40), () {
                        context.pushReplacementNamed(AppUrls.downloadBookScreen,
                            extra: {
                              'bookUrl': downloadLink,
                              'book': widget.book,
                            });
                      });
                    } else {
                      debugPrint("Download link not found.");
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
