// QuickBite DB — MongoDB Queries
// File: queries.js

use("quickbite_db");

// QUERY 1: FIND ALL MENUS FOR ETHIOPIAN RESTAURANTS


db.menu_catalog.find(
  { cuisine_type: "Ethiopian" },
  { restaurant_name: 1, menu_items: 1, avg_rating: 1 }
);


// QUERY 2: FIND ALL VEGETARIAN ITEMS ACROSS ALL RESTAURANTS


db.menu_catalog.aggregate([
  { $unwind: "$menu_items" },
  { $match: { "menu_items.is_vegetarian": true } },
  {
    $project: {
      restaurant_name: 1,
      item_name: "$menu_items.name",
      price: "$menu_items.price",
      tags: "$menu_items.tags"
    }
  }
]);

// QUERY 3: FIND ALL DELIVERED ORDERS WITH SURGE PRICING APPLIED

db.order_snapshots.find(
  {
    status: "delivered",
    "pricing.surge_multiplier": { $gt: 1.00 }
  },
  {
    order_id: 1,
    "customer.name": 1,
    "restaurant.name": 1,
    "pricing.surge_multiplier": 1,
    "pricing.total_amount": 1
  }
);

// QUERY 4: CALCULATE AVERAGE DELIVERY TIME PER RESTAURANT FROM ORDER SNAPSHOTS

db.order_snapshots.aggregate([
  { $match: { "delivery.actual_minutes": { $exists: true } } },
  {
    $group: {
      _id: "$restaurant.name",
      avg_delivery_minutes: { $avg: "$delivery.actual_minutes" },
      avg_prediction_error: { $avg: "$delivery.prediction_error" },
      total_orders: { $sum: 1 }
    }
  },
  { $sort: { avg_delivery_minutes: 1 } }
]);

// QUERY 5: FIND TOP RATED REVIEWS (OVERALL 5)

db.customer_reviews.find(
  { "scores.overall": 5 },
  {
    "customer.name": 1,
    "restaurant.name": 1,
    "scores.overall": 1,
    review_text: 1,
    helpful_votes: 1
  }
).sort({ helpful_votes: -1 });


// QUERY 6: AVERAGE SCORES PER RESTAURANT FROM CUSTOMER REVIEWS


db.customer_reviews.aggregate([
  {
    $group: {
      _id: "$restaurant.name",
      avg_food_quality: { $avg: "$scores.food_quality" },
      avg_packaging: { $avg: "$scores.packaging" },
      avg_delivery_speed: { $avg: "$scores.delivery_speed" },
      avg_driver_behavior: { $avg: "$scores.driver_behavior" },
      avg_overall: { $avg: "$scores.overall" },
      total_reviews: { $sum: 1 }
    }
  },
  { $sort: { avg_overall: -1 } }
]);


// QUERY 7: FIND DRIVERS WITH MORE THAN 1 DELIVERY IN ACTIVITY LOGS


db.driver_activity_logs.find(
  { "summary.total_deliveries": { $gte: 1 } },
  {
    driver_name: 1,
    vehicle: 1,
    "summary.total_deliveries": 1,
    "summary.total_earnings": 1,
    "summary.avg_delivery_time_minutes": 1,
    "summary.rating_received": 1
  }
).sort({ "summary.total_earnings": -1 });


// QUERY 8: UPDATE MENU ITEM PRICE increase Doro Wot price by 20 birr


db.menu_catalog.updateOne(
  {
    restaurant_id: 1,
    "menu_items.name": "Doro Wot"
  },
  {
    $set: { "menu_items.$.price": 200.00 }
  }
);


// QUERY 9: ADD A NEW REVIEW TAG TO A DOCUMENT

db.customer_reviews.updateOne(
  { review_id: 1 },
  {
    $push: { tags: "top rated" }
  }
);


// QUERY 10: COUNT ORDERS PER PAYMENT METHOD


db.order_snapshots.aggregate([
  {
    $group: {
      _id: "$payment.method",
      total_orders: { $sum: 1 },
      total_revenue: { $sum: "$pricing.total_amount" }
    }
  },
  { $sort: { total_revenue: -1 } }
]);
