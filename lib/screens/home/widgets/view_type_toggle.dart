import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../home_store.dart';

class ViewTypeToggle extends StatelessWidget {
  final HomeStore store;

  const ViewTypeToggle({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => IconButton(
        icon: Icon(
          store.isGridView ? Icons.list : Icons.grid_view,
        ),
        onPressed: store.toggleViewType,
        tooltip: store.isGridView ? 'Show as list' : 'Show as grid',
      ),
    );
  }
} 