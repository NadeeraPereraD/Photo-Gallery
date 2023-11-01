import 'package:photo_gallery/app_logic/image_grids.dart';

class ImageManager {
  List<ImageGrids> imageGridList = [];

  static final ImageManager _imageManager = ImageManager._privateConstructor();

  ImageManager._privateConstructor() {
    imageGridList.add(ImageGrids('assets/image1.png'));
    imageGridList.add(ImageGrids('assets/image2.png'));
    imageGridList.add(ImageGrids('assets/image3.png'));
    imageGridList.add(ImageGrids('assets/image4.png'));
    imageGridList.add(ImageGrids('assets/image5.png'));
    imageGridList.add(ImageGrids('assets/image6.png'));
  }

  static ImageManager getInstance() {
    return _imageManager;
  }

  void addImages(String imagePath) {
    imageGridList.add(ImageGrids(imagePath));
  }
}
