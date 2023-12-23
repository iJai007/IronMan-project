import 'package:flutter/material.dart';

class AppHome extends StatelessWidget {
  const AppHome({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> list = [
      'gasdgfhahgaglsagglashg',
      'l1dhgfsajkghkjsavuerwyfrewfb'
    ];
    return Scaffold(
      drawer: Drawer(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {},
            child: Card(
              margin: const EdgeInsets.all(0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.account_circle,
                    size: MediaQuery.of(context).size.width / 1.7,
                  ),
                  const Text('Profile')
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Previous Order',
              style: TextStyle(
                color: Color.fromARGB(255, 9, 75, 11),
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Settings',
              style: TextStyle(
                color: Color.fromARGB(255, 9, 75, 11),
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Log Out',
              style: TextStyle(
                color: Color.fromARGB(255, 9, 75, 11),
                fontSize: 20,
              ),
            ),
          )
        ],
      )),
      appBar: AppBar(
        title: const Icon(
          Icons.iron_rounded,
          size: 50,
        ),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Card(
            child: InkWell(
              hoverColor: const Color.fromARGB(255, 17, 65, 3),
              onTap: () {},
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.iron_outlined, size: 100),
                    const SizedBox(
                      width: 50,
                    ),
                    Text(
                      list[index],
                      style: const TextStyle(fontSize: 25),
                    )
                  ]),
            ),
          );
        },
      ),
    );
  }
}
