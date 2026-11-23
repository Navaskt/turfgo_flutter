enum TurfFilter {
  all('All turfs'),
  fiveASide('5-a-side'),
  sevenASide('7-a-side'),
  elevenASide('11-a-side'),
  astroturf4g('4G astroturf'),
  fifaNatural('FIFA pro natural');

  const TurfFilter(this.label);

  final String label;
}
