const express = require('express')
const router = express.Router()
const path = require('path')

const healthRouter = require('./health')
const metadataRouter = require('./metadata')

router.use('/health', healthRouter)
router.use('/metadata', metadataRouter)

router.use('/', (_, res) => {
    res.sendFile(path.join(__dirname + '/default.html'))
})

module.exports = router