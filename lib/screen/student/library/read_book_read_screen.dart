import 'package:pdfx/pdfx.dart';

import 'package:flutter/material.dart';
// import 'package:internet_file/internet_file.dart';

import '../../../model/books/books_model.dart';

class ReadBookReadScreen extends StatefulWidget {
  const ReadBookReadScreen({super.key, required this.book});

  final BooksModel book;

  @override
  State<ReadBookReadScreen> createState() => _ReadBookReadScreenState();
}

class _ReadBookReadScreenState extends State<ReadBookReadScreen> {
  PdfController? _pdfController;
  bool loading = false;
  @override
  void initState() {
    super.initState();
    _loadPdf();
  }

  void _loadPdf() {
    setState(() {
      loading = true;
      _pdfController = PdfController(
        document: PdfDocument.openFile(
          widget.book.bookUrl!,
        ),
      );
      loading = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pdfController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book.bookTitle!),
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SizedBox(
              height: MediaQuery.of(context).size.height,
              child: PdfView(
                controller: _pdfController!,
              ),
            ),
    );
  }
}
