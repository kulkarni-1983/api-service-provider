const express = require('express')
const request = require('supertest')
const routes = require('../../src/routes/metadata')
const app = express()
app.use('/', routes)

jest.mock('../../src/configs/config', () => ({
  gitCommit: 'githash123',
  appVersion: '1.0.1'
}))
describe('the metadata endpoint', () => {
  it('returns the metadata', async () => {
    const res = await request(app).get('/')
    expect(res.status).toEqual(200)
    expect(JSON.parse(res.text)).toEqual({
      apiServiceProvider: [{
        lastCommit: 'githash123',
        version: '1.0.1',
        description: 'farmework to host api endpoint logic'
      }]
    })
  })
})
