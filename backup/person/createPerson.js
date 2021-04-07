const express = require('express')
const router = express.Router()
const { body, validationResult } = require('express-validator')

router.post(
  '/',
  body('name').isString(),
  body('price').isFloat(),
  (req, res) => {
    // Finds the validation errors in this request and wraps them in an object with handy functions
    console.log('req:', req, 'res', res)
    const errors = validationResult(req)
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() })
    }
    res.json({
      userName: req.body.name,
      price: req.body.price
    })
  }
)

module.exports = router
