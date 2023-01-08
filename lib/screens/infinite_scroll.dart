import 'package:ejemplo/theme/app_theme.dart';
import 'package:flutter/material.dart';

class InfiniteScreen extends StatefulWidget {
  const InfiniteScreen({Key? key}) : super(key: key);

  @override
  State<InfiniteScreen> createState() => _InfiniteScreenState();
}

class _InfiniteScreenState extends State<InfiniteScreen> {
  final List<int> imageIds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final ScrollController scrollcontroller = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    scrollcontroller.addListener(() {
      if ((scrollcontroller.position.pixels + 500) >=
          scrollcontroller.position.maxScrollExtent) {
        // add5();
        fetchData();
      }
    });
  }

  Future fetchData() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 3));
    add5();
    isLoading = false;

    setState(() {});
    if ((scrollcontroller.position.pixels + 100) <=
        scrollcontroller.position.maxScrollExtent) return;
    scrollcontroller.animateTo(scrollcontroller.position.pixels + 120,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn);
  }

  void add5() {
    final imageId = imageIds.last;

    imageIds.addAll([1, 2, 3, 4, 5].map((e) => imageId + e));
    setState(() {});
  }

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 3));
    final imageId = imageIds.last;
    imageIds.clear();
    imageIds.add(imageId + 1);
    add5();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        RefreshIndicator(
          onRefresh: onRefresh,
          child: ListView.builder(
            controller: scrollcontroller,
            physics: const BouncingScrollPhysics(),
            itemCount: imageIds.length,
            itemBuilder: (BuildContext context, int i) {
              return FadeInImage(
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                  placeholder: const AssetImage('assets/jar-loading.gif'),
                  image: NetworkImage(
                      'https://picsum.photos/500/300?image=${imageIds[i]}'));
            },
          ),
        ),
        if (isLoading)
          Positioned(
              bottom: 40, left: size.width * 0.5 - 30, child: const _loading())
      ],
    ));
  }
}

class _loading extends StatelessWidget {
  const _loading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: 60,
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7), shape: BoxShape.circle),
      child: const CircularProgressIndicator(
        color: AppTheme.primary,
      ),
    );
  }
}
