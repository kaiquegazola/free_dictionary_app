import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:free_dictionary/l10n/l10n.dart';
import 'package:free_dictionary/widgets/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:just_audio/just_audio.dart';

import 'details_store.dart';
import 'widgets/widgets.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    super.key,
    required this.word,
    required this.store,
  });

  final String word;
  final DetailsStore store;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final _audioPlayer = AudioPlayer();
  String? _currentAudioUrl;
  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(_handlePageChange);
    widget.store.loadWord(widget.word);
  }

  void _handlePageChange() {
    if (_pageController.page != null) {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _pageController.removeListener(_handlePageChange);
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _playAudio(String? audioUrl) async {
    if (audioUrl == null || audioUrl.isEmpty) return;

    try {
      if (_currentAudioUrl != audioUrl) {
        await _audioPlayer.setUrl(audioUrl);
        _currentAudioUrl = audioUrl;
      }
      await _audioPlayer.seek(Duration.zero);
      await _audioPlayer.play();
    } catch (e) {
      // Handle error silently
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.pop(),
        ),
        actions: [
          Observer(
            builder: (_) {
              return IconButton(
                icon: Icon(
                  widget.store.isFavorite ? Icons.favorite : Icons.favorite_border,
                ),
                onPressed: () => widget.store.toggleFavorite(widget.word),
              );
            },
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          if (widget.store.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (widget.store.hasNoInternet) {
            return NoInternetErrorWidget(
              onTryAgain: () => widget.store.loadWord(widget.word),
            );
          }

          if (widget.store.hasServerError) {
            return ServerErrorWidget(
              onTryAgain: () => widget.store.loadWord(widget.word),
            );
          }

          if (widget.store.hasNotFound) {
            return WordNotFound(
              word: widget.word,
              onBack: () => context.pop(),
            );
          }

          if (widget.store.words.isEmpty) {
            return Center(
              child: Text(l10n.noWordFound),
            );
          }

          return Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: widget.store.words.length,
                  itemBuilder: (context, index) {
                    final word = widget.store.words[index];
                    return SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            word.word,
                            style: Theme.of(context).textTheme.displaySmall,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          WordPhonetics(
                            phonetic: word.phonetic,
                            phonetics: word.phonetics,
                            onPlayAudio: _playAudio,
                          ),
                          const SizedBox(height: 32),
                          WordMeanings(meanings: word.meanings),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: Observer(
        builder: (_) {
          if (widget.store.isLoading ||
              widget.store.words.isEmpty ||
              widget.store.hasNoInternet ||
              widget.store.hasServerError ||
              widget.store.hasNotFound) {
            return const SizedBox.shrink();
          }

          return DetailsNavigationBar(
            currentPage: _currentPage,
            totalPages: widget.store.words.length,
            onNext: () {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            onPrevious: () {
              _pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          );
        },
      ),
    );
  }
}
