import 'package:flutter/material.dart';

Widget listbuild(list1, te1, srv, qty, list2, te, context) {
  return Container(
    height: 200,
    width: MediaQuery.sizeOf(context).width,
    child: ListView.builder(
      itemCount: list1.length,
      itemBuilder: (context, index) => ListTile(
        isThreeLine: true,
        contentPadding: const EdgeInsets.all(15),
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(list1[index],
              overflow: TextOverflow.clip,
              style:
                  const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        ),
        subtitle: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DropdownMenu<String>(
              width: 145,
              controller: te1[index],
              trailingIcon: const Icon(
                Icons.arrow_drop_down,
                color: Colors.white,
              ),
              initialSelection: srv.first,
              dropdownMenuEntries:
                  srv.map<DropdownMenuEntry<String>>((String value) {
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
              controller: te[index],
              trailingIcon: const Icon(
                Icons.arrow_drop_down,
                color: Colors.white,
              ),
              initialSelection: qty.first,
              dropdownMenuEntries: qty.map<DropdownMenuEntry<int>>((int value) {
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
  );
}

//code which was in order page under visibility
/* ListView.builder(
                    itemCount: list1.length,
                    itemBuilder: (context, index) => ListTile(
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
                            controller: te1[index],
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
                            controller: te[index],
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
                  ), */