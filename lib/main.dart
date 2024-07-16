import 'package:flutter/material.dart';
import 'package:air_q/data/fetch_data.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
			debugShowCheckedModeBanner: false,
      home: FutureBuilder(
				future: fetchData(),
				builder: (context, snap) {
					if(snap.hasData) {
						return HomeScreen(snap.data!);
					} else {
						return const Scaffold(
							body: Center(
								child: CircularProgressIndicator(),
							),
						);
					}
				}
			),
    );
  }
}
