fs = require 'fs'

{print} = require 'sys'
{spawn} = require 'child_process'

build = (callback) ->
  # coffee = spawn 'coffee', ['-c', '-o', 'lib', 'src']
  # fix for win32 nodejs spawn returning ENOENT: http://stackoverflow.com/questions/17516772/using-nodejss-spawn-causes-unknown-option-and-error-spawn-enoent-err
  # executable = (process.platform == "win32" ? "coffee.cmd" : "coffee")
  # coffee = spawn executable, ['-c', '-o', 'lib', 'src']
  # but this doesn't work either: TypeError: Bad Argument - I have no idea why, because simply using 'coffee.cmd' works fine
  # coffee = spawn (process.platform == "win32" ? 'coffee.cmd' : 'coffee'), ['-c', '-o', 'lib', 'src']
  coffee.stderr.on 'data', (data) ->
    process.stderr.write data.toString()
  coffee.stdout.on 'data', (data) ->
    print data.toString()
  coffee.on 'exit', (code) ->
    callback?() if code is 0

task 'build', 'Build lib/ from src/', ->
  print "Meow"
  build()