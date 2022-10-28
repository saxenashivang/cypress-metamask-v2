const { defineConfig } = require('cypress')

module.exports = defineConfig({
  chromeWebSecurity: true,
  taskTimeout: 60000,
  retries: {
    runMode: 0,
    openMode: 0,
  },
  env: {
    SKIP_METAMASK_SETUP: true,
    PRIVATE_KEY_WITH_FUNDS: '0x',
  },
  e2e: {
    // We've imported your old cypress plugins here.
    // You may want to clean this up later by importing these.
    setupNodeEvents(on, config) {
      return require('./cypress/plugins/index.js')(on, config)
    },
    baseUrl: 'http://localhost:3000',
  },
})
