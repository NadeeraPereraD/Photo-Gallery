class ImageGrids {
  late int id;
  late String imagePath;
  static int globalIdNo = 0;

  ImageGrids(this.imagePath) {
    id = globalIdNo + 1;
    globalIdNo++;
  }
}
