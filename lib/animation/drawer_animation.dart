import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class DrawerAnimation extends StatefulWidget {
  const DrawerAnimation({super.key});

  @override
  State<DrawerAnimation> createState() => _DrawerAnimationState();
}

class _DrawerAnimationState extends State<DrawerAnimation> {
  Widget page = MainScreen();
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuScreen: Builder(builder: (context) {
        return MenuScreen(
          onPageChanged: (a) {
            setState(() {
              page = a;
            });
            ZoomDrawer.of(context)!.close();
          },
        );
      }),
      mainScreen: page,
      borderRadius: 24.00,
      showShadow: true,
      drawerShadowsBackgroundColor: Colors.grey[300]!,
      menuBackgroundColor: Colors.indigo,
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        leading: IconButton(
            onPressed: () {
              ZoomDrawer.of(context)!.toggle();
            },
            icon: Icon(Icons.menu)),
      ),
    );
  }
}

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
        leading: IconButton(
            onPressed: () {
              ZoomDrawer.of(context)!.toggle();
            },
            icon: Icon(Icons.menu)),
      ),
    );
  }
}

class MenuScreen extends StatelessWidget {
  MenuScreen({super.key, required this.onPageChanged});
  final Function(Widget) onPageChanged;
  List<ListItems> drawerItems = [
    ListItems(
        icon: Icon(Icons.payment),
        title: Text("Payment"),
        page: PaymentScreen()),
    ListItems(
      icon: Icon(Icons.home),
      title: Text("Home"),
      page: MainScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Theme(
          data: ThemeData.dark(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: drawerItems
                .map((e) => ListTile(
              onTap: (){
                onPageChanged(e.page);
              },
                      title: e.title,
                      leading: e.icon,
                    ))
                .toList(),
          )),
    );
  }
}

class ListItems {
  final Icon icon;
  final Text title;
  final Widget page;

  ListItems({required this.icon, required this.title, required this.page});
}
