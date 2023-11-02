import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_gallery/app_logic/image_manager.dart';
import 'package:photo_gallery/main.dart';
import 'package:photo_gallery/screens/photo_view_page.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ImagesObject> imagesList = [];
  ImageManager? m_manager = null;

/////// Images Load function
  void loadImages() {
    if (m_manager == null) {
      m_manager = ImageManager.getInstance();
    }
    imagesList.clear();
    print('Loading Images');

    if (m_manager!.m_imageList.isNotEmpty) {
      for (int i = 0; i < m_manager!.m_imageList.length; i++) {
        if (m_manager!.m_imageList[i].isDeleted == false) {
          imagesList.add(ImagesObject(
              imageId: m_manager!.m_imageList[i].m_id,
              imagePath: m_manager!.m_imageList[i].m_imagePath));
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    () async {
      var _permissionStatus = await Permission.storage.status;

      if (_permissionStatus != PermissionStatus.granted) {
        PermissionStatus permissionStatus = await Permission.storage.request();
        setState(() {
          _permissionStatus = permissionStatus;
        });
      }
    }();
    loadImages();
  }

  Future addImages() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    print(MyApp.Tag + 'image name : ' + image.path);

    m_manager!.addImages(image.path);
    setState(() {
      loadImages();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery'),
        actions: [
          IconButton(onPressed: addImages, icon: const Icon(Icons.add)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
        ],
      ),
      // body: GridView.count(
      //   crossAxisCount: 4,
      //   children: imagesList.map((images) {
      //     return Card(
      //       child: Image(
      //         image: AssetImage(images.imagePath),
      //         fit: BoxFit.cover,
      //       ),
      //     );
      //   }).toList(),
      // ),
      body: GridView.builder(
          itemCount: imagesList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4),
          itemBuilder: ((context, index) {
            return InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PhotoViewPage(imagesList[index].imagePath),
                ),
              ),
              onLongPress: () {
                print(MyApp.Tag + 'On long press $index ');
              },
              child: Hero(
                tag: imagesList[index],
                child: Card(
                    child: Image.file(
                  File(imagesList[index].imagePath),
                  width: 100,
                  height: 100,
                  fit: BoxFit.fill,
                )
                    // Image(
                    //     image: AssetImage(
                    //   imagesList[index].imagePath,
                    // )),
                    ),
                //),
              ),
            );
          })),
    );
  }
}

class ImagesObject {
  late int imageId;
  late String imagePath;

  ImagesObject({
    required this.imageId,
    required this.imagePath,
  });
}
