import "package:bill_and_balance/utilities/helpers/snackbar_helper.dart";
import "package:flutter/material.dart";
import "package:bill_and_balance/components/custom_app_bar/custom_app_bar.dart";
import "package:bill_and_balance/components/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart";
import "package:go_router/go_router.dart";
import "package:intl/intl.dart";
import "package:bill_and_balance/models/receipt_model.dart";





final List<ReceiptModel> sampleReceipts = [
  ReceiptModel(
    id: "receipt-1",
    date: DateTime.now().subtract(Duration(days: 1)).toIso8601String(),
    amount: 80.00,
    category: "Groceries",
    merchant: "Whole Foods",
    notes: "Weekly shopping",
    imagePath: "/path/to/image1.jpg",
    createdAt: DateTime.now().toIso8601String(),
    updatedAt: DateTime.now().toIso8601String(),
  ),
  ReceiptModel(
    id: "receipt-2",
    date: DateTime.now().subtract(Duration(days: 2)).toIso8601String(),
    amount: 45.50,
    category: "Entertainment",
    merchant: "Netflix",
    imagePath: "/path/to/image2.jpg",
    createdAt: DateTime.now().toIso8601String(),
    updatedAt: DateTime.now().toIso8601String(),
  ),
  ReceiptModel(
    id: "receipt-3",
    date: DateTime.now().subtract(Duration(days: 3)).toIso8601String(),
    amount: 120.00,
    category: "Utilities",
    merchant: "Electric Company",
    notes: "Monthly bill",
    isShared: true,
    imagePath: "/path/to/image3.jpg",
    createdAt: DateTime.now().toIso8601String(),
    updatedAt: DateTime.now().toIso8601String(),
  ),
  ReceiptModel(
    id: "receipt-4",
    date: DateTime.now().subtract(Duration(days: 5)).toIso8601String(),
    amount: 25.99,
    category: "Transport",
    merchant: "Uber",
    imagePath: "/path/to/image4.jpg",
    createdAt: DateTime.now().toIso8601String(),
    updatedAt: DateTime.now().toIso8601String(),
  ),
  ReceiptModel(
    id: "receipt-5",
    date: DateTime.now().subtract(Duration(days: 7)).toIso8601String(),
    amount: 156.75,
    category: "Shopping",
    merchant: "Amazon",
    notes: "New headphones and books",
    imagePath: "/path/to/image5.jpg",
    createdAt: DateTime.now().toIso8601String(),
    updatedAt: DateTime.now().toIso8601String(),
  ),
];



class ReceiptPage extends StatelessWidget {
  const ReceiptPage({super.key});

  static Widget route({required BuildContext context, required GoRouterState state}) {
    return Scaffold(
      backgroundColor: Color(0xfffff9f3),
      appBar: CustomAppBar(),
      body: ReceiptPage(),
      bottomNavigationBar: CustomBottomNavigationBar(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        SnackBarHelper.showInfo(context, "Add Receipt feature coming soon!");
      }, backgroundColor: Color(0xd0e5bc90), child: Icon(Icons.add),),
    );
  }

  @override
  Widget build(BuildContext context) {
    return sampleReceipts.isEmpty
        ? _EmptyState()
        : ReceiptList(receipts: sampleReceipts);
  }
}

// Receipt List Widget (Modular & Reusable)
class ReceiptList extends StatelessWidget {
  final List<ReceiptModel> receipts;

  const ReceiptList({super.key, required this.receipts});

  @override
  Widget build(BuildContext context) {
    return
      ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        itemCount: receipts.length,
        itemBuilder: (context, index) {
          return ReceiptListItem(receipt: receipts[index]);
        },
      );
  }
}

// Receipt List Item Widget (Modular & Reusable)
class ReceiptListItem extends StatelessWidget {
  final ReceiptModel receipt;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const ReceiptListItem({
    super.key,
    required this.receipt,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 10),
      elevation: 1,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _CategoryBadge(category: receipt.category),
                    SizedBox(height: 5),
                    _MerchantName(merchant: receipt.merchant),
                    SizedBox(height: 3),
                    if (receipt.notes != null && receipt.notes!.isNotEmpty)
                      _ReceiptNotes(notes: receipt.notes!),
                    _ReceiptDate(date: receipt.date),
                    if (receipt.isShared) _SharedIndicator(),
                  ],
                ),
              ),
              SizedBox(width: 10),
              _ReceiptAmount(amount: receipt.amount),
            ],
          ),
        ),
      );
  }

}

// Category Badge Widget (Reusable)
class _CategoryBadge extends StatelessWidget {
  final String category;

  const _CategoryBadge({required this.category});

  Color _getCategoryColor() {
    switch (category.toLowerCase()) {
      case 'groceries':
        return Colors.green;
      case 'utilities':
        return Colors.blue;
      case 'entertainment':
        return Colors.purple;
      case 'transport':
        return Colors.orange;
      case 'shopping':
        return Colors.pink;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _getCategoryColor();
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Text(
        category,
        style: TextStyle(
          fontSize: 10,
          color: Colors.black87,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

// Merchant Name Widget (Reusable)
class _MerchantName extends StatelessWidget {
  final String? merchant;

  const _MerchantName({this.merchant});

  @override
  Widget build(BuildContext context) {
    return Text(
      merchant ?? "Unknown Merchant",
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    );
  }
}

// Receipt Notes Widget (Reusable)
class _ReceiptNotes extends StatelessWidget {
  final String notes;

  const _ReceiptNotes({required this.notes});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 3, bottom: 3),
      child: Text(
        notes,
        style: TextStyle(fontSize: 14, color: Colors.black54),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

// Receipt Date Widget (Reusable)
class _ReceiptDate extends StatelessWidget {
  final String date;

  const _ReceiptDate({required this.date});

  String _formatDate(String dateString) {
    final date = DateTime.parse(dateString);
    return DateFormat('MMM dd, yyyy • hh:mm a').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5),
      child: Text(
        _formatDate(date),
        style: TextStyle(fontSize: 11, color: Colors.black45),
      ),
    );
  }
}

// Shared Indicator Widget (Reusable)
class _SharedIndicator extends StatelessWidget {
  const _SharedIndicator();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5),
      child: Row(
        children: [
          Icon(Icons.people, size: 14, color: Colors.blue),
          SizedBox(width: 4),
          Text(
            "Shared expense",
            style: TextStyle(fontSize: 11, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}

// Receipt Amount Widget (Reusable)
class _ReceiptAmount extends StatelessWidget {
  final double amount;

  const _ReceiptAmount({required this.amount});

  @override
  Widget build(BuildContext context) {
    return Text(
      "\$${amount.toStringAsFixed(2)}",
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }
}

// Empty State Widget (Reusable)
class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.receipt_long, size: 80, color: Colors.grey[300]),
          SizedBox(height: 16),
          Text(
            "No receipts yet",
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Tap the + button to add your first receipt",
            style: TextStyle(fontSize: 14, color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }
}
