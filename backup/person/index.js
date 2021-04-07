const express = require('express')
const router = express.Router()

const createPersonRouter = require('./createPerson')

router.use('/', createPersonRouter)

module.exports = router
