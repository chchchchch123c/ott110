import 'package:flutter/material.dart';
import 'package:ott110/common/base_screen.dart';
import 'package:ott110/common/colors.dart';
import 'package:ott110/presentation/provider/nav_provider/search_provider.dart';

class SearchScreen extends BaseScreen<SearchProvider> {
  SearchScreen({super.key}) : super(provider: searchProvider);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text('검색', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),),
      ),);
  }
}