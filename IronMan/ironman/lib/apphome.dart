import 'package:flutter/material.dart';
import 'package:ironman/OrderPages/order.dart';
import 'package:ironman/models/shopmodel.dart';
import 'package:ironman/mongoconnect.dart';
import 'package:ironman/profile.dart';
import 'package:ironman/shop.dart';

class AppHome extends StatelessWidget {
  const AppHome({super.key});
  Future<List<Shopmodel>> getData() async {
    List<Shopmodel> shops = await Mongoconnect().connect();
    return shops;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Profile(),
                  ));
            },
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
        title: const Text(
            "IronMan"), /*const Icon(
          Icons.iron_rounded,
          size: 50,
        ),*/
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              surfaceTintColor: Colors.black,
              elevation: 10,
              color: const Color.fromARGB(0, 255, 255, 255),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side:
                      const BorderSide(color: Color.fromARGB(255, 6, 97, 26))),
              shadowColor: Colors.white,
              margin: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Title(
                      color: Colors.white,
                      child: const Text(
                        'Services',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )),
                  GridView(
                    padding: const EdgeInsets.all(8.0),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: MediaQuery.sizeOf(context).width / 4,
                    ),
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              iconSize: 35,
                              style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Color.fromARGB(255, 2, 134, 149))),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Shop(val: 'Iron'),
                                    ));
                              },
                              icon: const Icon(Icons.iron_rounded),
                              color: Colors.white,
                            ),
                            const Text('Iron')
                          ]),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              iconSize: 5,
                              style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.white)),

                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          Shop(val: 'Steam Iron'),
                                    ));
                              },
                              icon: ClipOval(
                                child: Image.asset('lib/assests/SteamIron.jpg',
                                    scale: Checkbox.width / 2.8,
                                    fit: BoxFit.contain),
                              ), //Icon(Icons.abc),
                              color: Colors.amber,
                            ),
                            const Text('Steam Iron')
                          ]),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              iconSize: 25,
                              style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Color.fromARGB(255, 0, 107, 228))),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Shop(val: 'Wash'),
                                    ));
                              },
                              icon: Image.asset(
                                  color: Colors.white,
                                  'lib/assests/dishwasher_FILL0_wght400_GRAD0_opsz24.png',
                                  scale: Checkbox.width / 25,
                                  fit: BoxFit.fitHeight),
                              //Icon(Icons.dishwasher),
                            ),
                            const Text('Wash')
                          ]),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              iconSize: 5,
                              style: const ButtonStyle(
                                  side: MaterialStatePropertyAll(BorderSide(
                                      color: Colors.white, width: 3)),
                                  backgroundColor: MaterialStatePropertyAll(
                                      Color.fromARGB(255, 246, 107, 2))),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          Shop(val: 'Dry Clean'),
                                    ));
                              },
                              icon: Image.asset(
                                  'lib/assests/dishwasher_gen_FILL0_wght400_GRAD0_opsz24.png',
                                  scale: Checkbox.width / 30,
                                  fit: BoxFit.fitHeight), //Icon(Icons.abc),
                              color: Colors.amber,
                            ),
                            const Text('Dry Clean')
                          ]),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              iconSize: 5,
                              style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.blue)),
                              onPressed: () {},
                              icon: Image.asset('lib/assests/utilityicon.png',
                                  scale: Checkbox.width / 5,
                                  fit: BoxFit.fitHeight), //Icon(Icons.abc),
                              color: Colors.amber,
                            ),
                            Text('data')
                          ]),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              iconSize: 5,
                              style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.blue)),
                              onPressed: () {},
                              icon: Image.asset('lib/assests/utilityicon.png',
                                  scale: Checkbox.width / 5,
                                  fit: BoxFit.fitHeight), //Icon(Icons.abc),
                              color: Colors.amber,
                            ),
                            Text('data')
                          ]),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              iconSize: 5,
                              style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.blue)),
                              onPressed: () {},
                              icon: Image.asset('lib/assests/utilityicon.png',
                                  scale: Checkbox.width / 5,
                                  fit: BoxFit.fitHeight), //Icon(Icons.abc),
                              color: Colors.amber,
                            ),
                            Text('data')
                          ]),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              iconSize: 5,
                              style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.blue)),
                              onPressed: () {},
                              icon: Image.asset('lib/assests/utilityicon.png',
                                  scale: Checkbox.width / 5,
                                  fit: BoxFit.fitHeight), //Icon(Icons.abc),
                              color: Colors.amber,
                            ),
                            Text('data')
                          ]),
                    ],
                  ),
                ],
              ),
            ),
            Card(
              surfaceTintColor: Colors.black,
              elevation: 10,
              color: const Color.fromARGB(0, 255, 255, 255),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: const BorderSide(
                      style: BorderStyle.solid,
                      color: Color.fromARGB(255, 6, 97, 26))),
              shadowColor: Colors.white,
              margin: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Title(
                      color: Colors.white,
                      child: const Text(
                        'Shops',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )),
                  FutureBuilder<List<Shopmodel>>(
                    future: getData(),
                    builder: (context, snapshot) => (snapshot.hasData)
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return Card(
                                elevation: 10,
                                surfaceTintColor: Colors.amber,
                                shadowColor: Colors.white,
                                color: const Color.fromARGB(64, 255, 193, 7),
                                child: InkWell(
                                  hoverColor:
                                      const Color.fromARGB(255, 69, 126, 52),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Order(
                                                shop: snapshot.data![index])
                                            //Order(shops: snapshot.data[index] ),
                                            ));
                                  },
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Icon(Icons.iron_outlined,
                                            size: 100),
                                        const SizedBox(
                                          width: 25,
                                        ),
                                        Text(
                                          snapshot.data![index].Name,
                                          //list[index],
                                          overflow: TextOverflow.clip,
                                          style: const TextStyle(fontSize: 25),
                                        )
                                      ]),
                                ),
                              );
                            },
                          )
                        : const Center(
                            child: Card(
                              child: SizedBox(
                                height: 50,
                                width: 50,
                                child: CircularProgressIndicator(
                                    color: Colors.white, strokeWidth: 5),
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
