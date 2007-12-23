<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">
  <xsl:output method="xml" encoding="utf-8" omit-xml-declaration = "yes"
      indent="no"/>
  <!-- Actually, this is neither a well-formed XML nor HTML.  However,
    xsl:output method="text" outputs only the string-value of every text
    node in the result tree in document order without any escaping. -->

  <xsl:template match="/">
    <xsl:apply-templates select="/div[@class='markdown']/*"/>
  </xsl:template>

  <xsl:template match="h1">
    <xsl:value-of select="."/>
    <xsl:text>&#10;&#10;</xsl:text>
  </xsl:template>

  <xsl:template match="h2">
    <h5><xsl:value-of select="."/></h5>
  </xsl:template>

  <xsl:template match="*">
    <xsl:copy-of select="."/>
  </xsl:template>
</xsl:stylesheet>
