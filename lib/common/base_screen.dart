import 'package:flutter/material.dart';

abstract class BaseScreen<T extends ChangeNotifier> extends StatefulWidget {
  const BaseScreen({super.key, required this.provider});

  final T provider;

  void initState(BuildContext context) {}

  Widget build(BuildContext context);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {

  void updateScreen() => setState(() {});

  @override
  void initState() {
    super.initState();
    widget.initState(context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.provider.addListener(updateScreen);
    },);
  }

  @override
  void dispose() {
    super.dispose();
    widget.provider.removeListener(updateScreen);
  }

  @override
  Widget build(BuildContext context) => widget.build(context);
}

abstract class BaseScreen2<T1 extends ChangeNotifier, T2 extends ChangeNotifier> extends StatefulWidget {
  const BaseScreen2({super.key, required this.provider1, required this.provider2});

  final T1 provider1;
  final T2 provider2;

  void initState(BuildContext context) {}

  Widget build(BuildContext context);

  @override
  State<BaseScreen2> createState() => _BaseScreen2State();
}

class _BaseScreen2State extends State<BaseScreen2> {

  void updateScreen() => setState(() {});

  @override
  void initState() {
    super.initState();
    widget.initState(context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.provider1.addListener(updateScreen);
      widget.provider2.addListener(updateScreen);
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.provider1.removeListener(updateScreen);
    widget.provider2.removeListener(updateScreen);
  }

  @override
  Widget build(BuildContext context) => widget.build(context);
}