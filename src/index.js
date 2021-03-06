const express = require('express')
const routes = require('./routes')
const { port } = require('./configs/config')
const logger = require('./configs/logger')

const app = express()
app.use('/', routes)

app.listen(port, () => {
  logger.info(`Server listening on port ${port}`)
})

module.exports = app
