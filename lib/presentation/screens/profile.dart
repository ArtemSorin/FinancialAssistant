import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
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
        backgroundColor: Color(0xF6F6F6F6),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            // Иконка профиля
            CircleAvatar(
              radius: 60,
              backgroundColor: Color(0xFFFFC107), // Желтый круг
              child: Icon(
                Icons.person,
                size: 60,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            // Имя и фамилия
            Text(
              'Алина', // Замените на актуальные данные
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
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
              child: _buildSecondContainer(),
            ),
            Spacer(),
            // Кнопка выйти из приложения
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Действие на кнопку выхода
                  print("Выход из приложения");
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Выйти из приложения',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
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

  Widget _buildSecondContainer() {
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
      child: Center(
        child: Text(
          'Этот контейнер можно заполнить дополнительными данными',
          style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildDataRow(IconData icon, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.blue, // Желтый круг
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
