import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_gallery/app_logic/image_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ImagesList> imagesList = [];

/////// Images Load function
  void loadImages() {
    var manager = ImageManager.getInstance();
    imagesList.clear();

    if (manager.imageGridList.isNotEmpty) {
      for (int i = 0; i < manager.imageGridList.length; i++) {
        imagesList.add(ImagesList(
            imageId: manager.imageGridList[i].id,
            imagePath: manager.imageGridList[i].imagePath));
      }
    }
  }

  @override
  void initState() {
    super.initState();
    loadImages();
  }

  Future addImages() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
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
      body: GridView.count(
        
        crossAxisCount: 3,
        children: imagesList.map((images) {
          return Card(
            child: Image(
              image: AssetImage(images.imagePath),
              fit: BoxFit.cover,
            ),
          );
        }).toList(),
        // Image(
        //   image: AssetImage('assets/image1.png'),
        //   width: 250,
        // ),
      ),
    );
  }
}

class ImagesList {
  late int imageId;
  late String imagePath;

  ImagesList({
    required this.imageId,
    required this.imagePath,
  });
}
