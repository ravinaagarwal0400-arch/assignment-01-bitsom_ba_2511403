// OP1: insertMany() — insert all 3 documents
db.products.insertMany([
  {
    _id: "ELEC001",
    name: "Samsung 55-inch 4K Smart TV",
    category: "Electronics",
    brand: "Samsung",
    price: 54999,
    specifications: {
      resolution: "4K",
      screen_size: "55 inch",
      voltage: "220V",
      smart_tv: true
    },
    warranty: {
      period_years: 2,
      type: "Manufacturer"
    },
    ratings: [4.5, 4.7, 4.6],
    stock: 25
  },
  {
    _id: "CLOT001",
    name: "Men's Casual Shirt",
    category: "Clothing",
    brand: "Allen Solly",
    price: 1899,
    attributes: {
      size: ["S", "M", "L", "XL"],
      color: "Blue",
      material: "Cotton",
      fit: "Regular"
    },
    variants: [
      { size: "M", stock: 10 },
      { size: "L", stock: 15 }
    ],
    ratings: [4.2, 4.0, 4.3]
  },
  {
    _id: "GROC001",
    name: "Organic Milk 1L",
    category: "Groceries",
    brand: "Amul",
    price: 65,
    expiry_date: new Date("2024-12-30"),
    nutritional_info: {
      calories: 150,
      protein: "8g",
      fat: "8g"
    },
    storage_instructions: "Keep refrigerated",
    stock: 100
  }
]);

// OP2: find() — Electronics with price > 20000
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});

// OP3: find() — Groceries expiring before 2025-01-01
db.products.find({
  category: "Groceries",
  expiry_date: { $lt: new Date("2025-01-01") }
});

// OP4: updateOne() — add discount_percent
db.products.updateOne(
  { _id: "ELEC001" },
  { $set: { discount_percent: 10 } }
);

// OP5: createIndex() — index on category
db.products.createIndex({ category: 1 });