const express = require('express')
const request = require('supertest')
const routes = require('../../src/routes/health')
const app = express()
app.use('/', routes)
describe('the health endpoint', () => {
  it('returns the health', async () => {
    const res = await request(app).get('/')
    expect(res.status).toEqual(200)
    expect(JSON.parse(res.text)).toEqual({
      status: 'UP'
    })
  })
})
