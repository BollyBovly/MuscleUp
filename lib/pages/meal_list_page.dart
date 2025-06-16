import 'package:flutter/material.dart';
import 'package:musleapp/design/colors.dart';

class MealListPage extends StatelessWidget {
  final List<Map<String, dynamic>> meals = [
    {
      'title': 'Овсянка с греческим йогуртом и бананом',
      'ingredients': ['Овсянка — 100 г', 'Йогурт — 100 г', 'Банан — 1 шт.'],
      'kcal': 242.2,
      'protein': 23.8,
      'fat': 6.7,
      'carbs': 84.8
    },
    {
      'title': 'Рис с курицей и салатом айсберг',
      'ingredients': ['Рис — 100 г', 'Курица — 150 г', 'Салат айсберг — 30 г', 'Специи — по вкусу'],
      'kcal': 381.7,
      'protein': 49.5,
      'fat': 5.7,
      'carbs': 28.6
    },
    {
      'title': 'Творог с ягодами/орехами',
      'ingredients': ['Творог — 150 г', 'Ягоды/орехи — 30 г'],
      'kcal': 328.8,
      'protein': 31.8,
      'fat': 21.9,
      'carbs': 9.1
    },
    {
      'title': 'Омлет или яичница',
      'ingredients': ['Яйца — 2 шт.', 'Молоко — 100 мл (если омлет)'],
      'kcal': 185.0,
      'protein': 16.4,
      'fat': 11.0,
      'carbs': 6.1
    },
    {
      'title': 'Макароны с курицей и руколой',
      'ingredients': ['Макароны — 70 г', 'Курица — 150 г', 'Рукола — 30 г', 'Специи — по вкусу'],
      'kcal': 346.7,
      'protein': 50.8,
      'fat': 6.4,
      'carbs': 18.6
    },
    {
      'title': 'Хлопья кукурузные с молоком',
      'ingredients': ['Хлопья — 40 г', 'Молоко — 150 мл'],
      'kcal': 209.0,
      'protein': 7.9,
      'fat': 1.9,
      'carbs': 41.1
    },
    {
      'title': 'Рис с фаршем и салатом айсберг',
      'ingredients': ['Рис — 100 г', 'Фарш — 150 г', 'Салат айсберг — 30 г,', 'Специи — по вкусу'],
      'kcal': 339.7,
      'protein': 33.0,
      'fat': 7.8,
      'carbs': 28.6
    },
    {
      'title': 'Макароны с сыром и фаршем и листьями шпината',
      'ingredients': ['Макароны — 70 г', 'Фарш — 150 г', 'Сыр — 50 г', 'Шпинат — 20 г', 'Специи — по вкусу'],
      'kcal': 476.8,
      'protein': 46.6,
      'fat': 22.3,
      'carbs': 18.9
    },
    {
      'title': 'Рис с индейкой и салатом айсберг',
      'ingredients': ['Рис — 100 г', 'Индейка — 150 г', 'Салат айсберг — 30 г', 'Специи — по вкусу'],
      'kcal': 336.7,
      'protein': 46.5,
      'fat': 1.8,
      'carbs': 28.6
    },
    {
      'title': 'Макароны с индейкой и салатом айсберг',
      'ingredients': ['Макароны — 70 г', 'Индейка — 150 г', 'Салат айсберг — 30 г', 'Специи — по вкусу'],
      'kcal': 298.4,
      'protein': 47.3,
      'fat': 2.3,
      'carbs': 18.1
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
                      const Text('Ингредиенты:', style: TextStyle(fontWeight: FontWeight.bold)),
                      ...meal['ingredients'].map<Widget>((ingredient) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2),
                            child: Text(ingredient),
                          )),
                      const SizedBox(height: 12),
                      const Text('КБЖУ (на порцию):', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Калории: ${meal['kcal']} ккал'),
                      Text('Белки: ${meal['protein']} г'),
                      Text('Жиры: ${meal['fat']} г'),
                      Text('Углеводы: ${meal['carbs']} г'),
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