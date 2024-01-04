import 'package:flutter/material.dart';
import 'package:ironman/data.dart';

class Order extends StatefulWidget {
  //List<Data> data = [Data()];
  List<bool> open = [
    false,
    false,
    false,
    false,
    false,
  ];
  List<int> qty = List.generate(100, (index) => index);
  List<TextEditingController> te =
      List.generate(15, (index) => TextEditingController(text: '0'));

  List<TextEditingController> te1 =
      List.generate(15, (index) => TextEditingController(text: '0'));
  Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  List<String> list1 = ['Shirt/T-Shirt', 'Pant', 'Dhothi', 'Dress', 'Saree'];

  List<double> list2 = [10, 10, 20, 10, 30];

  List<String> srv = ['Iron', 'Dry Clean', 'Wash', 'Steam'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(
          Icons.send_rounded,
        ),
        label: const Text('Submit'),
        isExtended: true,
        onPressed: () {},
      ),
      appBar: AppBar(
        title: const Text('Shop namee'),
      ),
      body: ListView.builder(
        itemCount: srv.length,
        itemBuilder: (context, index) {
          int i = index;
          return Card(
            child: Column(
              children: [
                InkWell(
                    onTap: () {
                      (widget.open[index] == true)
                          ? setState((() => widget.open[index] = false))
                          : setState(() => widget.open[index] = true);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(srv[index]),
                        const Icon(Icons.arrow_drop_down_sharp)
                      ],
                    )),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: list1.length,
                  itemBuilder: (context, index) => Visibility(
                    visible: widget.open[i],
                    child: ListTile(
                      isThreeLine: true,
                      contentPadding: const EdgeInsets.all(15),
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(list1[index],
                            overflow: TextOverflow.clip,
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                      ),
                      subtitle: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          DropdownMenu<String>(
                            width: 145,
                            controller: widget.te1[index],
                            trailingIcon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.white,
                            ),
                            initialSelection: srv.first,
                            dropdownMenuEntries: srv
                                .map<DropdownMenuEntry<String>>((String value) {
                              return DropdownMenuEntry<String>(
                                value: value,
                                label: value.toString(),
                              );
                            }).toList(),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text('Cost:${list2[index]}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          ),
                          DropdownMenu<int>(
                            width: 85,
                            controller: widget.te[index],
                            trailingIcon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.white,
                            ),
                            initialSelection: widget.qty.first,
                            dropdownMenuEntries: widget.qty
                                .map<DropdownMenuEntry<int>>((int value) {
                              return DropdownMenuEntry<int>(
                                value: value,
                                label: value.toString(),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
