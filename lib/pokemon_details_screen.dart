import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PokemonDetailsScreen extends StatefulWidget {
  final String tag;
  final Map<String, dynamic> pokedetails;
  final Color color;

  const PokemonDetailsScreen({
    super.key,
    required this.tag,
    required this.pokedetails,
    required this.color,
  });

  @override
  State<PokemonDetailsScreen> createState() => _PokemonDetailsScreenState();
}

class _PokemonDetailsScreenState extends State<PokemonDetailsScreen> {
  @override
  Widget build(BuildContext context) {
     final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: widget.color,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: 10,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              top: 70,
              left: 20,
              child: Text(
                widget.pokedetails["name"],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              top: 120,
              left: 20,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(21),
                ),
                child: Text(
                  widget.pokedetails["type"].join(','),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Positioned(
              top: height * 0.12,
              right: -30,
              child: Image.asset(
                "assets/images/pokeball-i.jpg",
                width: 240,
                fit: BoxFit.fitHeight,
              ),
            ),
            Positioned(
              top: 120,
              right: 100,
              //left: (width / 1) - 230,
              child: CachedNetworkImage(
                imageUrl: widget.pokedetails['img'],
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: width,
                height: height * 0.55,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                           // width: width * 3,
                            child: Text(
                              "Name:",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              widget.pokedetails['name'],
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            //width: width * 3,
                            child: Text(
                              "Height:",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              widget.pokedetails['height'],
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            //width: width * 3,
                            child: Text(
                              "Weight:",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              widget.pokedetails['weight'],
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            //width: width * 3,
                            child: Text(
                              "Spawn Time:",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              widget.pokedetails['spawn_time'],
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            //width: width * 3,
                            child: Text(
                              "Weakness:",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              widget.pokedetails['weaknesses'].join(' , '),
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            //width: width * 3,
                            child: Text(
                              "Evolution:",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ),
                          widget.pokedetails['next_evolution'] != null &&
                              widget.pokedetails['next_evolution']
                              is List
                              ? SizedBox(
                            height: 20,
                            width: width * 0.5,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                              widget.pokedetails["next_evolution"]
                                  .length,
                              itemBuilder: (context, index) {
                                final evolution = widget
                                    .pokedetails["next_evolution"][index];
                                return Padding(
                                  padding:
                                  const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    evolution['name'],
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                              : Text(
                            "Maxed Out",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
