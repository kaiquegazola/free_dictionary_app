import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../home_store.dart';

class ViewTypeToggle extends StatelessWidget {
  const ViewTypeToggle({
    super.key,
    required this.store,
  });

  final HomeStore store;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => TextButton.icon(
        icon: Icon(
          store.isGridView ? Icons.list : Icons.grid_view,
        ),
        onPressed: store.toggleViewType,
        label: Text(
          store.isGridView ? 'Show as list' : 'Show as grid',
        ),
      ),
    );
  }
}
