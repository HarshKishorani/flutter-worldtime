import 'package:flutter/material.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    // Data from loading is delivered in this build function (Navigator arguments) and can be extracted as map as below (ModalRoute)
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    //Background Color and Image
    Color bgColor = data['isDaytime'] ? Color(0xff034A73) : Color(0xff203139);
    String bgImage = data['isDaytime'] ? 'day (1).jpg' : 'night.jpg';

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,120,0,0),
            child: Column(
              children: [
                FlatButton.icon(
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      if(result!=null) {
                        setState(() {
                          data = {
                            'time': result['time'],
                            'location': result['location'],
                            'isDaytime': result['isDaytime'],
                            'flag': result['flag']
                          };
                        });
                      }
                      },
                    icon: Icon(Icons.edit_location, color: Colors.grey[300],),
                    label: Text('Edit Location',style: TextStyle(color: Colors.grey[300]),)),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(fontSize: 28, letterSpacing: 2.0,color: Colors.white),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Text(
                  data['time'],
                  style: TextStyle(fontSize: 66.0,color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
