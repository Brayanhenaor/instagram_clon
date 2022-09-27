import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:instagram_clon/ui/theme/colors.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height) / 6.2;
    final double itemWidth = size.width / 4;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: TextField(
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none,
              ),
              fillColor: AppColors.lightGrey,
              filled: true,
              hintText: 'Search',
              prefixIcon: Icon(Icons.search, color: AppColors.white),
            ),
            style: TextStyle(color: AppColors.white),
          ),
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(
              const Duration(seconds: 2),
            );
          },
          child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            childAspectRatio: (itemWidth / itemHeight),
            children: List.generate(
              100,
              (index) {
                return SizedBox(
                  height: 400,
                  width: 1,
                  child: FadeInImage.assetNetwork(
                    image: 'https://picsum.photos/200/400?random=$index',
                    placeholder: 'assets/img-placeholder.jpeg',
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
