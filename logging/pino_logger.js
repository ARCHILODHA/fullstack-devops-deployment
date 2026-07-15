const pino = require("pino");

const logger = pino({
    level: "info"
});

logger.info("Application Started");

logger.warn("Low Memory");

logger.error("Database Connection Failed");

module.exports = logger;
