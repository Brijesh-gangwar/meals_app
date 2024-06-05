import 'package:flutter/material.dart';
// import 'package:meals_app/screens/tabs.dart';
// import 'package:meals_app/widgets/main_drawer.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class filters_screen extends StatefulWidget {
  const filters_screen({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;

  @override
  State<filters_screen> createState() => _filters_screenState();
}

class _filters_screenState extends State<filters_screen> {
  var gluten_free_filter_set = false;
  var lactose_free_filter_set = false;
  var vegeterian_filter_set = false;
  var vegan_filter_set = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gluten_free_filter_set = widget.currentFilters[Filter.glutenFree]!;
    lactose_free_filter_set = widget.currentFilters[Filter.lactoseFree]!;
    vegeterian_filter_set = widget.currentFilters[Filter.vegetarian]!;
    vegan_filter_set = widget.currentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your filters"),
      ),
     
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: gluten_free_filter_set,
            Filter.lactoseFree: lactose_free_filter_set,
            Filter.vegetarian: vegeterian_filter_set,
            Filter.vegan: vegan_filter_set,
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              value: gluten_free_filter_set,
              onChanged: (ischecked) {
                setState(() {
                  gluten_free_filter_set = ischecked;
                });
              },
              title: Text(
                "Gluten free",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                "only glutten free meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                left: 34,
                right: 22,
              ),
            ),
            SwitchListTile(
              value: lactose_free_filter_set,
              onChanged: (ischecked) {
                setState(() {
                  lactose_free_filter_set = ischecked;
                });
              },
              title: Text(
                "lactose free",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                "only lactose free meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                left: 34,
                right: 22,
              ),
            ),
            SwitchListTile(
              value: vegeterian_filter_set,
              onChanged: (ischecked) {
                setState(() {
                  vegeterian_filter_set = ischecked;
                });
              },
              title: Text(
                "vegeterian",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                "only vegeterian meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                left: 34,
                right: 22,
              ),
            ),
            SwitchListTile(
              value: vegan_filter_set,
              onChanged: (ischecked) {
                setState(() {
                  vegan_filter_set = ischecked;
                });
              },
              title: Text(
                "vegan",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                "only vegan meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                left: 34,
                right: 22,
              ),
            )
          ],
        ),
      ),
    );
  }
}
