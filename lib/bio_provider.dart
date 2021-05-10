import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

class BioProvider with ChangeNotifier{
   double progress=0;
   final dio=Dio();
   String url="http://staff.tiiame.uz/storage/users/185/books/ebPBWPQ5ar2bTOIOoheGNO9P9XMfkq95T7uDKHE4.pdf";
   downloadXXPDF({String? api})async{
    try{
      Uri uri=Uri.parse(this.url);
      // final file=await getTemporaryDirectory();
      final file=await getExternalStorageDirectory();
      final path="${file!.path}/${this.url}";
      await dio.downloadUri(uri,
        path,
        onReceiveProgress: (recived,total){
        if(total!=-1){
          var prog=(recived/total)*100;
          showPro(prog);
        }
        }
      );
    }on DioError catch(e){
      print("Error:::::${e}");
    }
  }
  void showPro(double progress){
    this.progress=progress;
    notifyListeners();
  }
  double get getProgress{
    return this.progress;
  }
}
