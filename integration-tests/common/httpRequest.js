const axios = require('axios')

const logger = require('./logger')

const get = async (url) => {
  try {
    const resp = await axios.get(url)
    logger.info('received response from get request', resp)
    return resp
  } catch (err) {
    logger.error('Failed to send get request with error, ', err)
    return {
      status: 400
    }
  }
}

module.exports.get = get
