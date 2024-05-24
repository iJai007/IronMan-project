import 'package:flutter/material.dart';
import 'package:ironman/OrderPages/cart.dart';
import 'package:ironman/OrderPages/order.dart';
import 'package:ironman/SignupLogin/predict.dart';
import 'package:ironman/locate.dart';
import 'package:ironman/models/shopmodel.dart';
import 'package:ironman/mongoconnect.dart';
import 'package:ironman/profile.dart';
import 'package:ironman/shop.dart';
import 'package:geolocator/geolocator.dart';
import 'package:maps_launcher/maps_launcher.dart';

class AppHome extends StatefulWidget {
  AppHome({super.key});
  String orderStatus = 'NoOrder';

  Future<List<Shopmodel>> getData() async {
    List<Shopmodel> shops = await Mongoconnect().connect();
    return shops;
  }

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  late Future<List<Shopmodel>> _futureShopData;
  late List<Shopmodel> shopData = [];
  //Geolocator.distanceBetween( '12°57'47.1"N' ,77°32'14.8"E,12°57'43.4"N , 77°32'13.3"E)}
  @override
  void initState() {
    _futureShopData = widget.getData();
    super.initState();
  }

  Widget _buildStarRating({required double rating, double starSize = 24.0}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        double fillRatio = 1.0;
        if (rating < index + 1) {
          if (rating >= index) {
            fillRatio = rating - index;
          } else {
            fillRatio = 0.0;
          }
        }

        IconData iconData;
        if (fillRatio >= 0.75) {
          iconData = Icons.star;
        } else if (fillRatio >= 0.25) {
          iconData = Icons.star_half;
        } else {
          iconData = Icons.star_border;
        }

        return Icon(
          iconData,
          size: starSize,
          color: Colors.black45,
        );
      }),
    );
  }

  Future<Position> getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;
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
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.account_circle,
                      size: MediaQuery.of(context).size.width / 1.7,
                    ),
                    const Text(
                      'Profile',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          ElevatedButton(
            style: const ButtonStyle(
                backgroundColor:
                    WidgetStatePropertyAll(Color.fromARGB(255, 9, 75, 11)),
                foregroundColor: WidgetStatePropertyAll(Colors.white)),
            onPressed: () {},
            child: const Text(
              'Previous Order',
              style: TextStyle(
                //color: Color.fromARGB(255, 9, 75, 11),
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          ElevatedButton(
            style: const ButtonStyle(
                backgroundColor:
                    WidgetStatePropertyAll(Color.fromARGB(255, 9, 75, 11)),
                foregroundColor: WidgetStatePropertyAll(Colors.white)),
            onPressed: () {},
            child: const Text(
              'Settings',
              style: TextStyle(
                //color: Color.fromARGB(255, 9, 75, 11),
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          ElevatedButton(
            style: const ButtonStyle(
                backgroundColor:
                    WidgetStatePropertyAll(Color.fromARGB(255, 9, 75, 11)),
                foregroundColor: WidgetStatePropertyAll(Colors.white)),
            onPressed: () {},
            child: const Text(
              'Log Out',
              style: TextStyle(
                //color: Color.fromARGB(255, 9, 75, 11),
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
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: const Color.fromARGB(255, 242, 211, 98),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Cart(
                      selected: const {},
                      shop: 'null',
                      address: 'null',
                      order: const []),
                ));
          },
          label: (widget.orderStatus == 'orderPlaced')
              ? const Text('Current Order Status : IN Progress')
              : const Row(
                  children: [
                    Icon(Icons.shopping_cart),
                    Text('Cart'),
                  ],
                )),
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
                                  backgroundColor: WidgetStatePropertyAll(
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
                                      WidgetStatePropertyAll(Colors.white)),

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
                                  backgroundColor: WidgetStatePropertyAll(
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
                                  side: WidgetStatePropertyAll(BorderSide(
                                      color: Colors.white, width: 3)),
                                  backgroundColor: WidgetStatePropertyAll(
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
                                      WidgetStatePropertyAll(Colors.blue)),
                              onPressed: () {},
                              icon: Image.asset('lib/assests/utilityicon.png',
                                  scale: Checkbox.width / 5,
                                  fit: BoxFit.fitHeight), //Icon(Icons.abc),
                              color: Colors.amber,
                            ),
                            const Text('data')
                          ]),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              iconSize: 5,
                              style: const ButtonStyle(
                                  backgroundColor:
                                      WidgetStatePropertyAll(Colors.blue)),
                              onPressed: () async {
                                //Locate().openMaps();
                                Position pos =
                                    await Geolocator.getCurrentPosition();
                                //Geolocator.distanceBetween(startLatitude, startLongitude, endLatitude, endLongitude)
                                //double  pos2 = Geolocator.distanceBetween( '12°57'47.1"N' ,77°32'14.8"E,12°57'43.4"N , 77°32'13.3"E)
                                MapsLauncher.launchCoordinates(
                                    pos.latitude, pos.longitude);
                              },
                              icon: Image.asset('lib/assests/utilityicon.png',
                                  scale: Checkbox.width / 5,
                                  fit: BoxFit.fitHeight), //Icon(Icons.abc),
                              color: Colors.amber,
                            ),
                            const Text('Open Maps')
                          ]),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              iconSize: 5,
                              style: const ButtonStyle(
                                  backgroundColor:
                                      WidgetStatePropertyAll(Colors.blue)),
                              onPressed: () {},
                              icon: Image.asset('lib/assests/utilityicon.png',
                                  scale: Checkbox.width / 5,
                                  fit: BoxFit.fitHeight), //Icon(Icons.abc),
                              color: Colors.amber,
                            ),
                            const Text('data')
                          ]),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              iconSize: 5,
                              style: const ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                      Color.fromARGB(255, 4, 93, 3))),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Predict(),
                                    ));
                              },
                              icon: const Icon(
                                Icons.camera_alt_rounded,
                                size: 35,
                              ),
                              /*Image.asset('lib/assests/utilityicon.png',
                                  scale: Checkbox.width / 5,
                                  fit: BoxFit.fitHeight),*/ //Icon(Icons.abc),
                              color: Colors.white70,
                            ),
                            const Text('Predict')
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
                      future: _futureShopData,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          shopData = snapshot.data!;
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: shopData.length,
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
                                                shop: shopData.elementAt(index))
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
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              shopData.elementAt(index).Name,
                                              //list[index],
                                              overflow: TextOverflow.clip,
                                              style:
                                                  const TextStyle(fontSize: 25),
                                            ),
                                            _buildStarRating(rating: 4),
                                            Text(
                                                '${shopData.elementAt(index).Area} ${Geolocator.distanceBetween(12.57471, 77.32148, 12.57434, 77.32133).truncate().toString()}m'),
                                          ],
                                        ),
                                      ]),
                                ),
                              );
                            },
                          );
                        } else {
                          return const Center(
                            child: Card(
                              child: SizedBox(
                                height: 50,
                                width: 50,
                                child: CircularProgressIndicator(
                                    color: Colors.white, strokeWidth: 5),
                              ),
                            ),
                          );
                        }
                      }),
                ],
              ),
            ),
            /*Card(
              child: Text('Location:${Locate().determinePosition()}'),
            )*/
          ],
        ),
      ),
    );
  }
}
