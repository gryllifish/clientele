import 'package:clients_app/core/theme/app_colors.dart';
import 'package:clients_app/features/clients/presentation/widgets/clients_section.dart';
import 'package:clients_app/features/clients/presentation/widgets/home_header.dart';
import 'package:clients_app/features/clients/presentation/widgets/home_top_bar.dart';
import 'package:clients_app/shared/widgets/app_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: AppBottomNav(current: AppTab.home),
        body: CustomScrollView(
          slivers: [
            SliverSafeArea(
              bottom: false,
              sliver: SliverToBoxAdapter(
                child: Column(children: [HomeTopBar(), HomeHeader()]),
              ),
            ),
            SliverToBoxAdapter(child: ClientsSection()),
            // Keeps the white sheet going when the content is short.
            SliverFillRemaining(
              hasScrollBody: false,
              child: ColoredBox(color: AppColors.surface),
            ),
          ],
        ),
      ),
    );
  }
}
