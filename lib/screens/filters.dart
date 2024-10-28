import 'package:flutter/material.dart';
import 'package:mealsapp/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      //drawer: MainDrawer(onSelectedScreen: (identifier) {
      //  Navigator.of(context).pop();
      //  if (identifier == 'meals') {
      //    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => const TabsScreen()));
      //  }
      //}),
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilters[Filter.glutenFree]!, 
            onChanged: (isCheckd) {
              ref.read(filtersProvider.notifier).setFilter(Filter.glutenFree, isCheckd);
            },
            title: Text('Gluten-Free',style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface
            ),),
            subtitle: Text('Only include gluten-free meals',style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface
            ),),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.lactoseFree]!, 
            onChanged: (isCheckd) {
              ref.read(filtersProvider.notifier).setFilter(Filter.lactoseFree, isCheckd);
            },
            title: Text('Lactose-Free',style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface
            ),),
            subtitle: Text('Only include lactose-free meals',style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface
            ),),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegetarian]!, 
            onChanged: (isCheckd) {
              ref.read(filtersProvider.notifier).setFilter(Filter.vegetarian, isCheckd);
            },
            title: Text('Vegetarian',style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface
            ),),
            subtitle: Text('Only include vegetarian meals',style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface
            ),),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegan]!, 
            onChanged: (isCheckd) {
              ref.read(filtersProvider.notifier).setFilter(Filter.vegan, isCheckd);
            },
            title: Text('Vegan',style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface
            ),),
            subtitle: Text('Only include vegan meals',style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface
            ),),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34, right: 22),
          ),
        ],
      ),
    );
  }
}