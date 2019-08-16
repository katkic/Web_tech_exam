# データを受け取り、返却するCGIプログラムの起動
require 'cgi'
cgi = CGI.new

# データを受け取った後、HTMLの形式でレスポンス（反応）を返す
cgi.out('type' => 'text/html', 'charset' => 'UTF-8') do
  # 受け取ったデータをcgi['input']で取り出し、ローカル変数に代入する
  get = cgi['goya']

  # HTMLでレスポンスを返却する
  "<HTML>
    <body>
      <p>受け取った文字列は下記になります</p>
      <p>文字列：#{get}</p>
    </body>
  <HTML>"
end
