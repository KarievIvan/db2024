// Підключення до бази даних online_store
use('online_store');

//Вставка одного документа
db.Customers.insertOne({
    customer_id: 55,
    first_name: 'DJIDFJINSFJINSFJIBN',
    last_name: 'VDFVNJIDFVNDI',
    email: 'alice.wonderland@example.com',
    date_of_birth: ISODate('1990-01-01T00:00:00Z')
})

// //Вставка декількох документів
// db.Customers.insertMany([
//     { customer_id: 22, first_name: 'Bob', last_name: 'Builder', email: 'bob.builder@example.com', date_of_birth: ISODate('1980-02-01T00:00:00Z') },
//     { customer_id: 23, first_name: 'Charlie', last_name: 'Brown', email: 'charlie.brown@example.com', date_of_birth: ISODate('1985-03-01T00:00:00Z') }
// ])

// // Пошук всіх документів
// db.Customers.find()

//Пошук одного документа за умовою
// db.Customers.findOne({ customer_id: 21 })

//Пошук документів за умовою
// db.Customers.find({ last_name: 'Wonderland' })

// //Оновлення одного документа
// db.Customers.updateOne(
//     { customer_id: 1 },
//     { $set: { email: 'new.email@example.com' } }
// )

// //Оновлення декількох документів
// db.Customers.updateMany(
//     { last_name: 'Smith' },
//     { $set: { email: 'smith.email@example.com' } }
// )

// //Видалення одного документа
// db.Customers.deleteOne({ customer_id: 21 })

// //Видалення декількох документів
// db.Customers.deleteMany({ last_name: 'Brown' })

// //Пошук з вибором полів
// db.Customers.find({}, { first_name: 1, last_name: 1, email: 1 })

// //Пошук з умовою і сортуванням
// db.Customers.find().sort({ last_name: 1 })

// //Пошук з умовою і обмеженням кількості результатів
// db.Customers.find().limit(5)

//Агрегація: підрахунок кількості клієнтів по роках народження
// db.Customers.aggregate([
//     { $project: { year_of_birth: { $year: "$date_of_birth" } } },
//     { $group: { _id: "$year_of_birth", count: { $sum: 1 } } }
// ])

// Агрегація: середній вік клієнтів
// db.Customers.aggregate([
//     { $project: { age: { $subtract: [ { $year: new Date() }, { $year: "$date_of_birth" } ] } } },
//     { $group: { _id: null, averageAge: { $avg: "$age" } } }
// ])

// //Пошук з використанням регулярного виразу
// db.Customers.find({ last_name: { $regex: "^W" } })

//Пошук з використанням $in
// db.Customers.find({ customer_id: { $in: [1, 2, 3] } })

//Пошук з використанням $or
// db.Customers.find({
//     $or: [
//         { first_name: 'Іван' },
//         { last_name: 'Smith' }
//     ]
// })

//Пошук з використанням $and
// db.Customers.find({
//     $and: [
//         { first_name: 'Alice' },
//         { last_name: 'Wonderland' }
//     ]
// })

//Пошук з використанням $ne (не дорівнює)
// db.Customers.find({ customer_id: { $ne: 55 } })

//Агрегація: клієнти старше 30 років
// db.Customers.aggregate([
//     { $project: { age: { $subtract: [ { $year: new Date() }, { $year: "$date_of_birth" } ] } } },
//     { $match: { age: { $gt: 30 } } }
// ])


