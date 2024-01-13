import 'package:flutter/material.dart';
import 'package:ironman/appHome.dart';
import 'package:ironman/SignupLogin/logsign.dart';
import 'package:ironman/SignupLogin/signup.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
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
                              builder: (context) => const AppHome(),
                            ));
                      },
                      icon: const Icon(Icons.home),
                      label: const Text('Home')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
