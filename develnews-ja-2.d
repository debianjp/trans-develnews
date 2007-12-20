The news are collected on http://wiki.debian.org/DeveloperNews
Feel free to contribute.

非公式なアーキテクチャのための新アーカイブ
----------------------------------------
新しいホスト[9]は、非公式なアーキテクチャのアーカイブ[10]をホストするようにセットアップされました。それは、gnuab.org
に代わって、現在、armel、
hurd-i386 （唯一リリースされていない）、kfreebsd-i386 と kfreebsd-amd64 の
アーキテクチャのホストになっています。

開発者は、自分の担当するパッケージのビルドログ[11]を見て、
その状況[12]をチェックすることができます。

 9. http://www.debian-ports.org/
 10. http://ftp.debian-ports.org/
 11. http://buildd.debian-ports.org/
 12. http://buildd.debian-ports.org/status/

PTS の Web インターフェース
---------------------------
PTS[13] の Web インターフェースにいくつか変更がありました。
  * PTS ページの「最新ニュース」部分用に RSS フィードが付け加えられました(zack さんによる)。
  * パッケージごとの svnbuildstat[14] 情報へのリンクが付け加えられました
  (luk さんと kibi さんによる)

  * 新しい情報の表現がいくつか付け加えれました。それらは DM-Upload-Allowd
  フィールド、LowThresholdNmu[15] の wiki ページにあるメンテナー、
  Homepage フィールドです(zack さんによる)。


 13. http://packages.qa.debian.org/
 14. http://svnbuildstat.debian.net/
 15. http://wiki.debian.org/LowThresholdNmu

debs 用の特別な圧縮アルゴリズム
-----------------------------------------

dpkg-dev と dpkg には、1.11 [16] 以来長い間、
(例えば bzip2 のような） gzip よりも優れたバイナリバイナリパッケージを圧縮する能力があります。

dpkg-debの"-Z"スイッチを使うことでその能力を使うことが出来ます。
または、debian/rules 内から"dh_builddeb -- -Z bzip2"を使います。

不運にも、[17]lintian と [18]linda は、
これが使われていないという報告が挙がっています。

高機能なパッケージ検索のプロトタイプが experimental に
------------------------------------------------------

Enrico Zini さんが、システム全体にわたるパッケージの Xapian[20]
ベースのインデックスを生成するインデクサのプロトタイプ、apt-xapian-index[19]
を作成しました。

このインデックスを使うと、パッケージの説明文やタグが非常に高速に検索できます。
また、インデックスに特別な情報を付加するのに、
任意のパッケージをプラグインとしてインストールできます。

さらに、インデックスの使い方を書いた、詳しいチュートリアル[21]も利用できます。

apt-xapian-index[22] (現在は experimental にあります) は、
特にインデックスの構造やプラグインのインターフェイスに関する技術的なフィードバックが得られ次第、
不安定版 (unstable) にアップロードされる予定です。

(訳注) すでに不安定版 (unstable) にアップロードされ[23]、experimental
からは削除されています。


19. http://packages.debian.org/experimental/apt-xapian-index
20. http://www.xapian.org/
21. http://www.enricozini.org/2007/debtags/apt-xapian-index.html
22. http://packages.debian.org/experimental/apt-xapian-index

23. http://packages.qa.debian.org/a/apt-xapian-index.html

Changelog エントリには変更を記述すること
----------------------------------------------------------

(debian-devel-changes@xxxxx に流れる) changelog を読んでいると、
どのように修正したのかを明示せずに修正した問題を書いたような
お粗末な changelog エントリがやたらと目につきます。changelog
では，その変更に至った経緯はもちろん重要ですが、変更内容の説明も重要です。
いくつかの例ではっきりすればいいのですが：

悪い例：
 * lintian のエラーを修正
良い例：
 * (lintian が検出した) description 中のスペルミス (maintainance -> maintenance) を修正

悪い例：
 * 新しい dpkg-shlibdeps 用にパッケージビルド方法を修正
良い例：
 * LD_LIBRARY_PATH=/usr/lib/mypackage を dpkg-shlibdeps に渡して、プライベート
   ライブラリが適切に検出されるようにした

changelog エントリを書くときは、わざわざ両方のバージョンの
debdiff を読まなくても、それなりにきちんと変更内容がわかる
ようにしなくてはならない、ということを頭に置いてください。

Links

   9. http://www.debian-ports.org/
  10. http://ftp.debian-ports.org/
  11. http://buildd.debian-ports.org/
  12. http://buildd.debian-ports.org/status/
  13. http://packages.qa.debian.org/
  14. http://svnbuildstat.debian.net/
  15. http://wiki.debian.org/LowThresholdNmu
  16. http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=34727
  17. http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=447257
  18. http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=452329
  19. http://packages.debian.org/experimental/apt-xapian-index
  20. http://www.xapian.org/
  21. http://www.enricozini.org/2007/debtags/apt-xapian-index.html
  22. http://packages.debian.org/experimental/apt-xapian-index
  24. http://lists.debian.org/debian-devel-announce/2007/11/msg00006.html
