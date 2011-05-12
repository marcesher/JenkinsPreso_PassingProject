<!--- blogcategoriesRead.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.blogcategories" type="any" />
<cfparam name="attributes.class" type="string" default="readpage" />
<cfset blogcategories = attributes.blogcategories /> 
<cfoutput>
<table>
	<tbody>
		<tr>
			<th>Categoryid</th>
			<td>#blogcategories.getCATEGORYID()#</td>
		</tr>
		<tr>
			<th>Categoryname</th>
			<td>#blogcategories.getCATEGORYNAME()#</td>
		</tr>
		<tr>
			<th>Blog</th>
			<td>#blogcategories.getBLOG()#</td>
		</tr>
	</tbody>
</table>
</cfoutput>
</cfprocessingdirective>
<cfexit method="exitTag" />