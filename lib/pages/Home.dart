import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:foodmonkey_project/models/Cat.dart';
import 'package:foodmonkey_project/utils/Constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTitleTaskbar('Tags'),
            Container(
              height: 150,
              child: Swiper(
                index: 0,
                itemCount: Constants.tags.length,
                itemBuilder: (context, index) {
                 final url = "http://localhost:3000/"+Constants.tags[index].image;
                  return Image.network(
                    url?? "",
                    fit: BoxFit.contain,
                  );
                },
                // autoplay: true,
                scrollDirection: Axis.horizontal,
                pagination: SwiperPagination(alignment: Alignment.centerRight),
                control: SwiperControl(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            _buildTitleTaskbar('Categories'),
             Expanded( 
               child: GridView.builder(
                itemCount: Constants.cats.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5
                ),
                itemBuilder: (context, index) => _buildCategoryCard(Constants.cats[index]),
                ),
             )
          ],
        ),
      ),
    );
  }
}

Widget _buildTitleTaskbar(text) {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: const BoxDecoration(
        color: Constants.secondary,
        borderRadius: BorderRadius.only(topRight: Radius.circular(80))),
    child: Text(
      text,
      style: const TextStyle(
          fontSize: 35, color: Constants.normal, fontWeight: FontWeight.bold),
    ),
  );
}

Widget _buildCategoryCard(Cat cat) {
  final url = "http://localhost:3000/"+cat.image;
  return Card(
    child: Column(
      children: [
        Text(cat.name),
        SizedBox(height: 10,),
        Container(
          height: 90,
          child: Image.network(url)),
      ],
    ),
  );
}
