# 2カラムになっている論文やレポートのフォーマットを整形するプログラム

## 動作環境
Ruby 2.5.1

## インストール
```bash
$ git clone https://github.com/sattosan/report-formattaro.git
$ cd report-formattaro
```

## 環境構築(Rubyが入っている場合はスキップ)
* anyenvのインストール

```bash
$ brew install anyenv
$ echo 'eval "$(anyenv init -)"' >> ~/.bash_profile
$ echo $SHELL -l
```

* rbenvのインストール

```bash
$ anyenv install rbenv
$ exec $SHELL -l
```

* Rubyのインストール

```bash
$ rbenv install 2.5.1
```

* インストールされたことの確認

```bash
$ rbenv versions
```

* Rubyバージョンのセット
```bash
$ rbenv global 2.5.1
```

## 使用方法
* ```report.txt```に論文のテキストをコピー
* プログラムの実行

```bash
$ ruby main.rb
```

* ```format-report.txt```にフォーマットされたテキストが書き込まれる