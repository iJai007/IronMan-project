import 'package:flutter/material.dart';
import 'package:ironman/appHome.dart';
import 'package:ironman/SignupLogin/logsign.dart';
import 'package:ironman/SignupLogin/signup.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  Future<String> loginStatus() async {
    const storage = FlutterSecureStorage();
    if (await storage.containsKey(key: 'loginStatus')) {
      var stat = await storage.read(key: 'loginStatus');
      return stat.toString();
    } else {
      return 'false';
    }
  }

  void next(context) {
    Future.delayed(
      Duration.zero,
      () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AppHome(),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: loginStatus(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == 'true') {
              next(context);
              return const Center(
                child: Card(
                  child: Icon(
                    Icons.iron_rounded,
                    size: 50,
                  ),
                ),
              );
            } else if (snapshot.data == 'false') {
              return Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                surfaceTintColor: const Color.fromARGB(255, 3, 86, 46),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Icon(
                        Icons.iron_rounded,
                        size: 300,
                        color: Color.fromARGB(255, 3, 86, 46),
                      ),
                      const Text(
                        'IronMan',
                        style: TextStyle(
                          fontSize: 50,
                          color: Color.fromARGB(255, 3, 86, 46),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          LogSign(val: 'Login'),
                                    ));
                              },
                              icon: const Icon(Icons.login),
                              label: const Text('Login')),
                          ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Signup(),
                                    ));
                              },
                              icon: const Icon(Icons.app_registration),
                              label: const Text('Sign UP')),
                          ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AppHome(),
                                    ));
                              },
                              icon: const Icon(Icons.home),
                              label: const Text('Home')),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }
          } else if (snapshot.hasError) {
            return Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              surfaceTintColor: const Color.fromARGB(255, 3, 86, 46),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Icon(
                      Icons.iron_rounded,
                      size: 300,
                      color: Color.fromARGB(255, 3, 86, 46),
                    ),
                    const Text(
                      'IronMan',
                      style: TextStyle(
                        fontSize: 50,
                        color: Color.fromARGB(255, 3, 86, 46),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton.icon(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LogSign(val: 'Login'),
                                  ));
                            },
                            icon: const Icon(Icons.login),
                            label: const Text('Login')),
                        ElevatedButton.icon(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Signup(),
                                  ));
                            },
                            icon: const Icon(Icons.app_registration),
                            label: const Text('Sign UP')),
                        ElevatedButton.icon(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AppHome(),
                                  ));
                            },
                            icon: const Icon(Icons.home),
                            label: const Text('Home')),
                      ],
                    )
                  ],
                ),
              ),
            );
          }
          return const Center(
            child: Card(
              child: Icon(
                Icons.iron_rounded,
                size: 50,
              ),
            ),
          );
        },
      ),
    );
  }
}
