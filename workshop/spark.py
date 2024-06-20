# Union the order_products_prior and order_products_train dataframes
order_products = order_products_prior.union(order_products_train)

# Join with products dataframe
order_products = order_products.join(products, on='product_id')

# Join with departments dataframe
order_items_temp = order_products.join(departments, on='department_id')

# Create or replace the temp view
order_items_temp.createOrReplaceTempView("order_items_temp")
