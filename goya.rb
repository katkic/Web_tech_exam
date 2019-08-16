# データを受け取り、返却するCGIプログラムの起動
require 'cgi'
cgi = CGI.new

# データを受け取った後、HTMLの形式でレスポンス（反応）を返す
cgi.out('type' => 'text/html', 'charset' => 'UTF-8') do
  # 受け取ったデータをcgi['input']で取り出し、ローカル変数に代入する
  title = cgi['title']
  get = cgi['goya']

  # HTMLでレスポンスを返却する
  "<HTML>
    <body>
      <h1>#{title}</h1>
      <p>#{get}</p>
    </body>
  <HTML>"
end
