import '../custom_navigation_drawer.dart';
import 'package:flutter/material.dart';

class CollapsingNavigationDrawer extends StatefulWidget {
  const CollapsingNavigationDrawer({
    super.key,
    required this.isHidden,
  });

  final bool isHidden;

  @override
  CollapsingNavigationDrawerState createState() =>
      CollapsingNavigationDrawerState();
}

class CollapsingNavigationDrawerState extends State<CollapsingNavigationDrawer>
    with SingleTickerProviderStateMixin {
  double maxWidth = 210;
  double minWidth = 70;
  bool isCollapsed = true;
  late AnimationController _animationController;
  late Animation<double> leftAnimation;
  int currentSelectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    leftAnimation = Tween<double>(begin: maxWidth, end: minWidth)
        .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, _) => getWidget(context),
    );
  }

  Widget getWidget(context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      left: widget.isHidden ? -maxWidth : 0,
      width: isCollapsed ? minWidth : maxWidth,
      top: 0,
      bottom: 0,
      child: Material(
        elevation: 80.0,
        child: Container(
          width: leftAnimation.value,
          color: drawerBackgroundColor,
          child: Column(
            children: <Widget>[
              CollapsingListTile(
                title: 'Techie',
                icon: Icons.person,
                isCollapsed: isCollapsed,
              ),
              const Divider(
                color: Colors.grey,
                height: 40.0,
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, counter) {
                    return const Divider(height: 12.0);
                  },
                  itemBuilder: (context, counter) {
                    return CollapsingListTile(
                      onTap: () {
                        setState(() {
                          currentSelectedIndex = counter;
                        });
                      },
                      isSelected: currentSelectedIndex == counter,
                      title: navigationItems[counter].title,
                      icon: navigationItems[counter].icon,
                      isCollapsed: isCollapsed,
                    );
                  },
                  itemCount: navigationItems.length,
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isCollapsed = !isCollapsed;
                    isCollapsed
                        ? _animationController.reverse()
                        : _animationController.forward();
                  });
                },
                child: AnimatedIcon(
                  icon: AnimatedIcons.menu_close,
                  progress: _animationController,
                  color: selectedColor,
                  size: 50.0,
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
