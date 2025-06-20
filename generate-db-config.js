require("dotenv").config();
const fs = require("fs");

const config = {
    type: "mariadb",
    port: parseInt(process.env.DB_PORT, 10) || 3306,
    hostname: process.env.DB_HOST,
    username: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    dbName: process.env.DB_NAME
};

fs.writeFileSync("./data/db-config.json", JSON.stringify(config, null, 4));
console.log("✅ db-config.json overwritten with latest .env values");
