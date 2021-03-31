const { json } = require('express')
const express = require('express')
const router = express.Router()

const HEALTH_STATUS = {
    status: 'UP'
}

router.get('/', (req, res) => {
    res.json(HEALTH_STATUS)
})

module.exports = router