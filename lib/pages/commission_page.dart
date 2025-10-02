import 'package:flutter/material.dart';
import '../utils/constants.dart';

class CommissionPage extends StatefulWidget {
  const CommissionPage({super.key});

  @override
  State<CommissionPage> createState() => _CommissionPageState();
}

class _CommissionPageState extends State<CommissionPage> {
  final TextEditingController _priceController = TextEditingController();
  double? _commission;

  void _calculate() {
    final price = double.tryParse(_priceController.text) ?? 0;
    setState(() => _commission = price * 0.01); // 👈 العمولة 1%
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.dark,
        title: const Text(
          "حاسبة العمولة",
          style: TextStyle(color: Colors.white), // 👈 العنوان أبيض واضح
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ), // 👈 زر الرجوع أبيض
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            // بطاقة 1
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "بسم الله الرحمن الرحيم\nوأوفوا بعهد الله إذا عاهدتم ولا تنقضوا الأيمان...",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // بطاقة 2
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "بيع أو تأجير عقارك بعمولة 1% فقط في تداول",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // بطاقة 3 - الحاسبة
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "حساب العمولة",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _priceController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: "أدخل سعر البيع",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.dark,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: _calculate,
                      child: const Text(
                        "احسب",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    if (_commission != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Text(
                          "العمولة المستحقة: ${_commission!.toStringAsFixed(2)} ريال",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
