<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" indent="yes"/>

<xsl:template match="/">

<html>
<head>
    <title>Employee Performance Dashboard</title>

    <style>
        body {
            font-family: Arial;
            background: linear-gradient(to right, #ffecd2, #fcb69f);
            text-align: center;
        }

        h2 {
            color: #333;
        }

        table {
            margin: auto;
            border-collapse: collapse;
            width: 70%;
            background: white;
            border-radius: 10px;
            overflow: hidden;
        }

        th {
            background: #2c3e50;
            color: white;
            padding: 10px;
        }

        td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background: #f5f5f5;
        }

        .excellent { color: green; font-weight: bold; }
        .poor { color: red; font-weight: bold; }
        .top { background-color: #d1f7c4; }
    </style>
</head>

<body>

<h2>📊 Employee Performance Dashboard</h2>

<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Performance</th>
        <th>Status</th>
        <th>Grade</th>
    </tr>


    <xsl:for-each select="employees/employee">
        <xsl:sort select="performance" data-type="number" order="descending"/>

        <tr>
         
            <xsl:if test="performance &gt;= 80">
                <xsl:attribute name="class">top</xsl:attribute>
            </xsl:if>

            <td><xsl:value-of select="@id"/></td>
            <td><xsl:value-of select="name"/></td>
            <td><xsl:value-of select="performance"/></td>

        
            <td>
                <xsl:choose>
                    <xsl:when test="performance &gt;= 50">
                        <span class="excellent">Good</span>
                    </xsl:when>
                    <xsl:otherwise>
                        <span class="poor">Needs Improvement</span>
                    </xsl:otherwise>
                </xsl:choose>
            </td>

        
            <td>
                <xsl:choose>
                    <xsl:when test="performance &gt;= 80">A</xsl:when>
                    <xsl:when test="performance &gt;= 60">B</xsl:when>
                    <xsl:when test="performance &gt;= 50">C</xsl:when>
                    <xsl:otherwise>F</xsl:otherwise>
                </xsl:choose>
            </td>

        </tr>

    </xsl:for-each>

</table>


<h3>
    Total Employees:
    <xsl:value-of select="count(employees/employee)"/>
</h3>

<h3>
    Good Performers:
    <xsl:value-of select="count(employees/employee[performance &gt;= 50])"/>
</h3>

</body>
</html>

</xsl:template>
</xsl:stylesheet>
