class Article {
  String image;
  String title;
  String description;
  String time;
  String author;
  String category;
  String authorImg;

  Article({
    this.image,
    this.title,
    this.description,
    this.time,
    this.author,
    this.category,
    this.authorImg,
  });
}

final List<Article> forYou = [
  Article(
    category: 'Gamestop',
    title: 'CR7 unlikely to face Barcelona',
    description:
    'Juventus will take on Barcelona in Matchday 2 of their Champions League group next Wednesday, but they\'ll likely be without Cristiano Ronaldo for that match. The Portuguese forward tested positive for COVID-19 during the international break and has tested positive again.',
    time: '30min ago',
    author: 'Sky News',
    image: 'images/greenbull.png',
    authorImg: 'images/greenbull.png',
  ),
  Article(
    category: 'Tesla',
    title: 'JRE on Spotify',
    description:
    'Joe Rogan—America’s most popular podcaster—has officially debuted on Spotify. The longtime comedian and mixed martial arts announcer made “The Joe Rogan Experience” available to Spotify subscribers on Tuesday.',
    time: '2hr ago',
    author: 'Spotify',
    image: 'images/redbear.png',
    authorImg: 'images/deal.png',
  ),
  Article(
    category: 'SoaceOne',
    title: 'Lionel Messi sets new record ',
    description:
    'Lionel Messi became the first player to score in 16 consecutive Champions League seasons as he guided 10-man Barcelona to a 5-1 victory over Hungarian side Ferencvaros in their Group G opener at the Camp Nou on Tuesday.',
    time: '3hr ago',
    author: 'Sky News',
    image: 'images/redbear.png',
    authorImg: 'images/redbear.png',
  ),
];