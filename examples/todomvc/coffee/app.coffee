{ SuperDry } = require 'superdry'
{ merge, omit } = require 'lodash'

sd = new SuperDry

DEFAULT_ENTRIES =
  1506184685750: { description: 'buy milk' }
  1506184685751: { description: 'buy cheese', completed: true }

entries = Object.assign {}, DEFAULT_ENTRIES

sd.get 'list', '/entries', ->
  Object.entries(entries).map ([id, entry]) -> merge {}, entry, { id }

sd.post 'create', '/entries', (req) ->
  { id } = req.body
  entries[id] = omit req.body, 'id'
  { status: 'ok' }

sd.patch 'update', '/entry/:id', (req) ->
  entries[req.params.id] = req.body
  { status: 'ok' }

sd.delete 'remove', '/entry/:id', (req) ->
  delete entries[req.params.id]
  { status: 'ok' }

module.exports =
  setupRoutes: sd.setupRoutes
  client: sd.setupDriver()
