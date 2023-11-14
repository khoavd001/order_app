class ImagesApp {
//SVG
  static String homeIcon = ImagesPath.getPath('home_tab_bar.svg');
  static String fastestDelivery = ImagesPath.getPath('fast_delivery.svg');

//JPG
  static String bannerImages1 = ImagesPath.getPath('food_banner1.jpg');
  static String bannerImages2 = ImagesPath.getPath('food_banner2.jpg');

  static String bannerImages3 = ImagesPath.getPath('food_banner3.jpg');

  static String bannerImages4 = ImagesPath.getPath('food_banner4.jpg');
  static String bigBanner = ImagesPath.getPath('big_banner.jpg');
}

extension ImagesPath on ImagesApp {
  static String getPath(String name) {
    if (name.contains('.svg')) {
      return 'assets/svg/$name';
    }
    if (name.contains('.png')) {
      return 'assets/png/$name';
    }
    if (name.contains('.jpg')) {
      return 'assets/jpg/$name';
    }
    if (name.contains('.json')) {
      return 'assets/json/$name';
    }
    if (name.contains('.gif')) {
      return 'assets/gif/$name';
    }
    return 'assets/svg/$name';
  }
}
