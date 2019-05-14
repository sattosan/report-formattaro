begin
  # File.openはファイルをオープンし、Fileオブジェクトを返す
  # 第1引数: ファイルパス
  # 第2引数: ファイルモード (デフォルト => 'r')
  # 第3引数: ファイルを生成する場合のパーミッション(デフォルト => 0666)
  # 失敗した場合にErrno::EXXX例外が発生
  #
  # File.openにブロックを渡すと、
  # ブロックが終了した時点でファイルを自動でクローズする
  # フォーマットされた文字列を入れる変数
  report = ""
  File.open('report.txt') do |file|
    # IO#each_lineは1行ずつ文字列として読み込み、それを引数にブロックを実行する
    # 第1引数: 行の区切り文字列
    # 第2引数: 最大の読み込みバイト数
    # 読み込み用にオープンされていない場合にIOError
    file.each_line do |line|
      # 読み込んだ行がsectionやsubsectionだったら
      if line.match(/^[0-9]+.*$/)
        report += line
        next
      # 空行があった場合
      elsif line.match(/^\s*$/)
        report += "\n" + line
        next
      end
      # 読み込んだlineの改行を消して先頭にスペースを入れて文字列を結合
      report += " " + line.chomp!
    end
    puts report
  end
  File.open("format-report.txt", "w") do |f|
    f.puts(report)
  end
# 例外
rescue SystemCallError => e
  puts %Q(class=[#{e.class}] message=[#{e.message}])
rescue IOError => e
  puts %Q(class=[#{e.class}] message=[#{e.message}])
end