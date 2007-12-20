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
かなり長い間、 control ファイル自体に上流プロジェクトの URL を
記述するようにしていました。現在では control ファイルのスタンザに
ある新しい Homepage フィールドに記述する方法が推奨されています。
そのフィールドを記述すると、ソースパッケージやバイナリパッケージの
中で伝搬されます(そのようにして Sources.gz と Packages.gz ができ
上がります)。特別なバイナリパッケージの Homepage フィールドに対して
は、それぞれそれに相当する、 control ファイルのバイナリスタンザに
ある 2 番目の Homepage フィールドを記述することによって、それらを
上書きすることができます。

This was implemented in dpkg 1.14.6.

debian/control の Vcs-* フィールド
------------------------------
パッケージが VCS 内で管理されている場合は、
Vsc-<Kind> にそのリポジトリの場所を指定します。
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

root 権限で実行しておらず、fakeroot が利用できる場合には、'-rfakeroot'
オプションを付けなくても、自動的に fakeroot が使われるようになりました。

これは、dpkg 1.14.7 で実装されました。

dpkg-buildpackage が並列ビルドをサポート
-------------------------------------------------------------

パッケージのビルドシステムが make に基づいている場合は、新しい
オプション '-j' を使って、並列ビルドを有効化できます。
それ以外の場合、パッケージが並列ビルドをきちんとサポートする
必要があります。

これは dpkg 1.14.7 で実装されました。

dpkg-shlibdeps supports symbol based dependencies
-------------------------------------------------

dpkg-gensymbols can be used to generate new symbols control files for
library packages (which in turn will be used by dpkg-shlibdeps to generate
more accurate dependencies). More details will be provided later on. For
now, we're looking for some early adopters to flesh out some good usage
guidelines, see http://lists.debian.org/debian-devel/2007/11/msg00611.html
for more information.

This was implemented in dpkg 1.14.8.
