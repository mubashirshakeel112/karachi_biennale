import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:karachi_biennale/domain/models/artist_model.dart';
import 'package:karachi_biennale/repository/artist_repo.dart';
import 'package:karachi_biennale/service/vote_service.dart';

class ArtistController extends ChangeNotifier {
  final ArtistRepository _artistRepository = ArtistRepository();
  final VoteService _voteService = VoteService();

  List<ArtistModel> _artistData = [];
  List<ArtistModel> _filteredArtistData = [];
  Set<String> _votedArtistIds = {};
  bool _isLoading = false;
  Timer? _debounce; // 🔁 debounce timer
  String _searchQuery = '';

  List<ArtistModel> get artistData => _filteredArtistData;
  Set<String> get votedArtistIds => _votedArtistIds;
  bool get isLoading => _isLoading;
  String get searchQuery => _searchQuery;

  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> getArtistAndVotes() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    try {
      setLoading(true);
      _artistData = await _artistRepository.getArtist();
      _filteredArtistData = List.from(_artistData);
      _votedArtistIds = (await _voteService.getVotedArtistIds(userId)).toSet();
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setLoading(false);
    }
  }

  Future<void> vote(String userId, String artistId) async {
    await _voteService.voteArtist(userId, artistId);
    _votedArtistIds.add(artistId);
    notifyListeners();
  }

  final Set<String> unvotedArtistIds = {};

  Future<void> unvote(String userId, String artistId) async {
    await _voteService.unvoteArtist(userId, artistId);
    _votedArtistIds.remove(artistId);
    unvotedArtistIds.add(artistId);
    notifyListeners();
  }

  void filterArtists(String query) {
    _searchQuery = query;
    if (query.isEmpty) {
      _filteredArtistData = List.from(_artistData);
    } else {
      _filteredArtistData = _artistData
          .where((artist) => artist.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

}
