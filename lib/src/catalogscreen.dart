import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cartmodel.dart';
import 'catalogmodel.dart';

class MyCatalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Activiteiten kiezen'),
        //style: Theme.of(context).textTheme.headline1),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward_outlined),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          ),
        ],
      ),
      body: Container(
        decoration: new BoxDecoration(color: Colors.orange[300]),
        child: Column(
          children: new List.generate(
              CatalogModel.itemNames.length, (index) => _MyListItem(index)),
        ),
      ),
    );
  }
}

class _MyListItem extends StatelessWidget {
  final int index;

  _MyListItem(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var item = context.select<CatalogModel, Item>(
      // Here, we are only interested in the item at [index]. We don't care
      // about any other change.
      (catalog) => catalog.getById(index), //was eerst position
    );
    var isInCart = context.select<CartModel, bool>(
      // Here, we are only interested whether [item] is inside the cart.
      (cart) => cart.items.contains(item),
    );

    Color _getColor(BuildContext context) {
      return isInCart //
          ? Theme.of(context).primaryColor
          : Colors.black54;
    }

    TextStyle? _getTextStyle(BuildContext context) {
      if (isInCart) return null;

      return TextStyle(
        color: Colors.black54,
        decoration: TextDecoration.lineThrough,
      );
    }

    return ListTile(
      onTap: () {
        var cart = context.read<CartModel>();
        if (!isInCart) {
          cart.add(item);
        }
        if (isInCart) {
          cart.remove(item);
        }
      },

      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        foregroundColor: Colors.white70,
        child: Text(item.name[0]), //product.name[0]),
      ),
      title: Text(item.name, style: _getTextStyle(context)),
//      trailing: _AddButton(item: item),
    );
  }
}
