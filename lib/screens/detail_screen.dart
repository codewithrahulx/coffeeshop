import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/coffee.dart';
import '../state/app_state.dart';
import '../utils/app_colors.dart';
import '../widgets/coffee_card.dart';
import '../widgets/size_selector.dart';

class DetailScreen extends StatefulWidget {
  final Coffee coffee;
  const DetailScreen({super.key, required this.coffee});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String _size = 'M';
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final coffee = widget.coffee;
    final state = context.watch<AppState>();
    final price = AppState.priceFor(coffee, _size);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, size: 20),
                    onPressed: () => Navigator.pop(context),
                  ),
                  IconButton(
                    icon: Icon(
                      state.isFav(coffee.id) ? Icons.favorite : Icons.favorite_border,
                      color: state.isFav(coffee.id) ? Colors.red : AppColors.dark,
                    ),
                    onPressed: () => context.read<AppState>().toggleFav(coffee.id),
                  ),
                ],
              ),
              Center(
                child: Container(
                  width: 280,
                  height: 280,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: 24, offset: Offset(0, 10)),
                    ],
                  ),
                  child: ClipOval(child: CoffeeImage(path: coffee.image)),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(coffee.name,
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 4),
                      Text(coffee.subtitle,
                          style: const TextStyle(color: AppColors.grey, fontSize: 12)),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const SizedBox(width: 4),
                      Text('${coffee.rating}',
                          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                      Text(' (${coffee.reviews})',
                          style: const TextStyle(color: AppColors.grey, fontSize: 12)),
                    ],
                  ),
                ],
              ),
              const Divider(height: 32),
              const Text('Description',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              Text(
                coffee.description,
                maxLines: _expanded ? null : 3,
                overflow: _expanded ? TextOverflow.visible : TextOverflow.ellipsis,
                style: const TextStyle(color: Color(0xFF666666), height: 1.5, fontSize: 13),
              ),
              GestureDetector(
                onTap: () => setState(() => _expanded = !_expanded),
                child: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    _expanded ? 'Read Less' : 'Read More',
                    style: const TextStyle(
                      color: AppColors.button,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Size', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              const SizedBox(height: 12),
              SizeSelector(selected: _size, onChanged: (s) => setState(() => _size = s)),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: Colors.black12)),
          ),
          child: Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Price', style: TextStyle(color: AppColors.grey, fontSize: 12)),
                  Text('\$${price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: AppColors.button,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      )),
                ],
              ),
              const SizedBox(width: 24),
              Expanded(
                child: SizedBox(
                  height: 52,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.button,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
                    ),
                    onPressed: () {
                      context.read<AppState>().addToCart(coffee, _size);
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(SnackBar(
                          content: Text('${coffee.name} ($_size) added to cart'),
                          duration: const Duration(seconds: 2),
                        ));
                    },
                    child: const Text('Buy Now',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
