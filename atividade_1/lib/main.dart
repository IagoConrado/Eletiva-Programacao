import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atividade',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Atividade - 1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  bool _verif = true;

  late Animation<double> _myAnimation;
  late AnimationController _controller;  

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );

    _myAnimation = CurvedAnimation(
      curve: Curves.linear,
      parent: _controller
    );
    
  }

  @override
  Widget build(BuildContext context) { return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedIcon(
              progress: _myAnimation,
              icon: AnimatedIcons.play_pause,
              color: Colors.black,
              size: 90,
            ),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
              child: RichText(
                text: TextSpan(
                  text: "Aperte aqui",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white 
                  ),
                  children: [
                    WidgetSpan(child: Icon(Icons.touch_app)
                      ,alignment: PlaceholderAlignment.middle)
                  ]
                )
              ),
              onPressed: () {
                if (_verif) {
                  _controller.forward();
                } else {
                  _controller.reverse();
                }

                _verif = !_verif;
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: Text('Não Aperte aqui'),
              onPressed: (){
              }
              ),
              SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: Text('Não aperte aqui'),
              onPressed: (){
              }
              )
          ],
        ),
      ),
    );
  }
}
