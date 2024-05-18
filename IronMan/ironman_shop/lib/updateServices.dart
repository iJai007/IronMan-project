import 'package:flutter/material.dart';
import 'package:ironman_shop/mongoconnect.dart';

class UpdateServices extends StatelessWidget {
  const UpdateServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Update Services'),
        ),
        body: FutureBuilder(
          future: Mongoconnect().connect(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.first.Cost.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Text(
                              snapshot.data!.first.Cost.entries
                                  .elementAt(index)
                                  .key,
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w700)),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.first.Cost.entries
                                .elementAt(index)
                                .value
                                .length,
                            itemBuilder: (context, i) {
                              return Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${snapshot.data!.first.Cost.entries.elementAt(index).value.entries.elementAt(i).key}:',
                                      style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    TextField(
                                      decoration: const InputDecoration(
                                          constraints: BoxConstraints(
                                              maxWidth: 250, minWidth: 50)),
                                      controller: TextEditingController(
                                          text: snapshot
                                              .data!.first.Cost.entries
                                              .elementAt(index)
                                              .value
                                              .entries
                                              .elementAt(i)
                                              .value),
                                    )
                                  ],
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
