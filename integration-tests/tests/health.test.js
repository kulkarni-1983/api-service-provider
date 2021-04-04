const httpRequest = require('../common/httpRequest')

const { serverUrl, serverPort } = require('../common/config')

describe('Validate health endpoint', () => {
  it('returns the health', async () => {
    const res = await httpRequest.get(`http://${serverUrl}:${serverPort}/health`)
    expect(res.status).toEqual(200)
    expect(res.data).toEqual({
      status: 'UP'
    })
  })
})
