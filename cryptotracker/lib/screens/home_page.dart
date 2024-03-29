import 'package:cryptotracker/model/bitcoin_model.dart';

import 'package:cryptotracker/services/get_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final response = FutureProvider<BitcoinMockModel>((ref) async {
  final apiService = ref.read(serviceProvider);
  return apiService.dataService();
});

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      __HomePage2StateState();
}

class __HomePage2StateState extends ConsumerState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var red = ref.watch(response);
    var itemCount = ref.watch(serviceProvider).datas.length;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                    decoration: const BoxDecoration(
                        color: Color(0xff005BE3),
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
              space(),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Trending Coins",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w800),
                    ),
                    space(),
                    Expanded(
                        flex: 3,
                        child: red.when(
                          //futureproviderin sağladığı bir güzellik
                          data: (coin) {
                            // eğer data geldiyse bunları yap

                            return ListView.builder(
                                itemCount: itemCount,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      SizedBox(
                                        height: 60,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          child: ListTile(
                                              leading: Text(coin.id),
                                              trailing: Image.network(
                                                  coin.image.toString()),
                                              subtitle: Text(coin.name),
                                              title: Text(coin.price)),
                                        ),
                                      ),
                                      space()
                                    ],
                                  );
                                });
                          }, // gelmediyse bunları
                          error: (error, stackTrace) => const Text("gelmöedi"),
                          loading: () =>
                              const CircularProgressIndicator(), // gelirken bunu
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

SizedBox space() => const SizedBox(
      height: 15,
    );
