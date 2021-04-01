const express = require('express')
const router = express.Router()

const { gitCommit, appVersion } = require('../configs/config')

router.use('/', (_, res) => {
  res.json({
    apiServiceProvider: [
      {
        version: appVersion,
        description: 'farmework to host api endpoint logic',
        lastCommit: gitCommit
      }
    ]
  })
})

module.exports = router
