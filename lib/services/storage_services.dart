
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_luban/flutter_luban.dart';
// import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class StorageSevice
{
  static final storageRef = FirebaseStorage.instance.ref();
  static Future<String> uploadProfileImg(String url,File imgFile)
  async{
    String photoId = Uuid().v4();
    // File image = await compressImgFile(photoId, imgFile);
    File image = imgFile;
    if(url.isNotEmpty)
    {
      RegExp exp = RegExp(r'userProfile_(.*).jpg');
      photoId = exp.firstMatch(url)[1];
      print(photoId);
    }
    StorageUploadTask uploadTask = storageRef
    .child('images/users/userProfile_$photoId.jpg')
    .putFile(image);
    StorageTaskSnapshot storageSnap = await uploadTask.onComplete;
    String downloadImgUrl = await storageSnap.ref.getDownloadURL();
    return downloadImgUrl;

  }


static Future<File> compressImgFile(String photoId,File imgFile)
async{
  final tempDir = await getTemporaryDirectory();
  File img;
  final path = tempDir.path;
  CompressObject compressObject = CompressObject(
         imageFile:imgFile, //image
         path:'$path/img_$photoId.jpg', //compress to path
         quality: 85,//first compress quality, default 80
         step: 9,//compress quality step, The bigger the fast, Smaller is more accurate, default 6
         mode: CompressMode.LARGE2SMALL,//default AUTO
       );
    Luban.compressImage(compressObject).then((_path) {
        
           img= compressObject.imageFile;
           
       
    });
  return img;

}
}
