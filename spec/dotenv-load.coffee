noflo = require 'noflo'
dotenv = require 'dotenv'

exports.getComponent = ->
  c = new noflo.Component
  c.inPorts.add 'in', (event, payload) ->
    return unless event is 'data'
    # Do something with the packet, then
    dotenv.load
    c.outPorts.out.send process.env
  c.outPorts.add 'out'
  c