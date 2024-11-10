import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          backgroundColor: const Color(0xFFF5F7FB),
          drawer: constraints.maxWidth < 768 ? _buildDrawer() : null,
          body: SafeArea(
            child: _buildResponsiveLayout(constraints),
          ),
        );
      },
    );
  }

  Widget _buildResponsiveLayout(BoxConstraints constraints) {
    if (constraints.maxWidth < 768) {
      return _buildMobileLayout();
    } else if (constraints.maxWidth < 1200) {
      return _buildTabletLayout();
    }
    return _buildDesktopLayout();
  }

  Widget _buildDrawer() {
    return Drawer(
      elevation: 0,
      backgroundColor: Colors.white,
      child: _buildNavigationPanel(isDrawer: true),
    );
  }

  Widget _buildNavigationPanel({bool isDrawer = false}) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: isDrawer ? 40 : 20,
      ),
      child: Column(
        children: [
          _buildUserProfile(),
          const SizedBox(height: 32),
          _buildNavigationItems(),
        ],
      ),
    );
  }

  Widget _buildUserProfile() {
    return Column(
      children: const [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('assets/police_avatar.png'),
        ),
        SizedBox(height: 16),
        Text(
          'Officer John Doe',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Badge No: 12345',
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildNavigationItems() {
    return Column(
      children: [
        _buildNavItem(Icons.dashboard, 'Dashboard', true),
        _buildNavItem(Icons.cases_outlined, 'Cases', false),
        _buildNavItem(Icons.people_outline, 'Personnel', false),
        _buildNavItem(Icons.analytics_outlined, 'Analytics', false),
        _buildNavItem(Icons.settings_outlined, 'Settings', false),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        _buildMobileAppBar(),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildMobileStatsCards(),
                const SizedBox(height: 24),
                _buildRecentActivities(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  PreferredSizeWidget _buildMobileAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: const Text(
        'Dashboard Overview',
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_outlined, color: Colors.black),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildMobileStatsCards() {
    return Column(
      children: [
        _buildStatCard('Active Cases', '24', Colors.blue, Icons.folder_open),
        const SizedBox(height: 16),
        _buildStatCard(
            'Pending Reports', '08', Colors.orange, Icons.description),
        const SizedBox(height: 16),
        _buildStatCard('Solved Cases', '156', Colors.green, Icons.check_circle),
      ],
    );
  }

  Widget _buildTabletLayout() {
    return Row(
      children: [
        SizedBox(
          width: 220,
          child: _buildNavigationPanel(),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: 24),
                _buildTabletStatsGrid(),
                const SizedBox(height: 24),
                _buildRecentActivities(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTabletStatsGrid() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.5,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _buildStatCard('Active Cases', '24', Colors.blue, Icons.folder_open),
        _buildStatCard(
            'Pending Reports', '08', Colors.orange, Icons.description),
        _buildStatCard('Solved Cases', '156', Colors.green, Icons.check_circle),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 280,
          child: _buildNavigationPanel(),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: 24),
                _buildDesktopStatsRow(),
                const SizedBox(height: 24),
                _buildRecentActivities(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopStatsRow() {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
              'Active Cases', '24', Colors.blue, Icons.folder_open),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildStatCard(
              'Pending Reports', '08', Colors.orange, Icons.description),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildStatCard(
              'Solved Cases', '156', Colors.green, Icons.check_circle),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Dashboard Overview',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.notifications_outlined),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildNavItem(IconData icon, String title, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.transparent,
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: isSelected ? Colors.blue : Colors.grey,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.blue : Colors.grey[700],
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        onTap: () {},
      ),
    );
  }

  Widget _buildStatCard(
      String title, String value, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 30),
          const SizedBox(height: 16),
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentActivities() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recent Activities',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) => _buildActivityItem(),
        ),
      ],
    );
  }

  Widget _buildActivityItem() {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.article, color: Colors.blue),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Case Report Updated',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Case #2345 has been updated with new evidence',
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Text(
            '2h ago',
            style: TextStyle(
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}
