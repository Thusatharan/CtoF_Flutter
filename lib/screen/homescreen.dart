import 'package:flutter/material.dart';
import 'package:ftoc/api_requests/ftoc_post_request.dart';
import 'package:ftoc/model/celcius_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _celciusController = TextEditingController();

  Future<Fahrenheit>? _future;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/weather.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.all(25),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white60,
            ),
            height: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Enter Celcius',
                  style: TextStyle(fontSize: 30),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: 200,
                    child: TextField(
                      controller: _celciusController,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 30,
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _future = convertFtoC(_celciusController.text);
                      });
                    },
                    child: const Text('Convert to Fahrenheit')),
                const SizedBox(
                  height: 40,
                ),
                FutureBuilder<Fahrenheit>(
                  future: _future,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          const Text(
                            'Result',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            snapshot.data!.fahrenheit.toString() +
                                " fahrenheit",
                            style: const TextStyle(
                                color: Colors.green, fontSize: 30),
                          ),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    } else {
                      return const Text('Please Enter a value');
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
