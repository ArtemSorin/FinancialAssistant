import 'package:flutter/material.dart';
import 'package:tinkoff/data/themes/colors.dart';
import 'package:tinkoff/presentation/screens/login.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Возврат на предыдущую страницу
          },
        ),
        title: Text(
          'Профиль',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 40),
            // Иконка профиля
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: yellow, // Желтый круг
                child: Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Имя и фамилия
            const Center(
              child: Text(
                'Алина', // Замените на актуальные данные
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            // Контейнер с данными
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: _buildDataContainer(),
            ),
            SizedBox(height: 20),
            // Второй контейнер
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: _buildSecondContainer(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataContainer() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildDataRow(Icons.phone, '+79899999999'),
          Divider(height: 32, thickness: 1, color: Colors.grey[300]),
          _buildDataRow(Icons.email, 'example@gmail.com'),
          Divider(height: 32, thickness: 1, color: Colors.grey[300]),
          _buildDataRow(Icons.location_on, 'Москва, Россия'),
        ],
      ),
    );
  }

  Widget _buildSecondContainer(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity, // Кнопка на всю ширину контейнера
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: yellow,
                padding: EdgeInsets.symmetric(vertical: 16),
                textStyle: TextStyle(fontSize: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Выход из аккаунта",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDataRow(IconData icon, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: yellow, // Желтый круг
          child: Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
