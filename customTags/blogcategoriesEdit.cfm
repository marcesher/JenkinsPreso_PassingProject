<!--- blogcategoriesEdit.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.blogcategories" type="any" />
<cfparam name="attributes.message" type="string" default="" />
<cfset blogcategories = attributes.blogcategories /> 
<cfset message = attributes.message /> 
<cfif CompareNoCase(message, "updated") eq 0>
	<p class="alert">Records updated</p>
<cfelse>
	<p></p>
</cfif>
<cfoutput>
<cfform action="?method=edit_process" method="post" format="html">
	<table>
	<tbody>
			<input name="CATEGORYID" type="hidden" value="#blogcategories.getCATEGORYID()#" />
		<tr>
			<th><label for="CATEGORYNAME">Categoryname:</label></th>
			<td><input name="CATEGORYNAME" type="text" id="CATEGORYNAME" value="#blogcategories.getCATEGORYNAME()#" /></td>
		</tr>
		<tr>
			<th><label for="BLOG">Blog:</label></th>
			<td><input name="BLOG" type="text" id="BLOG" value="#blogcategories.getBLOG()#" /></td>
		</tr>
		<tr>
			<th />
			<td><input name="save" type="submit" value="Save" /></td>
		</tr>
	</tbody>
	</table>
</cfform>
</cfoutput>
</cfprocessingdirective>
<cfexit method="exitTag" />