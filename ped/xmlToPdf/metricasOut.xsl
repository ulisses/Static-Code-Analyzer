<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format">
    
    <xsl:template match="/">
        
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
            
            <fo:layout-master-set>
                <fo:simple-page-master master-name="simple"
                    page-height="29.7cm" 
                    page-width="21cm"
                    margin-top="1cm" 
                    margin-bottom="2cm" 
                    margin-left="2.5cm" 
                    margin-right="2.5cm">
                    <fo:region-body margin-top="3cm"/>
                    <fo:region-before extent="3cm"/>
                    <fo:region-after extent="1.5cm"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            
            
            <fo:page-sequence master-reference="simple">
                <fo:flow flow-name="xsl-region-body">
                    <xsl:apply-templates select="metrics"/>
                </fo:flow>
            </fo:page-sequence>
            
        </fo:root> 
    </xsl:template>
    
    <xsl:template match="metrics">
        <fo:block>
            <xsl:value-of select="@packageName" />
            
            
            <fo:table border="0.5pt solid black" text-align="center">
                <fo:table-body>
                    
                    <xsl:for-each select="metric">
                        <fo:table-row>
                            <fo:table-cell padding="6pt" border="0.5pt solid black">
                                <fo:block> <xsl:value-of select="@name" /> </fo:block>
                            </fo:table-cell>
                            <fo:table-cell padding="6pt" border="0.5pt solid black">
                                <fo:block> <xsl:apply-templates select="list"/> </fo:block>
                            </fo:table-cell>
                            <fo:table-cell padding="6pt" border="0.5pt solid black">
                                <fo:block> <xsl:value-of select="@functionName" /> </fo:block>
                            </fo:table-cell>
                            <fo:table-cell padding="6pt" border="0.5pt solid black">
                                <fo:block> <xsl:value-of select="@fileName" /> </fo:block>
                            </fo:table-cell>
                        </fo:table-row>                        
                    </xsl:for-each>
                    
                </fo:table-body>
            </fo:table>
            
            
        </fo:block>
    </xsl:template>
    
    <xsl:template match="list">       
        <fo:block>
            <xsl:for-each select="item">
                <xsl:value-of select="@v" />,
                
            </xsl:for-each>       
        </fo:block> 
    </xsl:template>
    
    
    
</xsl:stylesheet>


