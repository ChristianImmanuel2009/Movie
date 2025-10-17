import 'package:flutter/material.dart';
import 'package:models/controllers/movie_controller.dart';
import 'package:models/models/movie.dart';
import 'package:models/widgets/modal.dart';

class MovieView extends StatefulWidget {
  const MovieView({super.key});

  @override
  State<MovieView> createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  final formKey = GlobalKey<FormState>();
  MovieController movie = MovieController();
  TextEditingController title = TextEditingController();
  TextEditingController posterPath = TextEditingController();
  TextEditingController voteAverage = TextEditingController();
  TextEditingController overview = TextEditingController();
  List? film;
  List buttonChoice = ["Update", "Delete"];
  int? film_id;
  getFilm() {
    setState(() {
      film = movie.movies;
    });
    print(film![0].title);
  }

  @override
  void initState() {
    super.initState();
    getFilm();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MovieMax"),
        actions: [
          IconButton(
            onPressed: () {
              onPressed:
              () {
                setState(() {
                  film_id = null;
                });
                title.text = '';
                overview.text = '';
                posterPath.text = '';
                voteAverage.text = '';
              };
              ModalWidget().showFullModal(context, addItem(null));
            },
            icon: Icon(Icons.movie),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: film?.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image.network(film![index].posterPath, cacheWidth: 100),
              title: Text(film![index].title),
              subtitle: Text(film![index].overview),
              trailing: PopupMenuButton<String>(
                onSelected: (String r) {
                  if (r == "Update") {
                    setState(() {
                      film_id = film![index].id;
                    });

                    title.text = film![index].title;
                    overview.text = film![index].overview;
                    posterPath.text = film![index].posterPath;
                    voteAverage.text = film![index].voteAverage.toString();
                    ModalWidget().showFullModal(context, addItem(index));
                  } else if (r == "Delete") {
                    setState(() {
                      film!.removeWhere((item) => item.id == film![index].id);
                    });
                    getFilm();
                  }
                },
                itemBuilder: (BuildContext context) {
                  return buttonChoice.map((r) {
                    return PopupMenuItem<String>(value: r, child: Text(r));
                  }).toList();
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Widget addItem(int? index) {
    return Container(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: title,
              decoration: InputDecoration(label: Text("Title")),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter title';
                }
                return null;
              },
            ),
            TextFormField(
              controller: overview,
              decoration: InputDecoration(label: Text("Overview")),
            ),
            TextFormField(
              controller: posterPath,
              decoration: InputDecoration(label: Text("Poster Path")),
            ),
            TextFormField(
              controller: voteAverage,
              decoration: InputDecoration(label: Text("Vote Average")),
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  if (index != null) {
                    film![index].id = film![index].id;
                    film![index].title = title.text;
                    film![index].overview = overview.text;
                    film![index].posterPath = posterPath.text;
                    film![index].voteAverage = double.tryParse(voteAverage.text) ?? 0.0;     
                    getFilm();
                    Navigator.pop(context);
                  }else {
                    int _id_film = film!.length + 1;
                    film!.add(
                      MovieModel(
                        id: _id_film,
                        title: title.text,
                        overview: overview.text,
                        posterPath: posterPath.text,
                        voteAverage: double.tryParse(voteAverage.text) ?? 0.0,
                      ),
                    );
                    getFilm();
                    Navigator.pop(context);
                  }
                }
              },
              child: Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
