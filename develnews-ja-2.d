開発ニュース寄せ集め (第 2 号)

このニュースは http://wiki.debian.org/DeveloperNews でまとめたものです。
寄稿はご自由にどうぞ。

非公式アーキテクチャのための新アーカイブ
----------------------------------------
非公式アーキテクチャのアーカイブ[10]のホスティング用に、
新しいホスト[9]がセットアップされました。このホストは、gnuab.org
に代わって、現在、armel、
hurd-i386 (リリースされていないもののみ)、kfreebsd-i386 と kfreebsd-amd64 の
アーキテクチャのホストになっています。

開発者は、自分の担当するパッケージのビルドログ[11]を見て、
その状況[12]をチェックすることができます。

 9. http://www.debian-ports.org/
 10. http://ftp.debian-ports.org/
 11. http://buildd.debian-ports.org/
 12. http://buildd.debian-ports.org/status/

PTS の Web インタフェース
---------------------------
PTS[13] の Web インタフェースにいくつか変更がありました。
  * PTS ページに「Latest news (最新ニュース)」部分の RSS フィードが付け加えられました (zack さんによる変更)。
  * パッケージごとの svn-buildstat[14] 情報へのリンクが付け加えられました
  (luk さんと kibi さんによる変更)。
  * 新しい情報の表現がいくつか付け加えられました。それらは、DM-Upload-Allowed
  フィールド、メンテナが Wiki の LowThresholdNmu[15] ページに名前を連ねているかどうか、
  Homepage フィールドです (zack さんによる変更)。


 13. http://packages.qa.debian.org/
 14. http://svnbuildstat.debian.net/
 15. http://wiki.debian.org/LowThresholdNmu

deb ファイルでの他の圧縮アルゴリズム
-----------------------------------------

dpkg-dev および dpkg パッケージには、バイナリパッケージを gzip 以外のも
の (例えば bzip2 など) を使って圧縮する機能がバージョン 1.11[16] 以来ずっと
存在しています。

dpkg-deb の "-Z" スイッチを使うことでその機能を使うことが出来ます。
または、debian/rules 内から "dh_builddeb -- -Z bzip2" を使います。

残念なことに、lintian[17] と linda[18] の双方とも、この機能を使うべきではないと
いう誤った警告を出します。

  16. http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=34727
  17. http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=447257
  18. http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=452329

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
特にインデックスの構造やプラグインのインタフェースに関する技術的なフィードバックが得られ次第、
不安定版 (unstable) にアップロードされる予定です (訳注: すでに不安定版 (unstable) にアップロードされ[23]、experimental
からは削除されています)。


19. http://packages.debian.org/experimental/apt-xapian-index
20. http://www.xapian.org/
21. http://www.enricozini.org/2007/debtags/apt-xapian-index.html
22. http://packages.debian.org/experimental/apt-xapian-index

23. http://packages.qa.debian.org/a/apt-xapian-index.html

changelog エントリには変更を記述すること
----------------------------------------------------------

(debian-devel-changes@l.d.o に流れる) changelog を読んでいると、
どのように修正したのかを明示せずに修正した問題を書いたような
お粗末な changelog エントリがやたらと目につきます。changelog
では，その変更に至った経緯はもちろん重要ですが、変更内容の説明も重要です。
いくつかの例ではっきりすればいいのですが：

悪い例：
 * lintian のエラーを修正
良い例：
 * (lintian が検出した) description 中のスペルミス (maintainance → maintenance) を修正

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
