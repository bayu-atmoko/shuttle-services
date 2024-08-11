import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:home/home/presentation/pages/assigned_report_page.dart';
import 'package:home/home/presentation/pages/cancel_report_page.dart';
import 'package:home/home/presentation/pages/cleaned_report_page.dart';
import 'package:home/home/presentation/pages/finish_report_page.dart';
import 'package:home/home/presentation/pages/new_report_page.dart';
import 'package:home/home/presentation/widgets/tab_view_header.dart';

import '../cubit/home_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.userRole,
  });

  final String userRole;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with
        MorphemeStatePage<HomePage, HomeCubit>,
        SingleTickerProviderStateMixin {
  @override
  HomeCubit setCubit() => locator<HomeCubit>()..initialData(widget.userRole);

  late TabController tabController;
  late List<int> _pages;
  late List<Widget> tabs;
  late List<Widget> pageView;
  int indexTabActive = 0;
  late bool isOfficer;

  @override
  void initState() {
    super.initState();

    isOfficer =
        widget.userRole.orEmpty().toLowerCase() == UserRoleEnum.petugas.value;

    /// petugas user
    if (isOfficer) {
      _pages = [0, 1, 2, 3];
      tabController = TabController(vsync: this, length: _pages.length);

      pageView = const [
        AssignedReportPage(),
        CleanedReportPage(),
        FinishReportPage(),
        CancelReportPage(),
      ];

      /// masyarakat user
    } else {
      _pages = [0, 1, 2, 3, 4];
      tabController = TabController(vsync: this, length: _pages.length);

      pageView = const [
        NewReportPage(),
        AssignedReportPage(),
        CleanedReportPage(),
        FinishReportPage(),
        CancelReportPage(),
      ];
    }
  }

  @override
  Widget buildWidget(BuildContext context) {
    /// petugas user
    if (isOfficer) {
      tabs = [
        TabViewHeader(
          title: context.s.assigned,
          isActive: tabController.index == 0,
        ),
        TabViewHeader(
          title: context.s.cleaned,
          isActive: tabController.index == 1,
        ),
        TabViewHeader(
          title: context.s.finish,
          isActive: tabController.index == 2,
        ),
        TabViewHeader(
          title: context.s.cancel,
          isActive: tabController.index == 3,
        ),
      ];

      /// masyarakat user
    } else {
      tabs = [
        TabViewHeader(
          title: context.s.newReport,
          isActive: tabController.index == 0,
        ),
        TabViewHeader(
          title: context.s.assigned,
          isActive: tabController.index == 1,
        ),
        TabViewHeader(
          title: context.s.cleaned,
          isActive: tabController.index == 2,
        ),
        TabViewHeader(
          title: context.s.finish,
          isActive: tabController.index == 3,
        ),
        TabViewHeader(
          title: context.s.cancel,
          isActive: tabController.index == 4,
        ),
      ];
    }

    return MorphemeScrollViewWithAppBar(
      tittle: context.s.historyReport,
      titleSpacing: MorphemeSizes.s16,
      isExpanded: false,
      isScroll: false,
      floatingActionButton: isOfficer
          ? null
          : FloatingActionButton(
              onPressed: () => context.read<HomeCubit>().onAddPressed(context),
              child: const Icon(Icons.add),
            ),
      child: Column(
        children: [
          TabBar(
            tabAlignment: TabAlignment.start,
            controller: tabController,
            labelColor: context.color.primaryDark,
            indicatorWeight: 0.1,
            indicatorColor: Colors.transparent,
            indicatorSize: TabBarIndicatorSize.tab,
            unselectedLabelColor: context.color.grey,
            isScrollable: true,
            padding: const EdgeInsets.only(
              left: MorphemeSizes.s10,
              right: MorphemeSizes.s10,
              top: MorphemeSizes.s16,
              bottom: MorphemeSizes.s6,
            ),
            labelPadding: const EdgeInsets.symmetric(
              horizontal: MorphemeSizes.s4,
            ),
            tabs: tabs,
            onTap: (value) {
              context.read<HomeCubit>().onPageChanged(value);
              setState(() {
                indexTabActive = value;
              });
            },
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: pageView,
            ),
          ),
        ],
      ),
    );
  }
}
