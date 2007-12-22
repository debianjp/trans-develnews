Misc development news

こんにちは。

このメールは、Wiki ページ http://wiki.debian.org/DeveloperNews
から単純にカット・アンド・ペーストしたものです。
この Wiki ページでは、すべての Debian 開発者 (DD) が知っておくべきである一方で、
通知のために debian-devel-announce (d-d-a) にわざわざメールを 1 通投稿するほどのことではないような、
小さな開発関連のニュースをまとめようと試みています。
ページの編集や次号に載せるニュースの追加は御自由にどうぞ (発行は不定期になるでしょう。
十分な内容が (つまりニュースが 5 つほど) 揃ったときに、メールが投稿されます)。
第 1 号については、主に dpkg 関連のニュースを扱っています。
将来的には、他のチームも何かの情報を共有するのにこの場を使うとよいでしょう。

debian/control の Homepage フィールド
-------------------------------------
かなり長い間、 description の中に上流プロジェクトの URL を記述する
ことになっていました。現在では control ファイルの source 節にある新し
い Homepage フィールドに記述する方法が推奨されています。Homepage
フィールドは、ソースパッケージやバイナリパッケージに伝播します(その
結果 Sources.gz と Packages.gz ができます)。control ファイルにある
対応した binary 節に 2 つ目の Homepage フィールドを記述することで、
特定のバイナリパッケージの Homepage フィールドを上書きできます。

これは dpkg 1.14.6 で実装されました。

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

dpkg-shlibdeps が、シンボルに基く依存性をサポート
-------------------------------------------------
ライブラリパッケージ用に新たに導入された symbols 制御ファイルを生成するのに、
dpkg-gensymbols が使えます (生成されたこの制御ファイルは、dpkg-shlibdeps
によって、これまでよりも正確な依存関係を作るのに使用されます)。
さらに詳しくは、後ほど説明します。現在、
ガイドラインに分かりやすい使用法を追記してくれるアーリーアダプターを募集中です。
さらに詳しい情報は、以下をご参照ください。
http://lists.debian.org/debian-devel/2007/11/msg00611.html

これは、dpkg 1.14.8で実装されました。
