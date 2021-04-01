
describe('test config', () => {
  const OLD_ENV = process.env
  afterEach(() => {
    process.env = OLD_ENV // restore the old env
    jest.resetModules()
  })
  it('should should use specified port', () => {
    process.env = {
      ...OLD_ENV,
      SERVER_PORT: 8081
    }
    const result = require('../../src/configs/config')
    expect(result.port).toEqual(8081)
  })
  it('should should use default port when not specified', () => {
    const result = require('../../src/configs/config')
    expect(result.port).toEqual(8080)
  })
  it('should should use specified log level', () => {
    process.env = {
      ...OLD_ENV,
      LOG_LEVEL: 'info'
    }
    const result = require('../../src/configs/config')
    expect(result.logLevel).toEqual('info')
  })
  it('should should use default log level when not specified', () => {
    const result = require('../../src/configs/config')
    expect(result.logLevel).toEqual('debug')
  })
  it('should should use specified git commit', () => {
    process.env = {
      ...OLD_ENV,
      GIT_COMMIT: 'githash123'
    }
    const result = require('../../src/configs/config')
    expect(result.gitCommit).toEqual('githash123')
  })
  it('should should use default git commit when not specified', () => {
    const result = require('../../src/configs/config')
    expect(result.gitCommit).toEqual('dev')
  })
  it('should should use specified app version', () => {
    process.env = {
      ...OLD_ENV,
      APP_VERSION: '1.0.1'
    }
    const result = require('../../src/configs/config')
    expect(result.appVersion).toEqual('1.0.1')
  })
  it('should should use default app version when not specified', () => {
    const result = require('../../src/configs/config')
    expect(result.appVersion).toEqual('dev')
  })
})
