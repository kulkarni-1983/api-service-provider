const httpRequest = require('../common/httpRequest')
const fs = require('fs')
const path = require('path')

const { serverUrl, serverPort } = require('../common/config')

describe('Validate root endpoint', () => {
  it('returns the welcome page', async () => {
    const res = await httpRequest.get(`http://${serverUrl}:${serverPort}/`)
    expect(res.status).toEqual(200)
    expect(res.data).toEqual(fs.readFileSync(
      path.join(__dirname, '../../src/routes/default.html'), 'utf8')
    )
  })
})

describe('Validate invalid endpoint', () => {
  it('redirects to root endpoint', async () => {
    const res = await httpRequest.get(`http://${serverUrl}:${serverPort}/invalid`)
    expect(res.status).toEqual(200)
    expect(res.data).toEqual(fs.readFileSync(
      path.join(__dirname, '../../src/routes/default.html'), 'utf8')
    )
  })
})
