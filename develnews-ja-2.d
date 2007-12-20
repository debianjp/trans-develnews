The news are collected on http://wiki.debian.org/DeveloperNews
Feel free to contribute.

非公式なアーキテクチャのための新アーカイブ
----------------------------------------
新しいホスト[9]は、非公式なアーキテクチャのホストアーカイブ[10]にセットアップ
されました。それは、gnuab.org に代わって、現在、armel、
hurd-i386 （唯一リリースされていない）、kfreebsd-i386 と kfreebsd-amd64 の
アーキテクチャのホストになっています。

開発者は、自分の担当するパッケージのビルドログ[11]を見て、
その状況[12]をチェックすることができます。

  9. http://www.debian-ports.org/
 10. http://ftp.debian-ports.org/
 11. http://buildd.debian-ports.org/
 12. http://buildd.debian-ports.org/status/

PTS web interface
-----------------

   The [13]PTS web interface has gone through some changes:
     * added RSS feeds for the "latest news" part of the PTS pages (by
       zack)
     * added hyperlinks to per package [14]svn-buildstat info (by luk and
       kibi)
     * added rendering of some new info: DM-Upload-Allowed field,
       maintainer being in the [15]LowThresholdNmu wiki page, Homepage
       field (by zack)

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

Changelog entries must describe changes
---------------------------------------

   While reading changelogs (through debian-devel-changes@l.d.o), we
   see too often bad changelog entries that describe the problem that they
   fix without indicating how they fix it. In a changelog the important
   bits are the description of the change and not only what lead you
   to do the change. Hopefully some examples will make it clearer:

   Bad:
     * Fix lintian error.
   Good:
     * Fix spelling error (maintainance -> maintenance) in description
       (detected by lintian).

   Bad:
     * Fix package building with new dpkg-shlibdeps.
   Good:
     * Pass LD_LIBRARY_PATH=/usr/lib/mypackage to dpkg-shlibdeps so that
       the private libraries are properly found.

   When you write changelog entries, have in mind that one must be able to
   have a reasonably clear idea of what change you did without being
   forced to read a debdiff between both versions.

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
