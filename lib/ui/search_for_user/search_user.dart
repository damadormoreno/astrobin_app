import 'package:astrobin_app/model/search_title/model_search_title.dart';
import 'package:astrobin_app/ui/search_for_title/detail/detail_search_for_title.dart';
import 'package:astrobin_app/ui/search_for_user/search_user_bloc.dart';
import 'package:astrobin_app/ui/search_for_user/search_user_state.dart';
import 'package:astrobin_app/ui/widget/model_widgets.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchUserWidget extends StatefulWidget {
  @override
  _SearchUserWidgetState createState() => _SearchUserWidgetState();
}

class _SearchUserWidgetState extends State<SearchUserWidget> {
  final _searchUserBloc = kiwi.Container().resolve<SearchUserBloc>();
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: _searchUserBloc,
      child: _buildScaffold(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _searchUserBloc.dispose();
  }

  Scaffold _buildScaffold() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: SearchBar(
          isSearchUser: true,
        ),
      ),
      body: BlocBuilder(
        bloc: _searchUserBloc,
        builder: (context, SearchUserState state) {
          if (state.isInitial) {
            return CenteredMessage(
              message: 'Empieza a buscar',
              icon: Icons.people,
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

  Widget _buildResultList(SearchUserState state) {
    return NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: ListView.builder(
        itemCount: _calculateListItemCount(state),
        controller: _scrollController,
        itemBuilder: (context, index) {
          return index >= state.searchResults.length
              ? _buildLoaderListItem()
              : _buildImageListItem(state.searchResults[index]);
        },
      ),
    );
  }

  int _calculateListItemCount(SearchUserState state) {
    if (state.hasReachedEndOfResults) {
      return state.searchResults.length;
    } else {
      return state.searchResults.length + 1;
    }
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification &&
        _scrollController.position.extentAfter == 0) {
      _searchUserBloc.fetchNextUserResultPage();
    }
    return false;
  }

  Widget _buildImageListItem(SearchTitleItem astro) {
    return GestureDetector(
      child: _buildImageListItemCard(astro),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) {
            return DetailSearchForTitle(
              astroItem: astro,
            );
          }),
        );
      },
    );
  }

  Widget _buildImageListItemCard(SearchTitleItem astro) {
    return Card(
      color: Colors.grey.shade50,
      elevation: 4,
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
                fontSize: 20,
              ),
            ),
            SizedBox(height: 5),
            Text(
              astro.description,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
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
