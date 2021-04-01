const mockApp = {
  use: jest.fn(),
  listen: jest.fn()
}
jest.mock('express', () => jest.fn().mockImplementation(() => mockApp))
jest.mock('../src/routes', () => 'mockRoute')
jest.mock('../src/configs/config', () => ({
  port: 1000
}))
const mockLogger = {
  info: jest.fn()
}
jest.mock('../src/configs/logger', () => mockLogger)

describe('the root endpoint', () => {
  it('returns root', async () => {
    const app = require('../src')
    expect(app).toEqual(mockApp)
    expect(mockApp.use).toHaveBeenCalledWith('/', 'mockRoute')
    expect(mockApp.listen.mock.calls[0][0]).toEqual(1000)
    mockApp.listen.mock.calls[0][1]()
    expect(mockLogger.info).toHaveBeenCalled()
  })
})
