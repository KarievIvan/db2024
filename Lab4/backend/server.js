const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
const cors = require('cors');
require('dotenv').config();

const app = express();

// Middleware
app.use(cors());
app.use(bodyParser.json());

// Підключення до бази даних MongoDB з використанням async/await
const connectDB = async () => {
    try {
        await mongoose.connect(
            process.env.MONGODB_URI,
            { useNewUrlParser: true, useUnifiedTopology: true }
        );
        console.log('Connected to MongoDB');
    } catch (error) {
        console.error('Failed to connect to MongoDB', error);
        process.exit(1);
    }
};

connectDB();

// Імпорт маршрутів
const customersRoute = require('./routes/customers');
app.use('/customers', customersRoute);

// Запуск сервера
app.listen(3002, () => {
    console.log('Server is running on port 3002');
});
