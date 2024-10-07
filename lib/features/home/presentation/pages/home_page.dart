// presentation/pages/home_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/features/home/presentation/pages/character_page.dart';
import 'package:rickandmorty/features/screen/presentation/pages/location_page.dart';
import 'package:rickandmorty/features/screen_episode/presentation/pages/episode_page.dart';

class HomePageProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void updateIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomePageProvider(),
      child: Scaffold(
        body: Consumer<HomePageProvider>(
          builder: (context, provider, _) {
            final pages = [
              const CharacterPage(), // Убираем передачу getCharactersUseCase и getCharacterDetailUseCase
              const LocationPage(),
              const EpisodePage(),
            ];

            return pages[provider.selectedIndex];
          },
        ),
        bottomNavigationBar: Consumer<HomePageProvider>(
          builder: (context, provider, _) {
            return BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Characters',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.location_on),
                  label: 'Locations',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.tv),
                  label: 'Episodes',
                ),
              ],
              currentIndex: provider.selectedIndex,
              selectedItemColor: const Color(0xFF5C6BC0),
              onTap: provider.updateIndex,
            );
          },
        ),
      ),
    );
  }
}
