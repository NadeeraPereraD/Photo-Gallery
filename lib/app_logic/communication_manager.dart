import 'dart:convert';
import 'package:http/http.dart';
import 'package:photo_gallery/main.dart';

class CommunicationManager {
  final String getImageListURL = "http://localhost:8080/getImages";
  final String deleteImageListURL = "http://localhost:8080/deleteImages";
  final String addImageURL = "http://localhost:8080/addImage";

  static final CommunicationManager _communicationManager =
      CommunicationManager._privateConstructor();

  CommunicationManager._privateConstructor();

  static CommunicationManager getInstance() {
    return _communicationManager;
  }

  /*Future<bool>*/ bool addImages(String imagePath) /*async*/ {
    print(MyApp.Tag + 'Comm Manager add image ');
    return true;
    // Response res = await post(
    //   Uri.parse(addImageURL),
    //   // headers: <String, String>{
    //   //   'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
    //   // },
    //   body: imagePath,
    // );

    // if (res.statusCode == 200) {
    //   print(MyApp.Tag + 'Comm Manager add image passed ');
    //   return true;
    // } else {
    //   print(MyApp.Tag + 'Comm Manager add image failed ');
    //   return false;
    // }
  }

  /*Future<List<String>>*/List<String> getImages() /*async*/ {
    print(MyApp.Tag + 'Comm Manager get Images ');
    List<String> results = [];
    results.add(
        '/data/user/0/com.example.photo_gallery/cache/ff540320-0505-4f73-9a95-2b17186a8b65/download.jpg');
    return results;
    // Response res = await get(Uri.parse(getImageListURL));

    // if (res.statusCode == 200) {
    //   final obj = jsonDecode(res.body);
    //   //print(obj['stock'][0]['symbol']);
    //   List<String> images = [];

    //   for (int i = 0; i < obj['images'].length; i++) {
    //     images.add(obj['images'][i]);
    //   }

    //   return images;
    // } else {
    //   throw "Unable to retrieve image list.";
    // }
  }

  Future<List<String>> deleteImages(List<String> images) async {
    return images;
    // Response res = await post(
    //   Uri.parse(deleteImageListURL),
    //   headers: <String, String>{
    //     'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
    //   },
    //   body: images[0],
    // );

    // if (res.statusCode == 200) {
    //   final obj = jsonDecode(res.body);
    //   //print(obj['stock'][0]['symbol']);
    //   List<String> images = [];

    //   for (int i = 0; i < obj['images'].length; i++) {
    //     images.add(obj['images'][i]);
    //   }

    //   return images;
    // } else {
    //   throw "Unable to retrieve image list.";
    // }
  }
}
