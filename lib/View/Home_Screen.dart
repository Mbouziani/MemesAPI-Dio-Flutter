import 'package:flutter/material.dart';
import 'package:memes_demoapp_api/Controler/Meme_Data.dart';
import 'package:memes_demoapp_api/Model/Meme_Model.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pagesIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            'MemesDay',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            setState(() {
              pagesIndex++;
            });
          },
          child: FutureBuilder<List<Data>>(
            future: MemeAPi.FetchMemes(pagesIndex),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          if (snapshot.data![index].image!.endsWith('.jpg') ||
                              snapshot.data![index].image!.endsWith('.png')) {
                            return Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 300,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: NetworkImage(
                                        snapshot.data![index].image!),
                                    fit: BoxFit.cover,
                                  )),
                                ),
                              ],
                            );
                          } else
                            return Container();
                        },
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    );
            },
          ),
        ));
  }
}
