import 'package:astrobin_app/model/search_title/model_search_title.dart';
import 'package:astrobin_app/ui/search_for_title/search_for_title_state.dart';
import 'package:astrobin_app/ui/search_for_title/search_title_bloc.dart';
import 'package:astrobin_app/ui/widget/model_widgets.dart';
import 'package:astrobin_app/ui/widget/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchObjectWidget extends StatefulWidget {
  _SearchObjectWidgetState createState() => _SearchObjectWidgetState();
}

class _SearchObjectWidgetState extends State<SearchObjectWidget> {
  final _searchTitleBloc = kiwi.Container().resolve<SearchForTitleBloc>();
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: _searchTitleBloc,
      child: _buildScaffold(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _searchTitleBloc.dispose();
  }

  Scaffold _buildScaffold() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: SearchBar(),
      ),
      body: BlocBuilder(
        bloc: _searchTitleBloc,
        builder: (context, SearchForTitleState state) {
          if (state.isInitial) {
            return CenteredMessage(
              message: 'Empieza a buscar',
              icon: Icons.brightness_7,
            );
          }

          if (state.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state.isSuccessful) {
            return _buildResultList(state);
          } else {
            return CenteredMessage(
              message: state.error,
              icon: Icons.error_outline,
            );
          }
        },
      ),
    );
  }

  Widget _buildResultList(SearchForTitleState state) {
    return NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: ListView.builder(
        itemCount: _calculateListItemCount(state),
        controller: _scrollController,
        itemBuilder: (context, index) {
          return index >= state.searchResults.length
              ? _buildLoaderListItem()
              : _buildVideoListItemCard(state.searchResults[index]);
        },
      ),
    );
  }

  int _calculateListItemCount(SearchForTitleState state) {
    if (state.hasReachedEndOfResults) {
      return state.searchResults.length;
    } else {
      return state.searchResults.length + 1;
    }
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification &&
        _scrollController.position.extentAfter == 0) {
      _searchTitleBloc.fetchNextResultPage();
    }
    return false;
  }

  Widget _buildVideoListItemCard(SearchTitleItem astro) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                astro.url_regular,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 5),
            Text(
              astro.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            SizedBox(height: 5),
            Text(
              astro.description,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoaderListItem() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
