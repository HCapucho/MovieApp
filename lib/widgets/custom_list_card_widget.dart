import 'package:flutter/material.dart';
import 'package:movieapp/models/movie.dart';
import 'package:movieapp/pages/detail_page.dart';
import 'package:movieapp/utils/apis.utils.dart';

class CustomListCardWidget extends StatelessWidget {
  final Movie movie;

  const CustomListCardWidget({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => DetailPage(movie: movie),
                fullscreenDialog: true),
          );
        },
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.black54,
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius:
                    BorderRadius.horizontal(left: Radius.circular(15)),
                child: Hero(
                  tag: movie.id,
                  child: Image.network(
                    API.REQUEST_IMG(movie.posterPath),
                    loadingBuilder: (_, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return CircularProgressIndicator.adaptive();
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: Theme.of(context).textTheme.headline6,
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                      Spacer(),
                      Text('Popularidade ${movie.popularity}'),
                      SizedBox(height: 10),
                      Text('Nota ${movie.voteAverage}'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
