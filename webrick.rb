require 'WEBrick'

module WEBrick
  module HTTPServlet
    FileHandler.add_handler('rb', CGIHandler)
  end
end

server = WEBrick::HTTPServer.new({
  :DocumentRoot => '.',
  :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,
  :Port => '3000'
})
['INT', 'TERM'].each do |signal|
  Signal.trap(signal) { server.shutdown }
end

server.mount('/', WEBrick::HTTPServlet::FileHandler, 'index.html')
server.mount('/goya', WEBrick::HTTPServlet::ERBHandler, 'goya.html.erb')
server.mount('/goya.cgi', WEBrick::HTTPServlet::CGIHandler, 'goya.rb')
server.start
