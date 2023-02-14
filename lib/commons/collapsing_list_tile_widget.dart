import '../custom_navigation_drawer.dart';
import 'package:flutter/material.dart';

class CollapsingListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback? onTap;
  final bool isCollapsed;

  const CollapsingListTile({
    super.key,
    required this.title,
    required this.icon,
    this.isSelected = false,
    this.isCollapsed = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          color: isSelected
              ? Colors.transparent.withOpacity(0.3)
              : Colors.transparent,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 400),
              left: isCollapsed ? 0 : 50,
              top: 0,
              bottom: 0,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 400),
                opacity: isCollapsed ? 0 : 1,
                child: Center(
                  child: Text(
                    isCollapsed ? '' : title,
                    style: isSelected
                        ? listTitleSelectedTextStyle
                        : listTitleDefaultTextStyle,
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Icon(
                  icon,
                  color: isSelected ? selectedColor : Colors.white30,
                  size: 38.0,
                ),
                AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  child: SizedBox(width: isCollapsed ? 0 : 10),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
