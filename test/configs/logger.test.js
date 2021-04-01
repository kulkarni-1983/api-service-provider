const mockWinston = {
  format: {
    json: jest.fn(() => 'json')
  },
  transports: {
    Console: jest.fn().mockImplementation(() => 'console')
  },
  createLogger: jest.fn(() => 'console.log')
}

jest.mock('winston', () => mockWinston)

jest.mock('../../src/configs/config', () => ({
  logLevel: 'info'
}))

describe('', () => {
  it('', () => {
    const result = require('../../src/configs/logger')
    expect(result).toEqual('console.log')
    expect(mockWinston.createLogger).toHaveBeenCalledWith({
      level: 'info',
      format: 'json',
      defaultMeta: {
        service: 'api-service-provider'
      },
      transports: [mockWinston.transports.Console.mock.instances[0]]
    })
  })
})
