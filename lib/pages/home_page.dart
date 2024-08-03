import 'package:buildcraft/pages/add.dart';
import 'package:buildcraft/pages/base/challenges.dart';
import 'package:buildcraft/pages/base/home.dart';
import 'package:buildcraft/pages/base/profile.dart';
import 'package:buildcraft/services/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void _onTap(int i) {
    setState(() {
      _currentIndex = i;
    });
  }

  final List<Widget> _pages = [
    const Home(),
    const Challenges(),
    const Profile()
  ];
  FirebaseAuthService firebaseAuthService = FirebaseAuthService();

  @override
  Widget build(BuildContext context) {
    final snackBarContext = ScaffoldMessenger.of(context);
    return Scaffold(
      floatingActionButton: _currentIndex == 0
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                onPressed: () {
                  // showDialog(
                  //     context: context,
                  //     builder: (context) {
                  //       return Dialog(
                  //         child: Container(
                  //           decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  //           height: MediaQuery.sizeOf(context).height * 0.9,
                  //           width: MediaQuery.sizeOf(context).width,
                  //           child: Padding(
                  //             padding: const EdgeInsets.all(8.0),
                  //             child: Text('bruh'),
                  //           ),
                  //         ),
                  //       );
                  //     });
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => Add(),
                    ),
                  );
                },
                child: const Icon(Icons.add),
              ),
            )
          : null,
      appBar: AppBar(
        title: Text(['Home', 'Projects', 'Profile'][_currentIndex]),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings_rounded))
        ],
      ),
      drawer: Drawer(
        width: MediaQuery.sizeOf(context).width * 0.7,
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          child: Column(
            children: [
              const Spacer(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.logout_rounded),
                  style: ElevatedButton.styleFrom(elevation: 7),
                  onPressed: () async {
                    await firebaseAuthService.signOut();
                    snackBarContext.showSnackBar(const SnackBar(
                      content: Text('Successfully logged out!'),
                    ));
                  },
                  label: Text(
                    'Logout',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTap,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_rounded,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.task_alt_rounded,
              ),
              label: 'Projects'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_rounded,
              ),
              label: 'Profile'),
        ],
      ),
    );
  }
}
