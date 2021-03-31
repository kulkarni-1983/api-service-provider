const createConfig = (env = {}) => {
    const { SERVER_PORT, LOG_LEVEL} = env;

    return {
        port: SERVER_PORT || 8080,
        logLevel: LOG_LEVEL || 'debug',
    }
}

module.exports = createConfig(process.env)