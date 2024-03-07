import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/model/model2.dart';
import 'package:rick_and_morty/providers/theme_provider.dart';

import 'package:rick_and_morty/services/get_data.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    var dataProvider = ref.watch(responseProvider);
    var themeChanger = ref.watch(themeProvider.notifier).state;
    var size = MediaQuery.of(context).size;
    int itemCount = 20;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  themeChanger = !themeChanger;
                });
              },
              icon: const Icon(Icons.sunny))
        ],
        title: const Text("Rick And Morty"),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          height: size.height * 0.8,
          child: ListView.builder(
            itemCount: itemCount,
            itemBuilder: (context, index) {
              return dataProvider.when(
                data: (dataSource) {
                  return characterTile(dataSource, index);
                },
                error: (error, stackTrace) => const Text("data"),
                loading: () {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color:
                              Colors.blue, // Set your desired border color here
                          width: 2, // Optional: Set the border width
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                      ),
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const AlertDialog(
                                actions: [
                                  Text(""),
                                  Text(""),
                                  Text(""),
                                ],
                                title: Text(""),
                                content: Text(""),
                              );
                            },
                          );
                        },
                        child: const ListTile(
                          contentPadding: EdgeInsets.all(15),
                          leading: Text(""),
                          title: Text(""),
                          subtitle: Text(""),
                          trailing: Text(""),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        ref.read(pageNumberProvider.notifier).update((state) => state + 1);
      }),
    );
  }

  Padding characterTile(RickMorty data, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blue, // Set your desired border color here
            width: 2, // Optional: Set the border width
          ),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  actions: [
                    Text(data.results![index].gender.toString()),
                    Image.network(data.results![index].image.toString()),
                    Text(data.results![index].location!.name.toString()),
                  ],
                  title: Text(data.results![index].name.toString()),
                  content: Text(data.results![index].type.toString()),
                );
              },
            );
          },
          child: ListTile(
            contentPadding: const EdgeInsets.all(15),
            leading: Text(data.results![index].id.toString()),
            title: Text(data.results![index].name.toString()),
            subtitle: Text(data.results![index].status.toString()),
            trailing: Image.network(data.results![index].image.toString()),
          ),
        ),
      ),
    );
  }
}
