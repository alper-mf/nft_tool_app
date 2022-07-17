class HttpUrl {
  static const baseUrl = 'localhost:8080';
  //static const baseUrl = '';

  static const categories = '/categories';
  static const tokenList = '/token';

  //->NFT Id eklemeyi unutma.
  static nftDetail(int nftId) => '/nft_detail';
}
