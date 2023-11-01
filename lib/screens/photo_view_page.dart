import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_gallery/screens/home_page.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';


// ignore: must_be_immutable
class PhotoViewPage extends StatelessWidget {
  List<ImagesObject> m_imagesList = [];
  int m_index = -1;
  String m_imagePath = '';

  PhotoViewPage(this.m_imagePath);

  @override
  Widget build(BuildContext context) {
    if (m_imagePath == '') {
      return Scaffold();
    }
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: PhotoViewGallery.builder(
        itemCount: 1,
        builder: (context, index) => PhotoViewGalleryPageOptions.customChild(
          child: Card(
            child: Image.file(
                      File(m_imagePath),
                      fit: BoxFit.contain,
                  )
            
            
          ),
          minScale: PhotoViewComputedScale.covered,
          heroAttributes: PhotoViewHeroAttributes(tag: m_imagePath),
        ),
        //pageController: PageController(initialPage: m_index),
        enableRotation: true,
      ),
    );
  }
}
