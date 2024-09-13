import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: Column(
            children: [
              TopBar(),
              SizedBox(height: 10),
              WelcomeText(),
              SizedBox(height: 20),
              ProgressContainer(percentage: "76%"),
              SizedBox(height: 15),
              CategoryText(),
              FeatureCardGrid(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: const TextStyle(fontSize: 0),
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: const TextStyle(fontSize: 0),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled, size: 18, color: Colors.black),
              label: '',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_box_rounded,
                  size: 45,
                  color: Colors.lightGreen,
                ),
                label: ''),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined,
                  size: 18, color: Colors.black),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Home",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search_outlined),
              color: Colors.black,
            ),
            const SizedBox(width: 10),
            const CircleAvatar(
              radius: 25,
              backgroundColor: Colors.lightGreen,
              child: Icon(Icons.person, color: Colors.white, size: 30),
            ),
          ],
        ),
      ],
    );
  }
}

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.topLeft,
      child: Text(
        "Welcome to\nMediTrack",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 40,
          height: 1,
        ),
      ),
    );
  }
}

class ProgressContainer extends StatelessWidget {
  final String percentage;
  const ProgressContainer({
    super.key,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    final double progress = double.parse(percentage.replaceAll('%', '')) / 100;
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.2,
      width: size.width,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Track your Progress",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    "View your daily task progress at a glance",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              // Image.asset(""),  // add an image
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                percentage,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              SizedBox(
                height: 5,
                width: double.infinity,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(2.5),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: progress,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.lightGreen,
                          borderRadius: BorderRadius.circular(2.5),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class CategoryText extends StatelessWidget {
  const CategoryText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.topLeft,
      child: Text(
        "Drug Category",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
    );
  }
}

class FeatureCardGrid extends StatelessWidget {
  const FeatureCardGrid({super.key});

  @override
  Widget build(BuildContext context) {
    // data for each grid
    final List<Map<String, dynamic>> gridData = [
      {
        'image': "inventory",
        'title': "Inventory",
        'completedTasks': 9,
        'totalTasks': 24
      },
      {
        'image': "manage",
        'title': "Manage",
        'completedTasks': 4,
        'totalTasks': 18
      },
      {
        'image': "prioritize",
        'title': "Prioritize",
        'completedTasks': 3,
        'totalTasks': 15
      },
      {
        'image': "urgent",
        'title': "Urgent",
        'completedTasks': 9,
        'totalTasks': 11
      },
    ];

    return Expanded(
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 5,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          return GridCard(
            image: gridData[index]['image'],
            title: gridData[index]['title'],
            completedTasks: gridData[index]['completedTasks'],
            totalTasks: gridData[index]['totalTasks'],
          );
        },
      ),
    );
  }
}

class GridCard extends StatelessWidget {
  final String image;
  final String title;
  final int completedTasks;
  final int totalTasks;

  const GridCard({
    super.key,
    required this.image,
    required this.title,
    required this.completedTasks,
    required this.totalTasks,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.2,
      width: size.width * 0.45,
      child: Card(
        color: Colors.grey.shade300,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child:
                        Image.asset("assets/images/${image}.png", height: 45),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TaskProgressBar(
                      completedTasks: completedTasks,
                      totalTasks: totalTasks,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text("$completedTasks/$totalTasks tasks"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TaskProgressBar extends StatelessWidget {
  final int completedTasks;
  final int totalTasks;

  const TaskProgressBar({
    super.key,
    required this.completedTasks,
    required this.totalTasks,
  });

  @override
  Widget build(BuildContext context) {
    final double progress = completedTasks / totalTasks;

    return SizedBox(
      height: 5,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2.5),
            ),
          ),
          FractionallySizedBox(
            widthFactor: progress,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
