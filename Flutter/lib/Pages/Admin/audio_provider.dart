import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import "../../Api_Services/ApiCall.dart";
typedef void OnError(Exception exception);

class AudioProvider extends StatefulWidget {
  
  final String path;
  final String callDuration;

  AudioProvider(this.path,this.callDuration);

  @override
  _AudioProviderState createState() =>  _AudioProviderState();
}

class _AudioProviderState extends State<AudioProvider>{
	Duration _duration ;
  Duration _position = new Duration();
  AudioPlayer advancedPlayer;
  AudioCache audioCache;
  String currentTime = "00:00";
  String completeTime= "00:00";
  bool isPlaying = false;
  bool isFirst = false;

  @override
  void initState() {
    super.initState();
    _duration = new Duration();
    List<String> s = widget.callDuration.split('.');
    completeTime = s[0]+':'+s[1];
    initPlayer();
  }

  void initPlayer() {
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);

    advancedPlayer.durationHandler = (d) => setState(() {
          _duration = d;
        });

    advancedPlayer.positionHandler = (p) => setState(() {
          _position = p;
        });

    advancedPlayer.onAudioPositionChanged.listen((Duration duration){
      setState(() {
        currentTime = duration.toString().split(".")[0];
        if(currentTime==completeTime){
          isPlaying=false;
        }
      });
    });

    advancedPlayer.onDurationChanged.listen((Duration duration){
      setState(() {
        completeTime = duration.toString().split(".")[0];
      });
    });
  }

  Widget startOrPause(){

    if(isFirst){
      return IconButton(

                  icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow,size : 30.0,),
                  onPressed: (){
                    if(isPlaying){
                      advancedPlayer.pause();

                      setState(() {
                        isPlaying = false;
                      });
                    }else{
                      advancedPlayer.resume();

                      setState(() {
                        isPlaying = true;
                      });
                    }

                  },
                ) ;
    }
    else{
      return IconButton(
      icon : Icon(Icons.play_arrow,size : 30.0,),
      onPressed : ()async{

      	//var json = await ApiCall.getData(widget.path);
      	//print("json = $json");
        isFirst = true;
        isPlaying = true;
        await advancedPlayer.setReleaseMode(ReleaseMode.STOP); 
        await advancedPlayer.play(widget.path);
        
        
        },
    );
    }

    
    
  }


  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);

    advancedPlayer.seek(newDuration);
  }

  Widget aslider()
  {
    return Stack(
      children : <Widget>[
        slider(),
        Positioned(
          right : 10.0,
          top:30.0,
          child : Text(currentTime+" / "+completeTime),
        )
      ],
    );
  }

  Widget slider() {


    return Padding(
    padding : EdgeInsets.only(left : 10.0),
    child : Slider(
        activeColor: Colors.black,
        inactiveColor: Theme.of(context).accentColor,
        value: _position.inSeconds.toDouble(),
        min: 0.0,
        max: _duration.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            seekToSecond(value.toInt());
            value = value;
          });
        }
        ));
  }

  Widget musicRow(){
    return Row(
      children : <Widget>[
        Flexible(
          flex : 1,
          child : startOrPause(),
        ),
        // Flexible(
        //   flex : 1,
        //   child : stop(),
        // ),
        Flexible(
          flex : 9,
          child : aslider(),
        ),
      ],
    );
  }



  @override
  Widget build(BuildContext build){
    print('=== Slider value: ${_position?.inSeconds?.toDouble() ?? 0.0} ===');
    print('=== Max value   : ${_duration?.inSeconds?.toDouble() } ===');
  	return musicRow();
  }

}