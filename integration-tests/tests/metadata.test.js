const httpRequest = require('../common/httpRequest')

const { serverUrl, serverPort, appVersion, gitCommit } = require('../common/config')

describe('Validate metadata endpoint', () => {
  it('returns the health', async () => {
    const res = await httpRequest.get(`http://${serverUrl}:${serverPort}/metadata`)
    expect(res.status).toEqual(200)
    expect(res.data).toEqual({
      apiServiceProvider: [
        {
          version: appVersion,
          description: 'framework to host api endpoint',
          lastCommit: gitCommit
        }
      ]
    })
  })
})
