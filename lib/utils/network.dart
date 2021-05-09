import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class Network{
  static final dio=Dio();
  static String url="http://staff.tiiame.uz/storage/users/185/books/ebPBWPQ5ar2bTOIOoheGNO9P9XMfkq95T7uDKHE4.pdf";
  static downloadXXPDF({String? api})async{
   try{
     Uri uri=Uri.parse(Network.url);
     // final file=await getTemporaryDirectory();
     final file=await getExternalStorageDirectory();
     final path="${file!.path}/${Network.url}";
     var result=await dio.downloadUri(uri,path);
     print(path);
     print("tugadi");
     return result.data;
   }on DioError catch(e){
     print("Error:::::${e}");
     return null;
   }
  }
}