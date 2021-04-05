import 'package:flutter/material.dart';
import 'package:review_movies_app/pages/detail%20screen/details_screen.dart';
import 'package:review_movies_app/pages/popular%20screen/popular_view_model.dart';

class PopularView extends StatefulWidget {
  @override
  _PopularViewState createState() => _PopularViewState();
}

class _PopularViewState extends State<PopularView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.62,
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 30),
        itemCount: listItemPopular.length,
        itemBuilder: (context, index) {
          return _itemPopular(listItemPopular[index]);
        });
  }

  _itemPopular(ItemPopular itemPopular) {
    return InkWell(
      onTap: (){
        Route route=MaterialPageRoute(builder: (context)=>DetailsScreen());
        Navigator.push(context, route);
      },
      child: Column(
        children: [
          Expanded(
              flex: 5,
              child: Stack(
                alignment: Alignment(0.7, 0.95),
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(itemPopular.urlPhoto)
                        )
                    ),
                  ),
                  Text(itemPopular.releaseDate,
                      style: TextStyle(color: Colors.white))
                ],
              )),
          Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(top: 15),
                  child: Text(
                itemPopular.name,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              )))
        ],
      ),
    );
  }
}
