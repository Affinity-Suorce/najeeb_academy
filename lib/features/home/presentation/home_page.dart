import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:najeeb_academy/app/constants/colors.dart';
import 'package:najeeb_academy/features/home/presentation/widgets/bottom_section.dart';
import 'package:najeeb_academy/features/home/presentation/widgets/program_section.dart';
import 'package:najeeb_academy/features/home/presentation/widgets/slider_section.dart';
import 'package:najeeb_academy/features/home/presentation/widgets/top_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LinkedScrollControllerGroup? _controllers;
  ScrollController? _back;
  ScrollController? _front;
  @override
  void initState() {
    super.initState();

    _controllers = LinkedScrollControllerGroup();
    _back = _controllers!.addAndGet();
    _front = _controllers!.addAndGet();
  }

  @override
  void dispose() {
    _back?.dispose();
    _front?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _Backlayer(
            scrollController: _back,
          ),
          _FrontLayer(
            scrollController: _front,
          ),
        ],
      ),
    );
  }
}

class _Backlayer extends StatelessWidget {
  _Backlayer({Key? key, this.scrollController}) : super(key: key);
  final ScrollController? scrollController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        controller: scrollController,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              color: AppColors.indigo,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 2,
            )
          ],
        ),
      ),
    );
  }
}

class _FrontLayer extends StatelessWidget {
  _FrontLayer({Key? key, this.scrollController}) : super(key: key);
  final ScrollController? scrollController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        controller: scrollController,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(12, 40, 12, 0),
              child: TopSection(),
            ),
            SizedBox(
              height: 24,
            ),
            SliderSection(),
            SizedBox(
              height: 24,
            ),
            ProgramSection(),
            SizedBox(
              height: 24,
            ),
            HomePageBottomSection(),
            SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
