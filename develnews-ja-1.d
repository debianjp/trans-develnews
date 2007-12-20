Hi,

this mail is a simple cut&paste from http://wiki.debian.org/DeveloperNews
where we try to collect small development news that should be known to all
DD but that are not worth a dedicated mail to d-d-a. Feel free to
participate and to add news for the next issue (it won't be periodic, the
mail will be sent out when we have enough content, say 5 news). For the
first issue, we have mainly dpkg related news, for the future I hope other
teams will use the opportunity to share some stuff.

debian/control の Homepage フィールド
-------------------------------------
かなり長い間、 description の中に上流プロジェクトの URL を記述する
ようにしていました。現在では control ファイルの source 節にある
新しい Homepage フィールドに記述する方法が推奨されています。
そのフィールドを記述すると、ソースパッケージやバイナリパッケージの
中で伝搬されます(そのようにして Sources.gz と Packages.gz ができ
上がります)。特別なバイナリパッケージの Homepage フィールドに対して
は、それぞれそれに相当する、 control ファイルの binary 節にある
2 番目の Homepage フィールドを記述することによって、それらを上書き
することができます。

This was implemented in dpkg 1.14.6.

debian/control の Vcs-* フィールド
------------------------------
パッケージをバージョン管理システム (VCS) で管理している場合は
Vcs-* フィールドにそのリポジトリの場所を指定してください。
リポジトリの内容をウェブ上で閲覧できるようにしている場合は
Vcs-Browser フィールドにその URL を指定します。

dpkg が公式にサポートしているフィールドは以下の通りです。

    * Vcs-Arch (arch and baz)
    * Vcs-Bzr (bazaar)
    * Vcs-Cvs
    * Vcs-Darcs
    * Vcs-Git
    * Vcs-Hg (Mercurial)
    * Vcs-Mtn (Monotone)
    * Vcs-Svn (Subversion) 

いくつか例を示します。

Vcs-Browser: http://ikiwiki.info/cgi-bin/viewvc.cgi/trunk/?root=ikiwiki
Vcs-Svn: svn://svn.kitenet.net/ikiwiki/trunk

これは dpkg 1.14.6 で実装されました。

dpkg-buildpackage がデフォルトで fakeroot を使うように
------------------------------------------------------

もう '-rfakeroot' オプションを付ける必要はありません。root
権限で実行しておらず、fakeroot が利用できる場合には、自動的に fakeroot
が使われるようになりました。

これは、dpkg 1.14.7 で実装されました。

dpkg-buildpackage が並列ビルドをサポート
-------------------------------------------------------------

パッケージのビルドシステムが make に基づいている場合は、新しい
オプション '-j' を使って、並列ビルドを有効化できます。
それ以外の場合、パッケージが並列ビルドをきちんとサポートする
必要があります。

これは dpkg 1.14.7 で実装されました。

dpkg-shlibdepsは、シンボルにもとづく依存性をサポートします
-------------------------------------------------
pkg-gensymbolsは、ライブラリパッケージのための新しいシンボルコントロールファイルを
作成するために利用することができます（それは、より正確な依存性を形成するために
dpkg-shlibdepsにより、順に利用します。）。さらに詳細は、後ほど提供します。現在、
若干の良好な使用ガイドラインの追加を検討する数名の初期段階の適用者を探しています。
さらに詳細情報は、以下をご参照ください。
http://lists.debian.org/debian-devel/2007/11/msg00611.html

これは、dpkg 1.14.8で実装されました。
