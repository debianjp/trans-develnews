Hi,

this mail is a simple cut&paste from http://wiki.debian.org/DeveloperNews
where we try to collect small development news that should be known to all
DD but that are not worth a dedicated mail to d-d-a. Feel free to
participate and to add news for the next issue (it won't be periodic, the
mail will be sent out when we have enough content, say 5 news). For the
first issue, we have mainly dpkg related news, for the future I hope other
teams will use the opportunity to share some stuff.

Homepage field in debian/control
--------------------------------
For quite some time, we used to put the URL of the upstream project in the
description itself. The recommended way is now to put it in the new
"Homepage" field in the source stanza of the control file. The field will
be propagated in the source package and in the binary packages (and thus
will end up in Sources.gz and Packages.gz). It's possible to override the
Homepage field for each a specific binary package by putting a second
Homepage field in the corresponding binary stanza in the control file.

This was implemented in dpkg 1.14.6.

Vcs-* fields in debian/control
------------------------------

If your package is managed in a VCS, you should indicate where the
repository is located in the Vcs-<Kind> field. If the content of the
repository can be browsed on the web, you should indicate the URL in the
Vcs-Browser field.

The fields officially supported by dpkg are:

    * Vcs-Arch (arch and baz)
    * Vcs-Bzr (bazaar)
    * Vcs-Cvs
    * Vcs-Darcs
    * Vcs-Git
    * Vcs-Hg (Mercurial)
    * Vcs-Mtn (Monotone)
    * Vcs-Svn (Subversion) 

Here are some examples:

Vcs-Browser: http://ikiwiki.info/cgi-bin/viewvc.cgi/trunk/?root=ikiwiki
Vcs-Svn: svn://svn.kitenet.net/ikiwiki/trunk

This was implemented in dpkg 1.14.6.

dpkg-buildpackage がデフォルトで fakeroot を使うように
------------------------------------------------------

root 権限で実行しておらず、fakeroot が利用できる場合には、'-rfakeroot'
オプションを付けなくても、自動的に fakeroot が使われるようになりました。

これは、dpkg 1.14.7 で実装されました。

dpkg-buildpackage supports parallel builds
------------------------------------------

The new option '-j' can be used to enable parallel builds, in case the
package build system is make based, otherwise the package will need
explicit support for it.

This was implemented in dpkg 1.14.7.

dpkg-shlibdeps supports symbol based dependencies
-------------------------------------------------

dpkg-gensymbols can be used to generate new symbols control files for
library packages (which in turn will be used by dpkg-shlibdeps to generate
more accurate dependencies). More details will be provided later on. For
now, we're looking for some early adopters to flesh out some good usage
guidelines, see http://lists.debian.org/debian-devel/2007/11/msg00611.html
for more information.

This was implemented in dpkg 1.14.8.
