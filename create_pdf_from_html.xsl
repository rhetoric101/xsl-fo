<?xml  version="1.0"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format">      
                      
<xsl:template match="/">  
   <fo:root>
      <fo:layout-master-set>
      <fo:simple-page-master 
      page-height="11in" 
      page-width="8.5in"
   master-name="only">
         <fo:region-body 
   region-name="xsl-region-body"  
            margin="0.7in" />
   <fo:region-before
            region-name="xsl-region-before" 
            extent="0.7in" />
         <fo:region-after 
   region-name="xsl-region-after"
           extent="0.7in" />
      </fo:simple-page-master>
   </fo:layout-master-set>
      
<fo:page-sequence master-reference="only" format="A">
      <fo:flow flow-name="xsl-region-body">
           <fo:block>           
			<xsl:for-each select="//Article">
				<xsl:for-each select="document(@Link)//body">				    
        			  <xsl:apply-templates />
		        </xsl:for-each>	  
		     </xsl:for-each>	
           </fo:block>
      </fo:flow>
   </fo:page-sequence>
</fo:root>
  </xsl:template>

<xsl:template match="h1|H1">
    <fo:block  
      font-family="Times"
      font-size="22pt"
      font-weight="bold"
      color="#ff9100"
      text-transform="uppercase"
      space-before="25pt"
      space-after="12pt"
      text-align="left"
      page-break-before="always">
          <xsl:apply-templates/>
    </fo:block>
   </xsl:template>
   
<xsl:template match="h2|H2">
    <fo:block  
      font-family="Arial"
      font-size="19pt"
      color="#666"
      font-weight="bold"
      space-before="19pt"
      space-after="12pt"
      text-align="left"
      page-break-after="avoid">
          <xsl:apply-templates/>
    </fo:block>
</xsl:template>

<xsl:template match="h3|H3">
     <fo:block
       font-family="Times"
       font-size="16pt"
       color="#ff9100"
       font-weight="bold"
       space-before="16pt"
       space-after="12pt"
       text-align="left"
       page-break-after="avoid">
            <xsl:apply-templates/>
     </fo:block>
</xsl:template>
<xsl:template match="p|P">
    <fo:block  
      font-family="Times"
      font-size="10pt"
      color="#666"
      space-before="12pt"
      space-after="12pt"
      text-align="justify">
          <xsl:apply-templates/>
    </fo:block>
</xsl:template>
    
<xsl:template match="br">
    <fo:block  
        font-family="Times"
        font-size="12pt"
        space-before="12pt"
        space-after="12pt"
        text-align="justify">
        <xsl:apply-templates/>
    </fo:block>
</xsl:template>

<xsl:template match="ul">
    <fo:list-block
        space-before="0.25em" space-after="0.25em"
        page-break-inside="avoid"
        page-break-before="avoid">
        <xsl:apply-templates/>
    </fo:list-block>
</xsl:template>

<xsl:template match="ul/li">
    <fo:list-item space-after="0.5em">
        <fo:list-item-label start-indent="1em">
            <fo:block>
                &#x2022;
            </fo:block>
        </fo:list-item-label>
        <fo:list-item-body start-indent="2em">
            <fo:block
              font-family="Times"
              font-size="12pt"
              color="#666">
                <xsl:apply-templates/>
            </fo:block>
        </fo:list-item-body>
    </fo:list-item>
</xsl:template>
    
<xsl:template match="ol">
    <fo:list-block
        space-before="0.25em" space-after="0.25em">
        <xsl:apply-templates/>
    </fo:list-block>
</xsl:template>

<xsl:template match="ol/li">
    <fo:list-item space-after="0.5em">
        <fo:list-item-label start-indent="1em">
            <fo:block>
                <xsl:number />.
            </fo:block>
        </fo:list-item-label>
        <fo:list-item-body start-indent="2em">
            <fo:block
              font-family="Times"
              font-size="12pt"
              color="#666">
                <xsl:apply-templates/>
            </fo:block>
        </fo:list-item-body>
    </fo:list-item>
</xsl:template>

</xsl:stylesheet>
