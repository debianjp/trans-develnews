The news are collected on http://wiki.debian.org/DeveloperNews
Feel free to contribute.

New archive for unofficial architectures
----------------------------------------

   A new [9]host has been setup to host [10]archives of unofficial
   architectures. It replaces gnuab.org and currently hosts the armel,
   hurd-i386 (unreleased only), kfreebsd-i386 and kfreebsd-amd64
   architecture.

   Developers can look at the [11]build logs of their packages and check
   their [12]status.

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

Different compression algorithms for debs
-----------------------------------------

   The ability to compress binary packages with something else than gzip
   (for example bzip2) has been in dpkg-dev and dpkg for a long time,
   since 1.11 [16].

   The way to add it to a package is to use the "-Z" switch of dpkg-deb.
   Or "dh_builddeb -- -Z bzip2" from within debian/rules.

   Unfortunately, both [17]lintian and [18]linda incorrectly report that
   this should not be used.

Advanced package search prototype in experimental
-------------------------------------------------

   Enrico Zini created [19]apt-xapian-index, a prototype indexer for a
   system-wide [20]Xapian-based index of packages.

   The index allows to perform very fast queries on package descriptions
   and tags, and any package can install plugins to add extra information
   to the index.

   Also available is an extensive [21]tutorial on how to use the index.

   [22]apt-xapian-index, currently in experimental, will be uploaded to
   unstable as soon as some technical feedback is received, especially
   with regards to the index structure and the plugin interface.

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
