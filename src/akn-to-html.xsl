<?xml version="1.0" ?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- <xsl:strip-space elements="*" /> -->

  <xsl:template match="/">
    <html>
    <body>
      <xsl:apply-templates />
    </body>
    </html>
  </xsl:template>

  <xsl:template match="chapter">
    <article>
      <header>
        <h1>
        <xsl:copy>
          <span><xsl:value-of select="//num" />: </span><xsl:value-of select="//heading" />
        </xsl:copy>
        </h1>
      </header>
      <main>
        <xsl:copy>
          <xsl:apply-templates select="part"/>
        </xsl:copy>
      </main>
    </article>
  </xsl:template>

  <xsl:template match="part">
    <section>
      <h2>
        <span><xsl:value-of select="//part/num" />: </span><xsl:value-of select="//part/heading" />
      </h2>
      <xsl:apply-templates select="section" />
    </section>
  </xsl:template>

  <xsl:template match="section">
    <div class="part__section">
      <h3>
        <span><xsl:value-of select="//section/num" />: </span><xsl:value-of select="//section/heading" />
      </h3>
      <xsl:apply-templates select="paragraph" />
    </div>
  </xsl:template>

  <xsl:template match="paragraph">
    <div class="paragraph">
      <h4>
        <span><xsl:value-of select="//paragraph/num" />: </span><xsl:value-of select="//paragraph/heading" />
      </h4>
      <ol class="rules">
        <xsl:for-each select="rule">
          <li>
            <h5><xsl:value-of select="heading" /></h5>
            <div class="rule-content">
              <xsl:apply-templates select="content" />
            </div>
          </li>
        </xsl:for-each>
      </ol>
    </div>
  </xsl:template>
  
  <xsl:template match="list">
    <xsl:value-of select="intro" />
    <ol>
      <xsl:for-each select="point">
        <li><xsl:value-of select="." /></li>
      </xsl:for-each>
    </ol>
  </xsl:template>
</xsl:stylesheet>
