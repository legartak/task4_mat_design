import 'package:flutter/material.dart';

class BingusPreviewPage extends StatelessWidget {
  const BingusPreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BINGUS PAGE (preview)'),
      ),
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: SizedBox(
            height: 150,
            width: 150,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const BingusPage())
                );
              },
              child: const Hero(
                tag: 'bingus1',
                child: Image(
                  image: AssetImage('images/ActualBingus.webp'),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BingusPage extends StatelessWidget {
  const BingusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BINGUS PAGE'),
      ),
      body: const Center(
        child: Column(
          children: [
            Hero(
              tag: 'bingus1',
              child:
              Image(image: AssetImage('images/ActualBingus.webp')),
            ),
            Text(
              'Just Bingus. Just cute. Just cat',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}