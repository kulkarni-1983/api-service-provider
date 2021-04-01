const express = require('express')
const request = require('supertest')
const routes = require('../../src/routes')
const fs = require('fs')
const path = require('path')

const app = express()
app.use('/', routes)

jest.mock('../../src/configs/config', () => ({
  gitCommit: 'githash123',
  appVersion: '1.0.1'
}))
describe('the root route', () => {
  it('should return metadata info', async () => {
    const res = await request(app).get('/metadata')
    expect(res.status).toEqual(200)
    expect(JSON.parse(res.text)).toEqual({
      apiServiceProvider: [{
        lastCommit: 'githash123',
        version: '1.0.1',
        description: 'farmework to host api endpoint logic'
      }]
    })
  })
  it('returns the health', async () => {
    const res = await request(app).get('/health')
    expect(res.status).toEqual(200)
    expect(JSON.parse(res.text)).toEqual({
      status: 'UP'
    })
  })
  it('returns the root info', async () => {
    const res = await request(app).get('/')
    expect(res.status).toEqual(200)
    expect(res.text).toEqual(fs.readFileSync(path.join(__dirname, '../../src/routes/default.html'), 'utf8'))
  })
})
