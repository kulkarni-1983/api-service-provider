const express = require('express')
const router = express.Router()

const HEALTH_STATUS = {
    status: 'UP'
}

router.get('/', (_, res) => {
    res.json(HEALTH_STATUS)
})

module.exports = router