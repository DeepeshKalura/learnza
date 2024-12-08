import 'dart:developer' as developer;

import 'package:html/parser.dart' show parse;

import 'package:http/http.dart' as http;

import '../model/books/books_model.dart';

class AnnasArchieveService {
  static const String baseUrl = "https://annas-archive.org";

  Map<String, String> defaultHttpHeader = {
    "user-agent":
        "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36",
  };

  String getMd5(String url) {
    String md5 = url.toString().split('/').last;
    return md5;
  }

  Future<List<BooksModel>> _parser(resData, String fileType) async {
    var document =
        parse(resData.toString().replaceAll(RegExp(r"<!--|-->"), ''));
    var books = document.querySelectorAll('a');

    List<BooksModel> bookList = [];

    for (var element in books) {
      var data = {
        'title': element.querySelector('h3')?.text,
        'thumbnail': element.querySelector('img')?.attributes['src'],
        'link': element.attributes['href'],
        'author': element
                .querySelector(
                    'div[class="max-lg:line-clamp-[2] lg:truncate leading-[1.2] lg:leading-[1.35] max-lg:text-sm italic"]')
                ?.text ??
            'unknown',
        'publisher': element
                .querySelector(
                    'div[class="truncate leading-[1.2] lg:leading-[1.35] max-lg:text-xs"]')
                ?.text ??
            "unknown",
        'info': element
                .querySelector(
                    'div[class="line-clamp-[2] leading-[1.2] text-[10px] lg:text-xs text-gray-500"]')
                ?.text ??
            '',
        'description': element
                .querySelector('div[class="mb-1"]')
                ?.text
                .replaceFirst("description", '') ??
            " "
      };

      if ((data['title'] != null && data['title'] != '') &&
          (data['link'] != null && data['link'] != '') &&
          (data['info'] != null &&
              ((fileType == "") &&
                      (data['info']!.contains('pdf') ||
                          data['info']!.contains('epub') ||
                          data['info']!.contains('cbr') ||
                          data['info']!.contains('cbz')) ||
                  ((fileType != "") && data['info']!.contains(fileType))))) {
        String link = baseUrl + data['link']!;
        String publisher = ((data['publisher']?.contains('0') == true &&
                        data['publisher']!.length < 2) ||
                    data['publisher'] == "") ==
                true
            ? "unknown"
            : data['publisher'].toString();

        developer.log('Found book: $link');

        BooksModel book = BooksModel(
          id: getMd5(data['link'].toString()),
          bookTitle: data['title'].toString(),
          author: data['author']?.split(","),
          thumbnail: data['thumbnail'],
          bookUrl: link,
          publisher: publisher,
          language: 'en',
          isActive: true,
          founded: true,
          createdAt: DateTime.now(),
          description: data['info'],
        );
        bookList.add(book);
      }
    }
    return bookList;
  }

  String getFormat(String info) {
    if (info.contains('pdf') == true) {
      return 'pdf';
    } else {
      if (info.contains('cbr')) return "cbr";
      if (info.contains('cbz')) return "cbz";
      return "epub";
    }
  }

  String urlEncoder(
      {required String searchQuery,
      required String content,
      required String sort,
      required String fileType,
      required bool enableFilters}) {
    searchQuery = searchQuery.replaceAll(" ", "+");
    if (enableFilters == false) return '$baseUrl/search?q=$searchQuery';
    if (content == "" && sort == "" && fileType == "") {
      return '$baseUrl/search?q=$searchQuery';
    }
    return '$baseUrl/search?index=&q=$searchQuery&content=$content&ext=$fileType&sort=$sort';
  }

  Future<List<BooksModel>> searchBooks(
      {required String searchQuery,
      String content = "",
      String sort = "",
      String fileType = "pdf",
      bool enableFilters = true}) async {
    try {
      final String encodedURL = urlEncoder(
        searchQuery: searchQuery,
        content: content,
        sort: sort,
        fileType: fileType,
        enableFilters: enableFilters,
      );

      final response =
          await http.get(Uri.parse(encodedURL), headers: defaultHttpHeader);

      if (!enableFilters) {
        return _parser(response.body, "");
      }
      return _parser(response.body, fileType);
    } catch (e, s) {
      developer.log(e.toString());
      developer.log(s.toString());
      rethrow;
    }
  }

  Future<String?> getDownloadUrl(url) async {
    try {
      var resData = await http.get(Uri.parse(url), headers: defaultHttpHeader);
      var document = parse(resData.body.toString());
      var main = document.querySelector('main[class="main"]');

      developer.log("List of main $main", error: main);

      var ul = main?.querySelectorAll('ul[class="list-inside mb-4 ml-1"]');

      developer.log("List of ul", error: ul);

      String? mirror;
      var anchorTags = [];

      if (ul != null) {
        for (var e in ul) {
          anchorTags.insertAll(0, e.querySelectorAll('a'));

          developer.log("List of anchorTags", error: anchorTags);
        }
      }

      for (var element in anchorTags) {
        if (element.attributes['href'] != null &&
            element.attributes['href']!.startsWith('/slow_download') &&
            element.attributes['href']!.endsWith('/2')) {
          mirror = '$baseUrl${element.attributes['href']}';
        }
      }

      developer.log('Found mirror: $mirror');
      return mirror;
    } catch (e, s) {
      developer.log(e.toString());
      developer.log(s.toString());
      rethrow;
    }
  }
}
