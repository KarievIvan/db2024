const express = require('express');
const router = express.Router();
const Customer = require('../models/customer');

// GET all customers
router.get('/', async (req, res) => {
    try {
        const customers = await Customer.find();
        res.json(customers);
    } catch (err) {
        res.status(500).json({ message: err.message });
    }
});

// GET one customer
router.get('/:id', getCustomer, (req, res) => {
    res.json(res.customer);
});

// Create one customer
router.post('/', async (req, res) => {
    const customer = new Customer({
        customer_id: req.body.customer_id,
        first_name: req.body.first_name,
        last_name: req.body.last_name,
        email: req.body.email,
        date_of_birth: req.body.date_of_birth
    });
    try {
        const newCustomer = await customer.save();
        res.status(201).json(newCustomer);
    } catch (err) {
        res.status(400).json({ message: err.message });
    }
});

// Update one customer
router.put('/:id', getCustomer, async (req, res) => {
    if (req.body.customer_id != null) {
        res.customer.customer_id = req.body.customer_id;
    }
    if (req.body.first_name != null) {
        res.customer.first_name = req.body.first_name;
    }
    if (req.body.last_name != null) {
        res.customer.last_name = req.body.last_name;
    }
    if (req.body.email != null) {
        res.customer.email = req.body.email;
    }
    if (req.body.date_of_birth != null) {
        res.customer.date_of_birth = req.body.date_of_birth;
    }
    try {
        const updatedCustomer = await res.customer.save();
        res.json(updatedCustomer);
    } catch (err) {
        res.status(400).json({ message: err.message });
    }
});

// Delete one customer
router.delete('/:id', getCustomer, async (req, res) => {
    try {
        await res.customer.remove();
        res.json({ message: 'Deleted Customer' });
    } catch (err) {
        res.status(500).json({ message: err.message });
    }
});

async function getCustomer(req, res, next) {
    let customer;
    try {
        customer = await Customer.findById(req.params.id);
        if (customer == null) {
            return res.status(404).json({ message: 'Cannot find customer' });
        }
    } catch (err) {
        return res.status(500).json({ message: err.message });
    }

    res.customer = customer;
    next();
}

module.exports = router;
