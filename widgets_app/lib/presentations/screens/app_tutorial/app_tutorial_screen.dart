import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:animate_do/animate_do.dart';
class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;
  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
    'Busca la comida',
    'Exercitation labore anim sunt commodo tempor et dolor magna Lorem ea.',
    'assets/images/1.png',
  ),
  SlideInfo(
    'Entrega rápida',
    'Sint sit commodo consectetur do irure ut magna minim.',
    'assets/images/2.png',
  ),
  SlideInfo(
    'Disfruta la comida',
    'Labore et excepteur ex esse mollit do magna nulla pariatur voluptate fugiat.',
    'assets/images/3.png',
  ),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageviewController = PageController();

  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageviewController.addListener(() {
      final page = pageviewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        //El botón se mostrará al llegar a última página
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    /// Libera los recursos utilizados por el controlador del PageView cuando ya no se necesita.
    pageviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageviewController,
            physics: const BouncingScrollPhysics(),
            children:
                slides
                    .map(
                      (slideData) => _Slide(
                        title: slideData.title,
                        caption: slideData.caption,
                        imageUrl: slideData.imageUrl,
                      ),
                    )
                    .toList(),
          ),

          Positioned(
            right: 20,
            top: 20,
            child: TextButton(
              child: const Text('Salir'),
              onPressed: () => context.pop(),
            ),
          ),

          endReached
              ? Positioned(
                bottom: 30,
                right: 30,
                child: FadeInRight(
                  from:15,
                  delay: const Duration(milliseconds: 250),
                  child: FilledButton(
                    onPressed: () => context.pop(),
                    child: Text('Comenzar'),
                  ),
                ),
              )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(title, style: titleStyle),
            const SizedBox(height: 10),
            Text(caption, style: captionStyle),
          ],
        ),
      ),
    );
  }
}
