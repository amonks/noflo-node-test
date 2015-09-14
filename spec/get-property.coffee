noflo = require 'noflo'

exports.getComponent = ->
  c = new noflo.Component
  object = {}
  property = ''
  c.inPorts.add 'object', (event, payload) ->
    return unless event is 'data'
    object = payload
    if property
      c.outPorts.out.send object[property]
  c.inPorts.add 'property', (event, payload) ->
    return unless event is 'data'
    property = payload
    if object
      c.outPorts.out.send object[property]
  c.outPorts.add 'out'
  c