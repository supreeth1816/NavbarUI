import 'package:flutter/material.dart';


void main(){
  runApp(MyApp());
}


double animatedHeight = 0.0;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavBar(),

      routes: {
        '/nav' : (context) => NavBar(),
        
      }
    );
  }
}



class NavBar extends StatefulWidget {

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    return Stack(

      children: [
        Container(
          //home customised
          color: Colors.grey.shade200,
        ),

        AnimatedContainer(
          width: double.infinity,
          margin: EdgeInsets.only(top: 80),
          duration: Duration(
          milliseconds: 375,
        ),
          curve: Curves.easeIn,
          color: Color(0xff3a3a3a),
          height: (width < 800) ? animatedHeight : 0.0,



          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("NavBarItem1"),
              ],
            ),
          ),
        ),

        Container(
          height: 80,
          width: double.infinity,
          color: Colors.deepPurple,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text("LOGO"),



              LayoutBuilder(builder: (context, constraints){
                if(width < 800){
                  return NavBarButton(
                    onPressed: (){
                     if(animatedHeight == 0.0){
                       setState(() {
                         animatedHeight = 240.0;
                       });
                     }
                     else if(animatedHeight == 240.0){
                       setState(() {
                         animatedHeight = 0.0;
                       });
                     }
                    },
                  );

                }
                else{
                  return Row(
                    children: [
                      Text("Hi"),
                    ],
                  );
                }
              }),

            ],
          )


        ),

      ],
    );
  }
}


class NavBarButton extends StatefulWidget {
  final Function onPressed;

  NavBarButton({
    this.onPressed,
  });

  @override
  _NavBarButtonState createState() => _NavBarButtonState();
}

class _NavBarButtonState extends State<NavBarButton> {
  Widget build(BuildContext context) {
    return Container(
      height: 55.0,
      width: 60.0,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xcfffffff),
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Material(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: InkWell(
          splashColor: Colors.white60,
          onTap: () {
            setState(() {
              widget.onPressed();
            });
          },
          child: Icon(
            Icons.menu,
            size: 30.0,
            color: Color(0xcfffffff),
          ),
        ),
      ),
    );
  }
}



List<Widget> navBarItems = [
NavBarItem(
text: 'About',
),
NavBarItem(
text: 'Explore',
),
NavBarItem(
text: 'Search',
),
NavBarItem(
text: 'Help',
),
];

var color = Colors.white;

class NavBarItem extends StatefulWidget {
  final String text;

  NavBarItem({
    this.text,
  });

  @override
  _NavBarItemState createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem> {


  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) {
        setState(() {
          color = Colors.black;
        });
      },
      onExit: (value) {
        setState(() {
          color = Colors.black;
        });
      },
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.white60,
          onTap: () {},
          child: Container(
            height: 60.0,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              widget.text,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.deepPurple,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
