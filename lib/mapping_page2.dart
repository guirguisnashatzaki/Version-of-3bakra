
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newproject/dialog_helper2.dart';
import 'package:newproject/matchclass.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:audioplayers/audioplayers.dart';


class Mapping_Page2 extends StatefulWidget {
  static match matchclass=new match();
  static bool registeed=false;
  @override
  _Mapping_Page2State createState() => _Mapping_Page2State();
}

class _Mapping_Page2State extends State<Mapping_Page2> {

  AudioPlayer audioPlayer = AudioPlayer();
  PlayerState audioPlayerState = PlayerState.PLAYING;
  late AudioCache audioCache;
  String filePath = 'music.mp3';


  List<String> magmoo3a1names=[
    "البصخة","ترينتي"
  ];
  List<String> magmoo3a2names=[
    "او كيثارا انتي دافيد","ابونا عبد المسيح المناهري"
  ];
  List<String> magmoo3a3names=[
    "مارجرجس","البصخة"
  ];
  List<String> magmoo3a4names=[
    "ترينتي","القديس بنديكتوس"
  ];
  List magmoo3a1scores=[];
  List magmoo3a2scores=[];
  List magmoo3a3scores=[];
  List magmoo3a4scores=[];
  List magmoo3a1points=[];
  List magmoo3a2points=[];
  List magmoo3a3points=[];
  List magmoo3a4points=[];

  prefs() async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    //await prefs.clear();
    for(int i=0;i<magmoo3a1names.length;i++){

      if(prefs.getInt(magmoo3a1names[i])==null){
        prefs.setInt(magmoo3a1names[i], 0).then((value){

        });
        setState(() {
          magmoo3a1scores.add(0);
        });

      }else{
        int? score=prefs.getInt(magmoo3a1names[i]);

        setState(() {
          magmoo3a1scores.add(score);
        });

      }
      if(prefs.getInt(magmoo3a1names[i]+"point")==null){
        prefs.setInt(magmoo3a1names[i]+"point", 0).then((value){

        });
        setState(() {
          magmoo3a1points.add(0);
        });

      }else{
        int? score=prefs.getInt(magmoo3a1names[i]+"point");

        setState(() {
          magmoo3a1points.add(score);
        });

      }
    }
    for(int i=0;i<magmoo3a1names.length;i++){
      if(prefs.getInt(magmoo3a2names[i])==null){
        prefs.setInt(magmoo3a2names[i], 0).then((value){

        });
        setState(() {
          magmoo3a2scores.add(0);
        });

      }else{
        int? score=prefs.getInt(magmoo3a2names[i]);

        setState(() {
          magmoo3a2scores.add(score);
        });

      }
      if(prefs.getInt(magmoo3a2names[i]+"point")==null){
        prefs.setInt(magmoo3a2names[i]+"point", 0).then((value){

        });
        setState(() {
          magmoo3a2points.add(0);
        });

      }else{
        int? score=prefs.getInt(magmoo3a2names[i]+"point");

        setState(() {
          magmoo3a2points.add(score);
        });

      }
    }
    for(int i=0;i<magmoo3a3names.length;i++){

      if(prefs.getInt(magmoo3a3names[i])==null){
        prefs.setInt(magmoo3a3names[i], 0).then((value){

        });
        setState(() {
          magmoo3a3scores.add(0);
        });

      }else{
        int? score=prefs.getInt(magmoo3a3names[i]);

        setState(() {
          magmoo3a3scores.add(score);
        });

      }
      if(prefs.getInt(magmoo3a3names[i]+"point")==null){
        prefs.setInt(magmoo3a3names[i]+"point", 0).then((value){

        });
        setState(() {
          magmoo3a3points.add(0);
        });

      }else{
        int? score=prefs.getInt(magmoo3a3names[i]+"point");

        setState(() {
          magmoo3a3points.add(score);
        });

      }
    }
    for(int i=0;i<magmoo3a4names.length;i++){

      if(prefs.getInt(magmoo3a4names[i])==null){
        prefs.setInt(magmoo3a4names[i], 0).then((value){

        });
        setState(() {
          magmoo3a4scores.add(0);
        });

      }else{
        int? score=prefs.getInt(magmoo3a4names[i]);
        setState(() {
          magmoo3a4scores.add(score);
        });

      }
    }

  }



  @override
  void initState() {
    prefs();
    audioPlayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: audioPlayer);
    audioPlayer.onPlayerStateChanged.listen((PlayerState s) {
      setState(() {
        audioPlayerState = s;
      });
    });
    //audioPlayer.play("assets/music.mp3");

    //audioCache.loop("assets/music.mp3");
    // TODO: implement initState
    super.initState();
  }

  /// Compulsory
  @override
  void dispose() {
    audioPlayer.release();
    audioPlayer.dispose();
    audioCache.clearAll();
    super.dispose();
  }

  /// Compulsory
  playMusic() async {
    await audioCache.play(filePath);
  }

  /// Compulsory
  pauseMusic() async {
    await audioPlayer.pause();
  }


  @override
  Widget build(BuildContext context) {
    /*return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: ListView(
        children: [
          Flexible(
            child: Row(
              children: [
                Flexible(child: Magmoo3a(names: magmoo3a1names,scores: magmoo3a1scores,)),
                Flexible(child: Magmoo3a(names: magmoo3a1names,scores: magmoo3a1scores,)),
                Flexible(child: Magmoo3a(names: magmoo3a1names,scores: magmoo3a1scores,)),
                Flexible(child: Magmoo3a(names: magmoo3a1names,scores: magmoo3a1scores,)),
              ],
            ),
          )
        ],
      ),
    );*/

    return RawKeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKey: (event){
        if(event.isKeyPressed(LogicalKeyboardKey.enter)){
          DialogHelper2 object=new DialogHelper2(teams: ["البصخة","ترينتي","او كيثارا انتي دافيد","ابونا عبد المسيح المناهري"]);
          object.exit(context);
        }
      },
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image:AssetImage("assets/background.jpeg"),
                  fit: BoxFit.cover)
          ),
          child: ListView(
                    children: [
                      Center(child: Image.asset("assets/salib.png",width: 200,height: 200,)),
                      GridView.extent(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          SizedBox(),
                          Magmoo3a(names: magmoo3a1names,scores: magmoo3a1scores,points: magmoo3a1points,),
                          Magmoo3a(names: magmoo3a2names,scores: magmoo3a2scores,points: magmoo3a2points,),
                          Magmoo3a(names: magmoo3a3names,scores: magmoo3a3scores,points: magmoo3a3points,),
                          Magmoo3a(names: magmoo3a4names,scores: magmoo3a4scores,points: magmoo3a4points,)
                        ],
                        maxCrossAxisExtent: 300,
                        crossAxisSpacing: 100,
                      ),

                    ],
                  ),
        ),
      ),
    );

  }
}


class Magmoo3a extends StatefulWidget {
  List<String> names;
  List scores,points;

  Magmoo3a({required this.names,required this.scores,required this.points});

  void sort(){
    int temp,temppoint;
    String tempname;
    for(int i=0;i<scores.length;i++){
      for(int j=i;j<scores.length;j++){
        if(points[j]>points[i]){
          temp=scores[i];
          scores[i]=scores[j];
          scores[j]=temp;
          temppoint=points[i];
          points[i]=points[j];
          points[j]=temppoint;
          tempname=names[i];
          names[i]=names[j];
          names[j]=tempname;
        }
      }
    }
  }

  @override
  _Magmoo3aState createState() => _Magmoo3aState();
}

class _Magmoo3aState extends State<Magmoo3a> {

  Color color1=Colors.white,color2=Colors.white,color3=Colors.white,color4=Colors.white;

  @override
    Widget build(BuildContext context) {
      widget.sort();
      return Container(
        width: 500,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                  color: Colors.black,
                  width: 1
              ),
            color: Colors.white
          ),
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.all(10),
          child: Stack(
            children: [
              Positioned(
                  top: 0,
                  left: 20,
                  child: Text("Name",style: TextStyle(fontSize: 20,decoration: TextDecoration.none,color: Colors.black),)
              ),
              Positioned(
                  top: 0,
                  right: 20,
                  child: Text("Score",style: TextStyle(fontSize: 20,decoration: TextDecoration.none,color: Colors.black),)
              ),
              Positioned(
                  top: 0,
                  right: 90,
                  child: Text("Points",style: TextStyle(fontSize: 20,decoration: TextDecoration.none,color: Colors.black),)
              ),
              Positioned(
                  top: 50,
                  right: 90,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Text(
                        widget.points[0].toString(),style: TextStyle(fontSize: 20,decoration: TextDecoration.none,color: Colors.black)
                    ),
                  )
              ),
              Positioned(
                  top: 100,
                  right: 90,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Text(
                        widget.points[1].toString(),style: TextStyle(fontSize: 20,decoration: TextDecoration.none,color: Colors.black)
                    ),
                  )
              ),
              Positioned(
                  top: 150,
                  right: 90,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Text(
                        widget.points[2].toString(),style: TextStyle(fontSize: 20,decoration: TextDecoration.none,color: Colors.black)
                    ),
                  )
              ),
              Positioned(
                  top: 200,
                  right: 90,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Text(
                        widget.points[3].toString(),style: TextStyle(fontSize: 20,decoration: TextDecoration.none,color: Colors.black)
                    ),
                  )
              ),
              Positioned(
                  top: 250,
                  right: 90,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Text(
                        widget.points[4].toString(),style: TextStyle(fontSize: 20,decoration: TextDecoration.none,color: Colors.black)
                    ),
                  )
              ),
              Positioned(
                  top: 50,
                  left: 20,
                  child: Material(
                    child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: color1,
                        ),
                        child: Text(
                            widget.names[0],style: TextStyle(fontSize: 20,decoration: TextDecoration.none,color: Colors.black)
                        ),
                      ),

                  )
              ),
              Positioned(
                  top: 50,
                  right: 20,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Text(
                        widget.scores[0].toString(),style: TextStyle(fontSize: 20,decoration: TextDecoration.none,color: Colors.black)
                    ),
                  )
              ),
              Positioned(
                  top: 100,
                  left: 20,
                  child: Material(
                    child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: color2,
                        ),
                        child: Text(
                            widget.names[1],style: TextStyle(fontSize: 20,decoration: TextDecoration.none,color: Colors.black)
                        ),
                      ),

                  )
              ),
              Positioned(
                  top: 100,
                  right: 20,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Text(
                        widget.scores[1].toString(),style: TextStyle(fontSize: 20,decoration: TextDecoration.none,color: Colors.black)
                    ),
                  )
              ),
              Positioned(
                  top: 150,
                  left: 20,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: color3,
                    ),
                    child: Text(
                        widget.names[2],style: TextStyle(fontSize: 20,decoration: TextDecoration.none,color: Colors.black)
                    ),
                  )
              ),
              Positioned(
                  top: 150,
                  right: 20,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Text(
                        widget.scores[2].toString(),style: TextStyle(fontSize: 20,decoration: TextDecoration.none,color: Colors.black)
                    ),
                  )
              ),
              Positioned(
                  top: 200,
                  left: 20,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Text(
                        widget.names[3],style: TextStyle(fontSize: 20,decoration: TextDecoration.none,color: Colors.black)
                    ),
                  )
              ),
              Positioned(
                  top: 200,
                  right: 20,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Text(
                        widget.scores[3].toString(),style: TextStyle(fontSize: 20,decoration: TextDecoration.none,color: Colors.black)
                    ),
                  )
              ),
              Positioned(
                  top: 250,
                  left: 20,
                  child: Material(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: color1,
                      ),
                      child: Text(
                          widget.names[4],style: TextStyle(fontSize: 20,decoration: TextDecoration.none,color: Colors.black)
                      ),
                    ),

                  )
              ),
              Positioned(
                  top: 250,
                  right: 20,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Text(
                        widget.scores[4].toString(),style: TextStyle(fontSize: 20,decoration: TextDecoration.none,color: Colors.black)
                    ),
                  )
              ),
              Positioned(
                bottom: 0,
                right: 150,
                child: new MaterialButton(
                    onPressed: (){
                      DialogHelper2 object=new DialogHelper2(teams: widget.names);
                      object.exit(context);
                    },
                    color: Colors.black,
                    child: Text("ابدأ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
                ),
              )
            ],
          )
      );
    }

}




