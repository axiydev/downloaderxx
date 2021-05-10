import 'package:downloaderxx/bio_provider.dart';
import 'package:downloaderxx/utils/network.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main()=>runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BioProvider>(
        create: (context)=>BioProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.blue,
       body: Consumer<BioProvider>(
         builder: (context,value,child)=>Center(
           child:Center(
             child:Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 TextButton(
                     onPressed: ()async{
                       await value.downloadXXPDF();
                     },
                     child:Text("Download",style: TextStyle(color: Colors.orange),),
                 ),
                 Text("${value.getProgress}%")
               ],
             )
           ),
         ),
       ),
    );
  }
}

