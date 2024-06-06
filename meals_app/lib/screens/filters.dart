// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:meals_app/providers/filter_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class filters_screen extends ConsumerWidget {
  const filters_screen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final acitve_filters = ref.watch(filterprovider);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Your filters"),
        ),
        body: Column(
          children: [
            SwitchListTile(
              value: acitve_filters[Filter.glutenFree]!,
              onChanged: (ischecked) {
                ref
                    .read(filterprovider.notifier)
                    .set_filter(Filter.glutenFree, ischecked);
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
              value: acitve_filters[Filter.lactoseFree]!,
              onChanged: (ischecked) {
                ref
                    .read(filterprovider.notifier)
                    .set_filter(Filter.lactoseFree, ischecked);
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
              value: acitve_filters[Filter.vegetarian]!,
              onChanged: (ischecked) {
                ref
                    .read(filterprovider.notifier)
                    .set_filter(Filter.vegetarian, ischecked);
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
              value: acitve_filters[Filter.vegan]!,
              onChanged: (ischecked) {
                ref
                    .read(filterprovider.notifier)
                    .set_filter(Filter.vegan, ischecked);
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
        ));
  }
}
