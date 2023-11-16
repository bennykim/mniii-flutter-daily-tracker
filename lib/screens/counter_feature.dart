import 'package:flutter/material.dart';
import 'package:mniii_flutter_daily_tracker/widgets/round_button_widget.dart';
import 'package:mniii_flutter_daily_tracker/widgets/nested_icon_box_widget.dart';

class CounterFeature extends StatefulWidget {
  const CounterFeature({super.key});

  @override
  State<CounterFeature> createState() => _CounterFeatureState();
}

class _CounterFeatureState extends State<CounterFeature> {
  int total = 50000;

  void increasePrice() {
    setState(() {
      total += 10;
    });
  }

  void decreasePrice() {
    setState(() {
      total -= 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181818),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 80),
                child: _WelcomeText(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 120),
                child: _TotalBalanceText(balance: total),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: _PriceControlButtons(
                  onIncrease: increasePrice,
                  onDecrease: decreasePrice,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 50),
                child: _WalletSection(),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: _WalletIconBoxes(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _WalletIconBoxes extends StatelessWidget {
  const _WalletIconBoxes();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const NestedIconBoxWidget(
          name: 'Euro',
          code: 'EUR',
          amount: '6 428',
          icon: Icons.euro_rounded,
          isInverted: false,
        ),
        Transform.translate(
          offset: const Offset(0, -20),
          child: const NestedIconBoxWidget(
            name: 'BitConin',
            code: 'BTC',
            amount: '9 785',
            icon: Icons.currency_bitcoin,
            isInverted: true,
          ),
        ),
        Transform.translate(
          offset: const Offset(0, -40),
          child: const NestedIconBoxWidget(
            name: 'Dollar',
            code: 'USD',
            amount: '428',
            icon: Icons.attach_money_outlined,
            isInverted: false,
          ),
        ),
      ],
    );
  }
}

class _WalletSection extends StatelessWidget {
  const _WalletSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Wallets',
          style: TextStyle(
            color: Colors.white,
            fontSize: 36,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          'View All',
          style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}

class _PriceControlButtons extends StatelessWidget {
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const _PriceControlButtons(
      {required this.onIncrease, required this.onDecrease});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RoundButtonWidget(
          text: 'Decrease',
          bgColor: const Color(0xFFF1B33B),
          textColor: Colors.black,
          onClick: onDecrease,
        ),
        RoundButtonWidget(
          text: 'Increase',
          bgColor: const Color(0xFF1F2123),
          textColor: Colors.white,
          onClick: onIncrease,
        ),
      ],
    );
  }
}

class _TotalBalanceText extends StatelessWidget {
  final int balance;

  const _TotalBalanceText({
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Total Balance',
          style: TextStyle(
            fontSize: 22,
            color: Colors.white.withOpacity(0.6),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          '$balance',
          style: const TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class _WelcomeText extends StatelessWidget {
  const _WelcomeText();

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.topRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'Hey, mniii',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            'Welcome~',
            style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 0.6),
              fontSize: 18,
            ),
          )
        ],
      ),
    );
  }
}
