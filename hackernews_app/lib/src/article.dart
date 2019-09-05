class Article {
  final String title;
  final String url;
  final String by;
  final String id;
  final int score;
  final int time;
  final String type;

  const Article({
    this.title,
    this.url,
    this.by,
    this.id,
    this.score,
    this.time,
    this.type,
  });
}

final articles = [
  new Article(
      by: 'dhouston',
      id: '8863',
      score: 104,
      time: 1175714200,
      title: 'My YC app: Dropbox - Throw away your USB drive',
      type: 'story',
      url: 'http://www.getdropbox.com/u/2/screencast.html'),
];
