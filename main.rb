begin
  report = ""
  # ファイル読み込み
  File.open('report.txt') do |file|
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
      # 文字列の最後が-なら-を消して行を結合
      if report[-1] == "-"
        report = report.chomp("-") + line.chomp
        next
      end
      report += " " + line.chomp
    end
    puts report
  end
  # ファイル書き込み
  File.open("format-report.txt", "w") do |f|
    f.puts(report)
  end
# 例外
rescue SystemCallError => e
  puts %Q(class=[#{e.class}] message=[#{e.message}])
rescue IOError => e
  puts %Q(class=[#{e.class}] message=[#{e.message}])
end