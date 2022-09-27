import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:instagram_clon/ui/theme/colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height) / 8;
    final double itemWidth = size.width / 4;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Row(
            children: [
              const Text(
                'brayanhenaor0',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Icon(Icons.keyboard_arrow_down_outlined, size: 18),
              Container(
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                  color: AppColors.red,
                  shape: BoxShape.circle,
                ),
              )
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.add_box_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: [
            const ProfileInformation(),
            const EditProfile(),
            TabBar(
              indicatorColor: AppColors.white,
              tabs: const [
                Tab(icon: Icon(Icons.grid_on)),
                Tab(icon: Icon(Icons.person_pin_outlined)),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  GridView.count(
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
                            image:
                                'https://picsum.photos/200/400?random=$index',
                            placeholder: 'assets/img-placeholder.jpeg',
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
                  GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                    childAspectRatio: (itemWidth / itemHeight),
                    children: List.generate(
                      4,
                      (index) {
                        return SizedBox(
                          height: 400,
                          width: 1,
                          child: FadeInImage.assetNetwork(
                            image:
                                'https://picsum.photos/200/400?random=$index+26',
                            placeholder: 'assets/img-placeholder.jpeg',
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class EditProfile extends StatelessWidget {
  const EditProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF262626),
              ),
              child: Text(
                'Editar perfil',
                style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(0),
              backgroundColor: Color(0xFF262626),
            ),
            child: Icon(
              Icons.person_add,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileInformation extends StatelessWidget {
  const ProfileInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const CircleAvatar(
                radius: 45,
                backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/42150335?v=4'),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Brayan Henao',
                style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              )
            ],
          ),
          Flexible(
            child: Column(
              children: [
                Text(
                  '2',
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Publicacfsdfsdfdsfsdiones',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Column(
              children: [
                Text(
                  '41',
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Seguidores',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Column(
              children: [
                Text(
                  '226',
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Seguidos',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
