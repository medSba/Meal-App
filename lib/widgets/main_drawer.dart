import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.inversePrimary,
              Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.8),
            ])
          ),
          child: Row(children: [
            Icon(Icons.fastfood,
            size: 45,
            color: Theme.of(context).colorScheme.primary,),
            const SizedBox(width: 15,),
            Text('Coking Up...',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
            ),

          ],),),
          Text('Meals',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
