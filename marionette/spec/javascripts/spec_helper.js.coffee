#= require application
#= require chai
#= require sinon
#= require sinon-chai
#= require chai-jquery

mocha.ui('bdd')

# ignore the following globals during leak detection
# mocha.globals(['YUI'])

# or, ignore all leaks
# mocha.ignoreLeaks()

# set slow test timeout in ms
# mocha.timeout(5)

chai.config.includeStack = true

beforeEach ->
  @sinon = sinon.sandbox.create()
  $('body').append("<div id='content' style='display:none'></div>")

afterEach ->
  @sinon.restore()
