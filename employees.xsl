<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:template match="/">

<html>
<head>
    <title>Employee Salary System</title>

    <style>
        body {
            font-family: Arial;
            background-color: #111;
            color: white;
            text-align: center;
        }

        table {
            margin: auto;
            border-collapse: collapse;
            width: 70%;
        }

        th, td {
            border: 1px solid white;
            padding: 10px;
        }

        th {
            background-color: #00ccff;
            color: black;
        }

        .high {
            background-color: #003366;
        }

        .medium {
            background-color: #333300;
        }

        .low {
            background-color: #660000;
        }
    </style>
</head>

<body>

<h1>Employee Salary Report</h1>

<table>
    <tr>
        <th>Name</th>
        <th>Department</th>
        <th>Salary</th>
        <th>Category</th>
        <th>Bonus</th>
    </tr>

    <xsl:for-each select="employees/employee">

        <tr>
            <xsl:attribute name="class">
                <xsl:choose>
                    <xsl:when test="salary &gt;= 70000">high</xsl:when>
                    <xsl:when test="salary &gt;= 40000">medium</xsl:when>
                    <xsl:otherwise>low</xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>

            <td><xsl:value-of select="name"/></td>
            <td><xsl:value-of select="department"/></td>
            <td><xsl:value-of select="salary"/></td>

           
            <td>
                <xsl:choose>
                    <xsl:when test="salary &gt;= 70000">High</xsl:when>
                    <xsl:when test="salary &gt;= 40000">Medium</xsl:when>
                    <xsl:otherwise>Low</xsl:otherwise>
                </xsl:choose>
            </td>

           
            <td>
                <xsl:if test="salary &gt;= 70000">5000</xsl:if>
                <xsl:if test="salary &gt;= 40000 and salary &lt; 70000">3000</xsl:if>
                <xsl:if test="salary &lt; 40000">1000</xsl:if>
            </td>

        </tr>

    </xsl:for-each>

</table>

</body>
</html>

</xsl:template>

</xsl:stylesheet>