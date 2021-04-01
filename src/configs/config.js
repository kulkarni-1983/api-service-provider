const createConfig = (env) => {
  const { SERVER_PORT, LOG_LEVEL, GIT_COMMIT, APP_VERSION } = env

  return {
    port: SERVER_PORT || 8080,
    logLevel: LOG_LEVEL || 'debug',
    gitCommit: GIT_COMMIT || 'dev',
    appVersion: APP_VERSION || 'dev'
  }
}
module.exports = createConfig(process.env)
