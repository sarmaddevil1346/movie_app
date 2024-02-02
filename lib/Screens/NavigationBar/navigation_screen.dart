import 'package:flutter/material.dart';
import 'package:movie_app/constants/colors.dart';

import '../home_screen/home_screen.dart';
import '../library_screen/library_screen.dart';
import '../search_movies/searching_movies.dart';

class NavigationWidget extends StatefulWidget {
  const NavigationWidget({Key? key}) : super(key: key);

  @override
  NavigationWidgetState createState() => NavigationWidgetState();
}

class NavigationWidgetState extends State<NavigationWidget> {
  final NavigationController controller = NavigationController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: controller.screens[controller.currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: controller.currentIndex,
        onDestinationSelected: (value) {
          setState(() {
            controller.currentIndex = value;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icons.home,
            label: "Home",
          ),
          NavigationDestination(
            icon: Icons.search,
            label: "Search",
          ),
          NavigationDestination(
            icon: Icons.library_books,
            label: "Library",
          ),
        ],
      ),
    );
  }
}

class NavigationController {
  int currentIndex = 0;

  final screens = [
    const HomeScreen(),
    const SearchingMovies(),
    const LibraryScreen(),
  ];
}

class NavigationDestination {
  final IconData icon;
  final String label;

  const NavigationDestination({required this.icon, required this.label});
}

class NavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onDestinationSelected;
  final List<NavigationDestination> destinations;

  const NavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.destinations,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 97,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          color: AppColors.navBarColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: destinations.asMap().entries.map((entry) {
          final index = entry.key;
          final destination = entry.value;

          return GestureDetector(
            onTap: () {
              onDestinationSelected(index);
            },
            child: Container(
              height: 43,
              width: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: selectedIndex == index
                    ? AppColors.linearGradient
                    : const LinearGradient(
                        colors: [Colors.transparent, Colors.transparent]),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    destination.icon,
                    color: selectedIndex == index ? Colors.white : Colors.grey,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    destination.label,
                    style: TextStyle(
                      color: selectedIndex == index
                          ? AppColors.whiteColor
                          : AppColors.whiteColor,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
