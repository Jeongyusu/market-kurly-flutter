class NavigationItem {
  final int id;
  final String label;
  final String icon;
  final String imgUrl;

  NavigationItem(
      {required this.id,
      required this.label,
      required this.icon,
      required this.imgUrl});
}

List<NavigationItem> navigationItem = [
  NavigationItem(
      id: 0,
      label: "홈",
      icon: "assets/icons/home.svg",
      imgUrl: "assets/icons/home_active.svg"),
  NavigationItem(
      id: 1,
      label: "카테고리",
      icon: "assets/icons/category.svg",
      imgUrl: "assets/icons/category_active.svg"),
  NavigationItem(
      id: 2,
      label: "검색",
      icon: "assets/icons/search.svg",
      imgUrl: "assets/icons/search_active.svg"),
  NavigationItem(
      id: 3,
      label: "마이컬리",
      icon: "assets/icons/mykurly.svg",
      imgUrl: "assets/icons/mykurly_active.svg"),
];
