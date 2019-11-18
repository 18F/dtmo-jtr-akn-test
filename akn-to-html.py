import lxml.etree as ET

dom = ET.parse('src/jtr-ch3-ptA.xml')
xslt = ET.parse('src/akn-to-html.xsl')
transform = ET.XSLT(xslt)
newdom = transform(dom)
html = ET.tostring(newdom, pretty_print=True)

f = open('dist/jtr-ch3-ptA.html', 'wb')
f.write(html)
f.close
