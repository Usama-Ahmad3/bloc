import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
List name = [
  'Usama',
  'Rehan',
  'Ahmad'
];
extension RandomElement<T> on Iterable<T>{
  T getRandomElement() => elementAt(math.Random().nextInt(length));
}
class NamesCubit extends Cubit<String?>{
  NamesCubit():super(null);
  void pickRandom(){
    emit(name.getRandomElement());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  NamesCubit cubit = NamesCubit();
  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cubit"),
      ),
      body: StreamBuilder(
        stream: cubit.stream,
        builder: (context, snapshot) {
          final button = TextButton(onPressed: (){
            cubit.pickRandom();
          }, child: const Text('PickValue'));
          switch(snapshot.connectionState){
            case ConnectionState.none:
              return button;
            case ConnectionState.waiting:
              return button;
            case ConnectionState.active:
              return Column(
                children: [
                Text(snapshot.data??''),
                button
                ],
              );
            case ConnectionState.done:
              return Container();
          }
        },
      ),
    );
  }
}
