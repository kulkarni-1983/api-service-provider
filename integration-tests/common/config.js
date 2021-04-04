const createConfig = (env) => {
  const { SERVER_URL, SERVER_PORT, LOG_LEVEL, TEST_PORT, GIT_COMMIT, APP_VERSION } = env

  return {
    serverUrl: SERVER_URL || 'localhost',
    serverPort: SERVER_PORT || 8080,
    testPort: TEST_PORT || 8081,
    logLevel: LOG_LEVEL || 'debug',
    gitCommit: GIT_COMMIT,
    appVersion: APP_VERSION
  }
}
module.exports = createConfig(process.env)
