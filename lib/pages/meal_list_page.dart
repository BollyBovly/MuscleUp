import 'package:flutter/material.dart';
import 'package:musleapp/design/colors.dart';

class MealListPage extends StatelessWidget {
  final List<Map<String, dynamic>> meals = [
    {
      'title': 'Овсянка с греческим йогуртом и бананом',
      'ingredients': ['Овсянка — 50 г', 'Йогурт — 100 г', 'Банан — 1 шт.']
    },
    {
      'title': 'Рис с курицей + салат айсберг',
      'ingredients': ['Рис — 100 г', 'Курица — 150 г', 'Салат айсберг — 50 г', 'Специи — по вкусу']
    },
    {
      'title': 'Творог с ягодами/орехами',
      'ingredients': ['Творог — 150 г', 'Ягоды/орехи — 30 г']
    },
    {
      'title': 'Омлет или яичница',
      'ingredients': ['Яйца — 2 шт.', 'Молоко — 30 мл (если омлет)']
    },
    {
      'title': 'Макароны с курицей + рукола',
      'ingredients': ['Макароны — 100 г', 'Курица — 150 г', 'Рукола — 30 г', 'Специи — по вкусу']
    },
    {
      'title': 'Хлопья кукурузные с молоком',
      'ingredients': ['Хлопья — 40 г', 'Молоко — 150 мл']
    },
    {
      'title': 'Рис с фаршем + салат айсберг',
      'ingredients': ['Рис — 100 г', 'Фарш — 150 г', 'Салат айсберг — 50 г,', 'Специи — по вкусу']
    },
    {
      'title': 'Макароны с сыром и фаршем + листья шпината',
      'ingredients': ['Макароны — 100 г', 'Фарш — 150 г', 'Сыр — 30 г', 'Шпинат — 20 г', 'Специи — по вкусу']
    },
    {
      'title': 'Рис с индейкой + салат айсберг',
      'ingredients': ['Рис — 100 г', 'Индейка — 150 г', 'Салат айсберг — 50 г', 'Специи — по вкусу']
    },
    {
      'title': 'Макароны с индейкой + салат айсберг',
      'ingredients': ['Макароны — 100 г', 'Индейка — 150 г', 'Салат айсберг — 50 г', 'Специи — по вкусу']
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Список блюд'),
        backgroundColor: backgroundColor,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: meals.length,
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final meal = meals[index];
          return Material(
            color: Colors.white,
            elevation: 2,
            borderRadius: BorderRadius.circular(12),
            child: ListTile(
              title: Text(meal['title'], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              trailing: const Icon(Icons.info_outline),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              onTap: () => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: backgroundColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  title: Text(meal['title'], style: const TextStyle(fontSize: 18)),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (String ingredient in meal['ingredients'])
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Text(ingredient),
                        ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Закрыть', style: TextStyle(color: textButtonColor),),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}