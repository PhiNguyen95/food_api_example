import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_news/models/food_news_model.dart';
import 'package:http/http.dart' as http;

Future<List<Data>?> fetchFoodNews() async {
  final response =
      await http.get(Uri.parse('http://103.95.197.177:3010/api/v1/news/all'));
  final body = jsonDecode(response.body);

  FoodNews foodNews = FoodNews.fromJson(body);

  if (response.statusCode == 200) {
    return foodNews.data;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DemoFoodNewsAPI(),
    );
  }
}

class DemoFoodNewsAPI extends StatefulWidget {
  const DemoFoodNewsAPI({super.key});

  @override
  State<DemoFoodNewsAPI> createState() => _DemoFoodNewsAPIState();
}

class _DemoFoodNewsAPIState extends State<DemoFoodNewsAPI> {
  late Future<List<Data>?> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchFoodNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Food News')),
      ),
      body: Center(
        child: FutureBuilder<List<Data>?>(
          future: futureData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ListTile(
                            leading: const Icon(
                              Icons.food_bank,
                              color: Colors.amberAccent,
                            ),
                            isThreeLine: true,
                            title:
                                Text(snapshot.data![index].title ?? "Default"),
                            subtitle: Text(snapshot.data![index].decscription ??
                                "Default"),
                          ),
                        ),
                      );
                    }),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
