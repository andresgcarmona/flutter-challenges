import 'package:hackernews_app/src/article.dart';
import 'dart:convert';

List<int> parseTopStories(String jsonStr) {
  final parsed = json.decode(jsonStr);
  final ids = List<int>.from(parsed);

  return ids;
}

Article parseArticle(String jsonStr) {
  final parsed = json.decode(jsonStr);

  Article article = Article.fromJson(parsed);

  return article;
}
