import 'dart:async';

import 'package:flutter/material.dart';
import 'package:musicapp/feature/detail/view/home_card_detail_View.dart';

abstract class HomeCardDetailViewModel extends State<HomeCardDetailView>{

  double musicProgress = 0.0;
  Timer? _timer;
  int currentTimeInSeconds = 0;
  late final int totalMusicTimeInSeconds;
  bool isPlaying = false;
  var appbarTitleText = 'Now Playing';


  @override
  void initState() {
    super.initState();
    totalMusicTimeInSeconds = widget.model.playTime.toInt();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        currentTimeInSeconds++;
        musicProgress = currentTimeInSeconds / totalMusicTimeInSeconds;
        if (currentTimeInSeconds >= totalMusicTimeInSeconds) {
          _timer?.cancel();
        }
      });
    });
  }

  void toggleMusic() {
    setState(() {
      if (isPlaying) {
        _timer?.cancel();
      } else {
        _startTimer();
      }
      isPlaying = !isPlaying;
    });
  }

}