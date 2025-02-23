import 'package:ecommerce_admin/features/edit_product/bloc/edit_product_bloc.dart';
import 'package:flutter/material.dart';

class EditProductPage extends StatefulWidget {
  final String name;
  final String description;
  final double price;
  final String status;
  final String productId;
  const EditProductPage(
      {super.key,
      required this.name,
      required this.description,
      required this.price,
      required this.status,
      required this.productId});

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  String name = '';
  String description = '';
  double price = 0;
  String status = '';

  TextEditingController namecontroller = TextEditingController();

  TextEditingController desccontroller = TextEditingController();

  TextEditingController pricecontroller = TextEditingController();

  TextEditingController statuscontroller = TextEditingController();
  final EditProductBloc editProductBloc = EditProductBloc();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    namecontroller.text = widget.name;
    desccontroller.text = widget.description;
    statuscontroller.text = widget.status;
    pricecontroller.text = widget.price.toString();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit a Product'),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                key: const ValueKey('name'),
                controller: namecontroller,
                decoration: const InputDecoration(hintText: 'Enter Product Name'),
                onSaved: (newValue) {
                  setState(() {
                    name = newValue ?? '';
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Name';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                key: const ValueKey('desc'),
                controller: desccontroller,
                decoration:
                    const InputDecoration(hintText: 'Enter Product Description'),
                onSaved: (newValue) {
                  setState(() {
                    description = newValue ?? '';
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Description';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                key: const ValueKey('price'),
                controller: pricecontroller,
                decoration: const InputDecoration(hintText: 'Enter Product Price'),
                onSaved: (newValue) {
                  setState(() {
                    price = double.parse(newValue ?? '0');
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Price';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                key: const ValueKey('status'),
                controller: statuscontroller,
                decoration: const InputDecoration(hintText: 'Enter Product Status'),
                onSaved: (newValue) {
                  setState(() {
                    status = newValue ?? '';
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Status';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                  height: 50,
                  width: double.maxFinite,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          editProductBloc.add(EditProductSubmittedEvent(
                              name: name,
                              productId: widget.productId,
                              description: description,
                              price: price,
                              status: status));
                        }
                      },
                      child: const Text('Update')))
            ],
          ),
        ),
      ),
    );
  }
}
