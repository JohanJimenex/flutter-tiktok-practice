import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';
import 'package:toktik/presentation/shared/widgets/video_scrollable_view.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // DiscoverProvider discoverProvider = Provider.of<DiscoverProvider>(context);
    // DiscoverProvider discoverProvider = Provider.of<DiscoverProvider>(context, listen: false);// igual a .read
    DiscoverProvider discoverProvider = context.watch<DiscoverProvider>();

    return Scaffold(
      body: Center(
        child: (discoverProvider.loading == true)
            ? const CircularProgressIndicator()
            : VideoScrollableView(videosPosts: discoverProvider.listVideos),
      ),
    );
  }
}
