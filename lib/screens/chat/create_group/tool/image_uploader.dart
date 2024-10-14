import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class ImageUploader {

  final ImagePicker _picker = ImagePicker();

  Future<File?> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      return File(image.path);
    }
    return null;
  }

  String generateUniqueImageName() {
    var uuid = const Uuid();
    return uuid.v4();  // 使用UUID生成唯一ID
  }

  Future<File?> compressLargeImage(File imageFile, int maxFileSizeKB) async {
    final tempDir = await getTemporaryDirectory();
    String compressedImagePath = '${tempDir.path}/${generateUniqueImageName()}.jpg';

    int quality = 85; // 初始质量
    File? compressedFile;

    while (quality > 0) {
      // 压缩图片
      compressedFile = await FlutterImageCompress.compressAndGetFile(
        imageFile.path,
        compressedImagePath,
        quality: quality,
      );

      // 检查压缩后的文件是否满足大小要求
      if (compressedFile != null && compressedFile.lengthSync() / 1024 <= maxFileSizeKB) {
        return compressedFile; // 如果满足条件，返回压缩后的文件
      }

      // 如果不满足条件，降低质量进行下一次压缩
      quality -= 5; // 每次降低 5 的质量
    }

    return null; // 如果无法压缩到所需大小，返回 null
  }

  Future<Map?> handleImageUpload() async {
    File? image = await pickImage();
    if (image != null) {
      String imageName = generateUniqueImageName();
      File? compressedImage = await compressLargeImage(image, 256);
      if (compressedImage != null) {
        Uint8List result = await getHTTPBodyWithServerImageName(imageName, compressedImage);
        Map? map = await sendImageWithDio(result);
        return map;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  Future<Uint8List> getHTTPBodyWithServerImageName(String imageName, File imageFile) async {
    // 定义拼接的二进制数据
    final data = BytesBuilder();

    // 拼接文件开始的分隔符
    String boundary = "itcast";
    String separator = "--$boundary\r\n";

    // 拼接表单数据
    String contentDisposition = 'Content-Disposition: form-data; name="file"; filename="$imageName.png"\r\n';
    String contentType = 'Content-Type: image/jpeg\r\n\r\n';

    // 将这些字符串转成二进制数据并拼接
    data.add(utf8.encode(separator));
    data.add(utf8.encode(contentDisposition));
    data.add(utf8.encode(contentType));

    // 将文件的二进制数据拼接到请求体中
    data.add(await imageFile.readAsBytes());

    // 文件结束的分隔符
    String endSeparator = '\r\n--$boundary--\r\n';
    data.add(utf8.encode(endSeparator));

    // 返回拼接好的二进制数据
    return data.toBytes();
  }

  Future<Map?> sendImageWithDio(Uint8List body) async {
    Dio dio = Dio();

    // 设置请求头
    dio.options.headers = {
      'Content-Type': 'multipart/form-data; boundary=itcast',
    };

    try {
      // 发送 POST 请求
      final response = await dio.post(
        'https://gateway.x-ct.pro/api/publics/upload',
        data: Stream.fromIterable(body.map((e) => [e])),
        options: Options(
          contentType: 'multipart/form-data; boundary=itcast',
        ),
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
