from flask import Flask, jsonify, request
import psycopg2
from psycopg2.extras import RealDictCursor

app = Flask(__name__)
connection = psycopg2.connect(
    user="postgres",
    password="admin",
    host="localhost",
    port="5432",
    database="online_store"
)

def get_cursor():
    return connection.cursor(cursor_factory=RealDictCursor)

# ------------------------- CUSTOMERS -------------------------
@app.route('/customers', methods=['GET'])
def get_customers():
    with connection:
        cursor = get_cursor()
        cursor.execute('SELECT * FROM customers')
        customers = cursor.fetchall()
        cursor.close()
        return jsonify(customers)

@app.route('/customers/<int:id>', methods=['GET'])
def get_customer(id):
    with connection:
        cursor = get_cursor()
        cursor.execute('SELECT * FROM customers WHERE customer_id = %s', (id,))
        customer = cursor.fetchone()
        cursor.close()
        if customer:
            return jsonify(customer)
        else:
            return jsonify({"error": "Customer not found"}), 404

@app.route('/customers', methods=['POST'])
def create_customer():
    new_customer = request.get_json()
    with connection:
        cursor = get_cursor()
        cursor.execute('INSERT INTO customers (first_name, last_name, email) VALUES (%s, %s, %s) RETURNING customer_id',
                       (new_customer['first_name'], new_customer['last_name'], new_customer['email']))
        customer_id = cursor.fetchone()['customer_id']
        cursor.close()
        return jsonify({'customer_id': customer_id}), 201

@app.route('/customers/<int:id>', methods=['PUT'])
def update_customer(id):
    updated_customer = request.get_json()
    with connection:
        cursor = get_cursor()
        cursor.execute('UPDATE customers SET first_name = %s, last_name = %s, email = %s WHERE customer_id = %s',
                       (updated_customer['first_name'], updated_customer['last_name'], updated_customer['email'], id))
        if cursor.rowcount == 0:
            cursor.close()
            return jsonify({"error": f"Customer with ID {id} not found"}), 404
        cursor.close()
        return '', 204

@app.route('/customers/<int:id>', methods=['DELETE'])
def delete_customer(id):
    with connection:
        cursor = get_cursor()
        cursor.execute('DELETE FROM customers WHERE customer_id = %s', (id,))
        if cursor.rowcount == 0:
            cursor.close()
            return jsonify({"error": f"Customer with ID {id} not found"}), 404
        cursor.close()
        return '', 204

# ------------------------- PRODUCTS -------------------------
@app.route('/products', methods=['GET'])
def get_products():
    with connection:
        cursor = get_cursor()
        cursor.execute('SELECT * FROM products')
        products = cursor.fetchall()
        cursor.close()
        return jsonify(products)

@app.route('/products/<int:id>', methods=['GET'])
def get_product(id):
    with connection:
        cursor = get_cursor()
        cursor.execute('SELECT * FROM products WHERE product_id = %s', (id,))
        product = cursor.fetchone()
        cursor.close()
        if product:
            return jsonify(product)
        else:
            return jsonify({"error": "Product not found"}), 404

@app.route('/products', methods=['POST'])
def create_product():
    new_product = request.get_json()
    with connection:
        cursor = get_cursor()
        cursor.execute('INSERT INTO products (product_name, description, price, stock_quantity) VALUES (%s, %s, %s, %s) RETURNING product_id',
                       (new_product['product_name'], new_product['description'], new_product['price'], new_product['stock_quantity']))
        product_id = cursor.fetchone()['product_id']
        cursor.close()
        return jsonify({'product_id': product_id}), 201

@app.route('/products/<int:id>', methods=['PUT'])
def update_product(id):
    updated_product = request.get_json()
    with connection:
        cursor = get_cursor()
        cursor.execute('UPDATE products SET product_name = %s, description = %s, price = %s, stock_quantity = %s WHERE product_id = %s',
                       (updated_product['product_name'], updated_product['description'], updated_product['price'], updated_product['stock_quantity'], id))
        if cursor.rowcount == 0:
            cursor.close()
            return jsonify({"error": f"Product with ID {id} not found"}), 404
        cursor.close()
        return '', 204

@app.route('/products/<int:id>', methods=['DELETE'])
def delete_product(id):
    with connection:
        cursor = get_cursor()
        cursor.execute('DELETE FROM products WHERE product_id = %s', (id,))
        if cursor.rowcount == 0:
            cursor.close()
            return jsonify({"error": f"Product with ID {id} not found"}), 404
        cursor.close()
        return '', 204

# ------------------------- ORDERS -------------------------
@app.route('/orders', methods=['GET'])
def get_orders():
    with connection:
        cursor = get_cursor()
        cursor.execute('SELECT * FROM orders')
        orders = cursor.fetchall()
        cursor.close()
        return jsonify(orders)

@app.route('/orders/<int:id>', methods=['GET'])
def get_order(id):
    with connection:
        cursor = get_cursor()
        cursor.execute('SELECT * FROM orders WHERE order_id = %s', (id,))
        order = cursor.fetchone()
        cursor.close()
        if order:
            return jsonify(order)
        else:
            return jsonify({"error": "Order not found"}), 404

@app.route('/orders', methods=['POST'])
def create_order():
    new_order = request.get_json()
    with connection:
        cursor = get_cursor()
        cursor.execute('INSERT INTO orders (customer_id, order_date, total_amount) VALUES (%s, %s, %s) RETURNING order_id',
                       (new_order['customer_id'], new_order['order_date'], new_order['total_amount']))
        order_id = cursor.fetchone()['order_id']
        cursor.close()
        return jsonify({'order_id': order_id}), 201

@app.route('/orders/<int:id>', methods=['PUT'])
def update_order(id):
    updated_order = request.get_json()
    with connection:
        cursor = get_cursor()
        cursor.execute('UPDATE orders SET customer_id = %s, order_date = %s, total_amount = %s WHERE order_id = %s',
                       (updated_order['customer_id'], updated_order['order_date'], updated_order['total_amount'], id))
        if cursor.rowcount == 0:
            cursor.close()
            return jsonify({"error": f"Order with ID {id} not found"}), 404
        cursor.close()
        return '', 204

@app.route('/orders/<int:id>', methods=['DELETE'])
def delete_order(id):
    with connection:
        cursor = get_cursor()
        cursor.execute('DELETE FROM orders WHERE order_id = %s', (id,))
        if cursor.rowcount == 0:
            cursor.close()
            return jsonify({"error": f"Order with ID {id} not found"}), 404
        cursor.close()
        return '', 204

# ------------------------- ORDER ITEMS -------------------------
@app.route('/orderitems', methods=['GET'])
def get_orderitems():
    with connection:
        cursor = get_cursor()
        cursor.execute('SELECT * FROM orderitems')
        orderitems = cursor.fetchall()
        cursor.close()
        return jsonify(orderitems)

@app.route('/orderitems/<int:id>', methods=['GET'])
def get_orderitem(id):
    with connection:
        cursor = get_cursor()
        cursor.execute('SELECT * FROM orderitems WHERE order_item_id = %s', (id,))
        orderitem = cursor.fetchone()
        cursor.close()
        if orderitem:
            return jsonify(orderitem)
        else:
            return jsonify({"error": "Order item not found"}), 404

@app.route('/orderitems', methods=['POST'])
def create_orderitem():
    new_orderitem = request.get_json()
    with connection:
        cursor = get_cursor()
        cursor.execute('INSERT INTO orderitems (order_id, product_id, quantity, price) VALUES (%s, %s, %s, %s) RETURNING order_item_id',
                       (new_orderitem['order_id'], new_orderitem['product_id'], new_orderitem['quantity'], new_orderitem['price']))
        order_item_id = cursor.fetchone()['order_item_id']
        cursor.close()
        return jsonify({'order_item_id': order_item_id}), 201

@app.route('/orderitems/<int:id>', methods=['PUT'])
def update_orderitem(id):
    updated_orderitem = request.get_json()
    with connection:
        cursor = get_cursor()
        cursor.execute('UPDATE orderitems SET order_id = %s, product_id = %s, quantity = %s, price = %s WHERE order_item_id = %s',
                       (updated_orderitem['order_id'], updated_orderitem['product_id'], updated_orderitem['quantity'], updated_orderitem['price'], id))
        if cursor.rowcount == 0:
            cursor.close()
            return jsonify({"error": f"Order item with ID {id} not found"}), 404
        cursor.close()
        return '', 204

@app.route('/orderitems/<int:id>', methods=['DELETE'])
def delete_orderitem(id):
    with connection:
        cursor = get_cursor()
        cursor.execute('DELETE FROM orderitems WHERE order_item_id = %s', (id,))
        if cursor.rowcount == 0:
            cursor.close()
            return jsonify({"error": f"Order item with ID {id} not found"}), 404
        cursor.close()
        return '', 204

if __name__ == '__main__':
    app.run(debug=True)
