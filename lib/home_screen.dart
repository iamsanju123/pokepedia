import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokepedia/pokemon_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List pokepedia = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  var pokepediaApi =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -50,
            right: -50,
            child: Image.asset(
              "assets/images/pokeball-i.jpg",
              width: 240,
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            top: 90,
            left: 15,
            child: Text(
              "Poke'pedia",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: 160,
            left: 0,
            right: 0,
            bottom: 0,
            child:
                pokepedia.isNotEmpty
                    ? Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.3,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                        itemCount: pokepedia.length,
                        itemBuilder: (context, index) {
                          var pokemon = pokepedia[index];
                          var type = pokemon['type'][0];

                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color:
                                  type == "Grass"
                                      ? Colors.greenAccent
                                      : type == "Fire"
                                      ? Colors.red
                                      : type == "Water"
                                      ? Colors.blueAccent
                                      : type == "Electric"
                                      ? Colors.yellowAccent
                                      : type == "Rock"
                                      ? Colors.grey
                                      : type == "Ground"
                                      ? Colors.brown
                                      : type == "Psychic"
                                      ? Colors.indigo
                                      : type == "Fighting"
                                      ? Colors.orange
                                      : type == "Bug"
                                      ? Colors.lightGreen
                                      : type == "Ghost"
                                      ? Colors.deepPurple
                                      : type == "Normal"
                                      ? Colors.black26
                                      : type == "Poison"
                                      ? Colors.deepOrangeAccent
                                      : Colors.pink,
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: -10,
                                  right: -10,
                                  child: Image.asset(
                                    "assets/images/pokeball-i.jpg",
                                    width: 100,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                                Positioned(
                                  top: 15,
                                  left: 10,
                                  child: Text(
                                    pokemon["name"],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 40,
                                  left: 10,
                                  child: InkWell(
                                    child: Container(
                                      height: 30,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        color: Colors.white30,
                                        borderRadius: BorderRadius.circular(21),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(
                                            type.toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => PokemonDetailsScreen(color:
                                      type == "Grass"
                                          ? Colors.greenAccent
                                          : type == "Fire"
                                          ? Colors.red
                                          : type == "Water"
                                          ? Colors.blueAccent
                                          : type == "Electric"
                                          ? Colors.yellowAccent
                                          : type == "Rock"
                                          ? Colors.grey
                                          : type == "Ground"
                                          ? Colors.brown
                                          : type == "Psychic"
                                          ? Colors.indigo
                                          : type == "Fighting"
                                          ? Colors.orange
                                          : type == "Bug"
                                          ? Colors.lightGreen
                                          : type == "Ghost"
                                          ? Colors.deepPurple
                                          : type == "Normal"
                                          ? Colors.black26
                                          : type == "Poison"
                                          ? Colors.deepOrangeAccent
                                          : Colors.pink, tag: pokepedia[index]['name'], pokedetails: pokepedia[index],),));
                                    },
                                  ),
                                ),
                                Positioned(
                                  bottom: 10,
                                  right: 10,
                                  child: CachedNetworkImage(
                                    imageUrl: pokemon["img"],
                                    height: 80,
                                    fit: BoxFit.contain,
                                    placeholder:
                                        (context, url) =>
                                            CircularProgressIndicator(),
                                    errorWidget:
                                        (context, url, error) =>
                                            Icon(Icons.error),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    )
                    : const Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }

  void fetchData() async {
    var url = Uri.parse(pokepediaApi);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      setState(() {
        pokepedia = decodedData["pokemon"];
      });
    } else {
      debugPrint("Failed to load data");
    }
  }
}
