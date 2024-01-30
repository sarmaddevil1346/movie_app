import 'package:flutter/material.dart';
import 'package:movie_app/Screens/home_screen/home_screen.dart';

import '../library_screen/library_screen.dart';
import '../search_movies/searching_movies.dart';

class NavigationWidget extends StatefulWidget {
  const NavigationWidget({Key? key}) : super(key: key);

  @override
  _NavigationWidgetState createState() => _NavigationWidgetState();
}

class _NavigationWidgetState extends State<NavigationWidget> {
  final NavigationController controller = NavigationController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Wrap the BottomNavigationBar in a Container for customization
      body: controller.screens[controller.currentIndex],
      bottomNavigationBar: Container(
        height: 100,
        decoration: const BoxDecoration(
          // Apply border radius to the top-left and top-right corners
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(23),
            topRight: Radius.circular(23),
          ),
        ),
        // Use your custom NavigationBar widget
        child: NavigationBar(
          elevation: 0,
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
          color: const Color.fromRGBO(56, 64, 73, 1),
        ),
      ),
    );
  }
}

class NavigationController {
  int currentIndex = 0;

  final screens = [
    const HomeScreen(),
    const SearchingMovies(),
    LibraryScreen()
  ];
}

class NavigationDestination {
  final IconData icon;
  final String label;

  const NavigationDestination({required this.icon, required this.label});
}

class NavigationBar extends StatelessWidget {
  final double elevation;
  final int selectedIndex;
  final Function(int) onDestinationSelected;
  final List<NavigationDestination> destinations;
  final Color color;

  const NavigationBar({
    Key? key, // Add 'Key?' to the constructor
    required this.elevation,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.destinations,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: elevation,
      currentIndex: selectedIndex,
      backgroundColor: color,
      onTap: onDestinationSelected,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      items: destinations.map((destination) {
        return BottomNavigationBarItem(
          icon: IconWithText(icon: destination.icon, text: destination.label),
          label: '',
        );
      }).toList(),
    );
  }
}

class IconWithText extends StatelessWidget {
  final IconData icon;
  final String text;

  const IconWithText({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 8),
        Text(text),
      ],
    );
  }
}
