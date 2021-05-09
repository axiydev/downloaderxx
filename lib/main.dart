import 'package:downloaderxx/utils/network.dart';
import 'package:flutter/material.dart';

void main()=>runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   getDownload()async{
   return await  Network.downloadXXPDF().then((response){
      print(response);
      print("tugadiiiii");
    });
  }

  Stream getdata()async*{
     Future datapdf=getDownload();
      yield datapdf;
  }
  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.red,
       body: Center(
         child: StreamBuilder(
           stream:getdata(),
           builder: (context,snapshot){
             if(snapshot.hasData){
               return Text("success");
             }else{
               return Text("wait...");
             }
           },
         ),
       ),
    );
  }
}

