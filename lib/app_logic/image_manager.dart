import 'dart:async';

import 'package:photo_gallery/app_logic/communication_manager.dart';
import 'package:photo_gallery/app_logic/image_grids.dart';
import 'package:photo_gallery/main.dart';

class ImageManager {
  List<MyImage> m_imageList = [];

  static final ImageManager _imageManager = ImageManager._privateConstructor();

  CommunicationManager? m_commManager;

  void handleResult(List<String> results) {
    print(
        MyApp.Tag + 'Image Managet Get Images ' + (results.length).toString());
    for (int i = 0; i < results.length; i++) {
      m_imageList.add(MyImage(results[i]));
    }
  }

  void handleAddImage(String value) {
    m_imageList.add(MyImage(value));
  }

  ImageManager._privateConstructor() {
    m_commManager = CommunicationManager.getInstance();
    handleResult(m_commManager!.getImages());
    // m_commManager!
    //     .getImages()
    //     .then((results) => {
    //           // print(MyApp.Tag + 'Image Managet Get Images ' + (results.length).toString()),
    //           // for (int i = 0; i < results.length; i++)
    //           //   {m_imageList.add(MyImage(results[i]))}
    //           handleResult(results)
    //         })
    //     .catchError(
    //         (onError) => {print(MyApp.Tag + 'error : ' + onError.toString())});

    //m_imageList.add(MyImage(
    //    '/data/user/0/com.example.photo_gallery/cache/d2076091-50c5-4ab2-b818-c016a470c2dd/download (5).jpg'));
    // imageGridList.add(ImageGrids('assets/image2.png'));
    // imageGridList.add(ImageGrids('assets/image3.png'));
    // imageGridList.add(ImageGrids('assets/image4.png'));
    // imageGridList.add(ImageGrids('assets/image5.png'));
    // imageGridList.add(ImageGrids('assets/image6.png'));
  }

  static ImageManager getInstance() {
    return _imageManager;
  }

  void addImages(String imagePath) {
    if(m_commManager!.addImages(imagePath)){
      handleAddImage(imagePath);
    }
    
    // m_commManager!
    //     .addImages(imagePath)
    //     .then((value) => {handleAddImage(imagePath)});
  }

  void deleteImages(List<String> images) {
    m_commManager!.deleteImages(images).then((results) => {
          for (int i = 0; i < results.length; i++)
            {
              for (int j = 0; j < m_imageList.length; j++)
                {
                  if (m_imageList[j].m_imagePath == results[i])
                    {m_imageList[j].isDeleted = true}
                }
            }
        });
  }
}
