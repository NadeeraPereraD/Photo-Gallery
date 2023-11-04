// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_gallery/screens/home_page.dart';

// ignore: must_be_immutable
class SelectImagePage extends StatefulWidget {
  List<ImagesObject> s_imagesList = [];

  SelectImagePage({Key? myKey, required this.s_imagesList}) : super(key: myKey);

  @override
  State<SelectImagePage> createState() => _SelectImagePageState();
}

class _SelectImagePageState extends State<SelectImagePage> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery'),
        actions: [
          const IconButton(onPressed: null, icon: Icon(Icons.add)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
        ],
      ),
      body: GridView.builder(
          itemCount: widget.s_imagesList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4),
          itemBuilder: ((context, index) {
            return InkWell(
              // onTap: () => Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (_) =>
              //             PhotoViewPage(imagesList[index].imagePath),
              //       ),
              //     ),
              onLongPress: () {
                // isLongPressed = true;
              },
              // child: isLongPressed
              //     ? selectImageView(imagesList, index)
              //     : normalImageView(imagesList, index),

              child: Hero(
                tag: widget.s_imagesList[index],
                child: Stack(children: [
                  Card(
                    child: Image.file(
                      File(widget.s_imagesList[index].imagePath),
                      width: 100,
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                    // Image(
                    //     image: AssetImage(
                    //   imagesList[index].imagePath,
                    // )),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Checkbox(
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                  )
                ]),
              ),
            );
          })),
    );
  }
}
