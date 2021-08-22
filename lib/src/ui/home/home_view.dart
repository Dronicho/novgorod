import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_map/src/theme/novgorod_icons_icons.dart';
import 'package:test_map/src/ui/home/screens/map/bloc/map_bloc.dart';
import 'package:test_map/src/ui/home/screens/map/map_view.dart';
import 'package:test_map/src/ui/home/screens/routes/routes_view.dart';

import 'screens/add_route/add_route_select.dart';
import 'screens/profile/profile_view.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late PageController _controller;
  int _index = 1;

  final _pages = <Widget>[
    AuthProtected(child: ProfileView()),
    Mapview(),
    RoutesView()
  ];

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: PageView.builder(
          itemCount: _pages.length,
          itemBuilder: (context, index) {
            _index = index;
            return _pages[index];
          },
          controller: _controller,
          allowImplicitScrolling: false,
          physics: NeverScrollableScrollPhysics(),
        ),
        floatingActionButton: _index == 1
            ? FloatingActionButton(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => AuthProtected(
                            child: BlocProvider.value(
                              value: context.read<MapBloc>(),
                              child: AddRouteSelectPage(
                                onComplete: () {
                                  context.read<MapBloc>().loadPoints();
                                },
                              ),
                            ),
                          )));
                },
                child: const Icon(Icons.add),
              )
            : null,
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context).primaryColor,
          currentIndex: _index,
          onTap: (index) {
            setState(() {
              _index = index;
            });
            _controller.jumpToPage(index);
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: 'Профиль'),
            BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Карта'),
            BottomNavigationBarItem(
                icon: Icon(NovgorodIcons.route), label: 'Маршруты'),
          ],
        ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
