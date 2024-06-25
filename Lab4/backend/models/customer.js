const mongoose = require('mongoose');

const customerSchema = new mongoose.Schema({
    customer_id: Number,
    first_name: String,
    last_name: String,
    email: String,
    date_of_birth: Date
});

module.exports = mongoose.model('Customer', customerSchema, 'Customers'); // Третій параметр 'Customers' вказує на наявну колекцію
