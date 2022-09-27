import 'package:flutter/material.dart';
import 'package:instagram_clon/ui/theme/colors.dart';

class Stories extends StatelessWidget {
  const Stories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => StoryItem(
          index: index,
        ),
      ),
    );
  }
}

class StoryItem extends StatelessWidget {
  final int index;

  const StoryItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF850F7A),
                  Color(0xFFD92842),
                  Color(0xFFCE9A3A),
                ],
              ),
            ),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: CircleAvatar(
                  radius: 35,
                  backgroundImage:
                      NetworkImage('https://picsum.photos/200?random=$index'),
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              'User $index',
              style: TextStyle(color: AppColors.white, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
