# zepto_inventory_analysis_SQL
# 🛒 Zepto E-commerce Inventory Analysis (SQL Portfolio Project)

A real-world SQL data analysis project built using product inventory data scraped from **Zepto**, India’s fastest-growing quick-commerce platform.

This project simulates an end-to-end data analysis workflow — from raw CSV data to cleaned SQL tables and business-focused insights — perfect for showcasing SQL skills in e-commerce, product analytics, and inventory strategy roles.

---

## ✅ Features

- Set up and cleaned a realistic e-commerce inventory database using PostgreSQL.
- Performed in-depth **Exploratory Data Analysis** (EDA) and **business-driven SQL querying**.
- Generated actionable insights on pricing, discounting, out-of-stock risks, inventory weight, and category performance.

---

## 📊 Dataset Overview

- **Total Entries:** 3,732 product SKUs  
- **Out of Stock Products:** 453  
- **In Stock Products:** 3,279  
- **Source:** Zepto inventory dataset scraped and hosted on Kaggle  
- **Format:** .xlsx, imported into Microsoft SQL Server `  

Each row represents a unique SKU (Stock Keeping Unit) for a product, including multiple listings for the same product under different sizes, packs, and variants.

---

## 📁 Columns

| Column Name            | Description                                      |
|------------------------|--------------------------------------------------|
| `name`                 | Product name                                     |
| `category`             | Product category (e.g., Fruits, Snacks)          |
| `mrp`                  | Maximum Retail Price (₹)                         |
| `discountPercent`      | Discount on MRP in %                             |
| `discountedSellingPrice` | Final selling price (₹)                        |
| `availableQuantity`    | Inventory available                              |
| `weightInGms`          | Product weight in grams                          |
| `outOfStock`           | Boolean flag for availability                    |
| `quantity`             | Package unit count                               |
| `sku_id`               | Unique product identifier (synthetic PK)         |

---

## 🧹 Data Cleaning

- Removed rows where `mrp` or `discountedSellingPrice` was **zero**
- Converted `mrp` and `discountedSellingPrice` from **paise to rupees** for readability

---

## 📈 North Star Metrics & Business Dimensions

### 🔹 Key Metrics Tracked
- **Total SKUs:** 3,732  
- **Total In-Stock Items:** 3,279  
- **Out of Stock Items:** 453  
- **Categories Analyzed:** 14
- Top Revenue Category: Munchies – ₹337,369
- Category with Highest Avg. Discount: Fruits & Vegetables
- Lowest Inventory Weight Category: Meats, Fish & Eggs – 48,016g
- Highest Inventory Weight Category: Munchies – 14,04,654g

---

## 📊 Summary of Business Insights
### 1. Top Discounted Products (≥ 50%)
- Identified 10+ products offering 50% or more discount — useful for bargain-focused marketing and identifying high-visibility SKUs.
- These products are ideal for flash sales, app banners, or price-sensitive targeting.

### 2. Missed Revenue Opportunities
- High-MRP but currently out-of-stock products include:
- Patanjali Cow Ghee
- Mamypoko Pants
- Aashirvaad Atta (Multigrains)
- Everest Kashmiri Lal Chilli

These popular staples should be restocked on priority to recover potential lost sales and improve customer satisfaction.

### 3. Estimated Revenue by Category
- Highest Revenue: Munchies – ₹337,369
- Lowest Revenue: Fruits & Vegetables – ₹10,846

Helps guide inventory allocation and promotional planning by category.

### 4. Expensive Products with Low Discounts
- Products with MRP > ₹500 but discount <10% (e.g., Mustard Oil) are not luxury items, but still sell well.
- Indicates inelastic demand — can be priced strategically for higher margins.

### 5. Top 5 Discounted Categories (Avg. Discount %)
  | Category              | Reason for Relevance                          |
  |-----------------------|-----------------------------------------------|
  | Fruits & Vegetables   | Perishable, frequent discounts                |
  | Meats, Fish & Eggs    | Fast-moving, high margin                      |
  | Packaged Food         | Combo and volume-based promotions             |
  | Ice Cream & Desserts  | Seasonal, impulse buys                        |
  | Chocolates & Candies  | Low-cost luxury, promotional heavy            |

Use this insight to optimize marketing spend and bundle discounts.

### 6. Value for Money (Price per Gram)
- Calculated pricePerGm = discountedSellingPrice / weightInGms for SKUs >100g:
- Best Value: Vicks Cough Drops Menthol – ₹0.02/g
- Most Expensive: Indulekha Hair Oil – ₹3.67/g
- Aids internal pricing strategy and helps in promoting value-based bundles.

### 7. Weight-Based SKU Classification
Grouped SKUs into three segments for delivery & packaging logic:
- Low Weight: < 500g
- Medium Weight: 500g–1kg
- Bulk: > 1kg

Supports truckload planning, bulk order strategy, and inventory storage optimization.

### 8. Total Inventory Weight by Category
  | Category               | Total Weight (g)   |
  |------------------------|--------------------|
  | Munchies               | **1,404,654g** ✅ (Highest)  |
  | Meats, Fish & Eggs     | **48,016g** ❌ (Lowest)  |

Useful for logistics bandwidth estimation, and warehouse planning.
---

| Tool                                    | Usage                                           |
| --------------------------------------- | ----------------------------------------------- |
| **Microsoft SQL Server**                | Database setup, schema creation, and querying   |
| **SSMS (SQL Server Management Studio)** | Data import, exploration, table management      |
| **SQL (Core)**                          | Cleaning, filtering, grouping, joins, CTEs      |
| **VS Code**                             | Query documentation and version control support |

---

## ✅ C. Recommendations & Next Steps

### 1. 🏬 Inventory & Supply Chain Optimization

**For:** *Supply Chain & Inventory Teams*

* **Restock High-Demand, Out-of-Stock Products:**
  Replenish high-MRP and frequently bought SKUs currently out of stock, including:

  * Patanjali Cow Ghee
  * Mamypoko Pants
  * Aashirvaad Atta (Multigrains)
  * Everest Kashmiri Lal Chilli
    These items represent high potential revenue and their absence can impact customer retention and satisfaction.

* **Rationalize Bulky, Low-Revenue Categories:**
  Categories like *Fruits & Vegetables* contribute little to revenue but may occupy significant delivery or shelf space.

  * Downscale safety stock
  * Use smaller trucks for heavy but low-revenue routes
  * Review reorder points to prevent overstocking

---

### 2. 📣 Promotions & Marketing Strategy

**For:** *Marketing, Growth & Category Management Teams*

* **Showcase High-Discount SKUs in Campaigns:**
  Products with ≥ 50% discount are ideal for:

  * Flash sale banners
  * Push notifications
  * “Best Deals” sections on the homepage
    These drive conversions among price-sensitive shoppers and improve discoverability.

* **Target Ad Spend Toward Elastic Categories:**
  Categories like:

  * Fruits & Vegetables
  * Ice Cream & Desserts
  * Packaged Food
    show high responsiveness to discounts. Focus your marketing budget here to optimize ROI and customer acquisition.

---

### 3. 🛒 Product Mix & Pricing Strategy

**For:** *Pricing & Product Strategy Teams*

* **Promote Best Value-Per-Gram Products:**
  Highlight products like Vicks Cough Drops (₹0.02/g) in:

  * Combo deals
  * Value packs
  * Budget-friendly collections
    This attracts cost-conscious customers and increases average basket size.

* **Revisit High-Price, Low-Discount Products:**
  Non-premium essentials like mustard oil jars have high MRP but low discounts — and still sell well.

  * Test price lifts for increased margin
  * Use bundle pricing with complementary items
  * Apply psychological pricing (e.g., ₹499 instead of ₹500)

---

### 4. 🚚 Operational Strategy

**For:** *Operations, Logistics & Fulfillment Teams*

* **Apply Weight-Based SKU Classification:**
  Use the Low/Medium/Bulk segmentation to:

  * Improve truckload planning
  * Optimize bin allocations in dark stores
  * Align with warehouse slotting strategies

* **Logistics Strategy for Bulky Categories:**
  Categories like *Munchies* contribute the highest total inventory weight.

  * Use zone-based micro-warehouses for last-mile savings
  * Plan bulk orders with dedicated delivery schedules
  * Monitor delivery cost-to-revenue ratios for heavy categories

---

Here’s how you can add the friendly section to your `README.md` file in the correct format, customized with your own name (Anushka Rai):

---

## 📜 License

**MIT** — feel free to **fork**, ⭐ **star**, and use this project in your portfolio.
Contributions and suggestions are always welcome!

---

## 👩‍💻 About the Author

Hey, I’m **Anushka Rai** — a passionate Data Analyst and developer with an eye for automation, storytelling dashboards, and clean data insights.
I love turning raw data into meaningful visuals that solve real problems and boost decision-making.
Let’s connect and grow together!

🔗 [GitHub](https://github.com/anushkarai26) | [LinkedIn](https://www.linkedin.com/in/anushka-rai-8068881b2/) | [Email](mailto:anushkarai261003@gmail.com)

