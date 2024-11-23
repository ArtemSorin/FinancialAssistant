import 'package:flutter/material.dart';

class DetailFinancialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xF5F5F5F5),
      appBar: AppBar(title: const Text("Финансовый ассистент")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const Text(
              "Финассистент",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Один из самых важных факторов достижения финансового благополучия — планирование бюджета.",
            ),
            const SizedBox(height: 16),
            _buildBudgetInfo(),
            const SizedBox(height: 16),
            _buildWalletInfo(),
            const SizedBox(height: 16),
            _buildIdeaContainer(
              title: 'Кредит',
              description:
                  'В случае наличия нескольких источников кредитной нагрузки, рекомендуется воспользоваться рефинансированием',
              buttonText: 'Открыть счет',
              context: context,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailFinancialScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            _buildActionsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildBudgetInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 2))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Оценка", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text("14 834.92", style: TextStyle(fontSize: 24)),
          const SizedBox(height: 8),
          LinearProgressIndicator(value: 0.8, color: Colors.green),
        ],
      ),
    );
  }

  Widget _buildWalletInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 2))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Кошелёк", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text("60 000 ₽", style: TextStyle(fontSize: 24)),
          const SizedBox(height: 8),
          const Text("0 ₽ сбережений"),
        ],
      ),
    );
  }

  Widget _buildCreditInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Кредит", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text("Рекомендуется рефинансирование."),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Рефинансировать"),
          ),
        ],
      ),
    );
  }

  Widget _buildActionsSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          ..._buildActionRows(),
        ],
      ),
    );
  }

  List<Widget> _buildActionRows() {
    final List<Map<String, dynamic>> actions = [
      {
        "title": "Инвестиции",
        "subtitle": "Получай пассивный доход",
        "icon": Icons.trending_up
      },
      {
        "title": "Копить",
        "subtitle":
            """• Вклад\n• Инвестикопилка\n• Накопление\n• Premium\n• Подписка Pro""",
        "icon": Icons.savings
      },
      {
        "title": "Подписки",
        "subtitle": "Больше выгоды",
        "icon": Icons.subscriptions,
        "showColorBlocks": true
      },
      {
        "title": "Можно...",
        "subtitle": "Т—Ж: журнал про ваши деньги",
        "icon": Icons.book,
        "cardColor": Colors.grey[800],
        "textColor": Colors.white
      },
    ];

    List<Widget> rows = [];
    for (var i = 0; i < actions.length; i += 2) {
      rows.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (i < actions.length)
              _buildActionItem(
                actions[i]["title"],
                actions[i]["subtitle"],
                actions[i]["icon"],
                showColorBlocks: actions[i]["showColorBlocks"] ?? false,
                cardColor: actions[i]["cardColor"],
                textColor: actions[i]["textColor"],
              ),
            if (i + 1 < actions.length)
              _buildActionItem(
                actions[i + 1]["title"],
                actions[i + 1]["subtitle"],
                actions[i + 1]["icon"],
                showColorBlocks: actions[i + 1]["showColorBlocks"] ?? false,
                cardColor: actions[i + 1]["cardColor"],
                textColor: actions[i + 1]["textColor"],
              ),
          ],
        ),
      );
    }
    return rows;
  }

  Widget _buildActionItem(String title, String subtitle, IconData icon,
      {bool showColorBlocks = false, Color? cardColor, Color? textColor}) {
    return Flexible(
      // <-- Added Flexible widget
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: textColor ?? Colors.black,
                ),
              ),
              SizedBox(height: 8),
              if (subtitle.isNotEmpty)
                Text(
                  subtitle,
                  style:
                      TextStyle(fontSize: 14, color: textColor ?? Colors.black),
                ),
              if (showColorBlocks) ...[
                SizedBox(height: 8),
                Row(
                  children: [
                    _colorBlock(Colors.yellow),
                    _colorBlock(Colors.blue),
                    _colorBlock(Colors.pinkAccent),
                    _colorBlock(Colors.lightBlueAccent),
                  ],
                ),
              ],
            ],
          ),
        ),
        color: cardColor ?? Colors.white,
      ),
    );
  }

  Widget _colorBlock(Color color) {
    return Container(
      width: 20,
      height: 20,
      margin: EdgeInsets.only(right: 4),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  Widget _buildIdeaContainer({
    required BuildContext context,
    required String title,
    required String description,
    required String buttonText,
    required VoidCallback onPressed,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Color(0xFFE3F2FD), Color(0xFFBBDEFB)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(fontSize: 14, color: Colors.black54),
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.33,
              child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  backgroundColor: const Color(0xFF2196F3),
                ),
                child: Text(
                  buttonText,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
