final List<Event> events = [
  Event(
      'https://ikzttp.mypinata.cloud/ipfs/QmYDvPAXtiJg7s8JdRBSLWdgSphQdac8j1YuQNNxcGE1hg/7882.png',
      'Shenzhen GLOBAL DESIGN AWARD 2018',
      '4.20-30'),
  Event(
      'https://ikzttp.mypinata.cloud/ipfs/QmYDvPAXtiJg7s8JdRBSLWdgSphQdac8j1YuQNNxcGE1hg/8257.png',
      'Shenzhen GLOBAL DESIGN AWARD 2018',
      '4.20-30'),
  Event(
      'https://ikzttp.mypinata.cloud/ipfs/QmYDvPAXtiJg7s8JdRBSLWdgSphQdac8j1YuQNNxcGE1hg/9275.png',
      'Dawan District Guangdong Hong Kong',
      '4.28-31'),
  Event(
      'https://ikzttp.mypinata.cloud/ipfs/QmYDvPAXtiJg7s8JdRBSLWdgSphQdac8j1YuQNNxcGE1hg/2822.png',
      'Dawan District Guangdong Hong Kong',
      '4.28-31'),
];

class Event {
  final String assetName;
  final String title;
  final String date;

  Event(this.assetName, this.title, this.date);
}
