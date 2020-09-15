import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '':(context) => MyHomePage(),
        '/segunda': (context) => SecondRoute(),
        ExtracArgumentsScreen.routeName: (context) => ExtracArgumentsScreen(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _correo;
  final inputController = TextEditingController();
  void _elegirnombre() {
    setState(() {
      _correo = inputController.text;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Sign In',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20
              ),
            ),
            Form(child:
                Column(
                 children: [
                   Container(child: Align(child: Text('User'),alignment: Alignment.centerLeft,)),
                   TextFormField(
                     controller: inputController,
                     decoration: const InputDecoration(
                         hintText: 'Enter your user name'),
                   ),
                   Container(child: Align(child: Text('Password'),alignment: Alignment.centerLeft,)),
                   TextFormField(decoration: const InputDecoration(
                       hintText: 'Enter your password'
                   ),
                   ),
                   RaisedButton(
                     onPressed: () {
                       _elegirnombre();
                       Navigator.pushNamed(context, ExtracArgumentsScreen.routeName,
                       arguments: ScreenArguments('Segunda pantalla', 'Bienvenido $_correo'));
                     },
                     child: Text('Login'),

                   ),
                 ],
                )
            ),
          ],
        ),
      ),
    );
  }
}
class ScreenArguments{
  final String title;
  final String message;

  ScreenArguments(this.title,this.message);
}


class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
class ExtracArgumentsScreen extends StatelessWidget{
  static const routeName = '/extractArg';

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Text(args.message),
      ),
    );
  }
}