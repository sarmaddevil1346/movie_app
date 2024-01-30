class LibraryModels {
  String title;
  String imagePath;

  LibraryModels({required this.title, required this.imagePath});
}

List<LibraryModels> getLibraryModels = [
  LibraryModels(
    title: "Favourite Movies",
    imagePath: "assets/images/Favorite_Songs.png",
  ),
  LibraryModels(
    title: "History",
    imagePath: "assets/images/Listening_History.png",
  ),
  LibraryModels(
    title: "Downloaded",
    imagePath: "assets/images/Downloaded.png",
  ),
  LibraryModels(
    title: "About Us",
    imagePath: "assets/images/Vector.png",
  ),
  LibraryModels(
    title: "Privacy Policy",
    imagePath: "assets/images/lock.png",
  ),
];
