<!--- blogentriesEdit.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.blogentries" type="any" />
<cfparam name="attributes.message" type="string" default="" />
<cfset blogentries = attributes.blogentries /> 
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
			<input name="ID" type="hidden" value="#blogentries.getID()#" />
		<tr>
			<th><label for="TITLE">Title:</label></th>
			<td><input name="TITLE" type="text" id="TITLE" value="#blogentries.getTITLE()#" /></td>
		</tr>
		<tr>
			<th><label for="BODY">Body:</label></th>
			<td><cftextarea name="BODY"  id="BODY" value="#blogentries.getBODY()#" richtext="true" toolbar="Basic" skin="Silver" /></td>
		</tr>
		<tr>
			<th><label for="POSTED">Posted:</label></th>
			<td><input name="POSTED" type="text" id="POSTED" value="#blogentries.getPOSTED()#" /></td>
		</tr>
		<tr>
			<th><label for="MOREBODY">Morebody:</label></th>
			<td><cftextarea name="MOREBODY"  id="MOREBODY" value="#blogentries.getMOREBODY()#" richtext="true" toolbar="Basic" skin="Silver" /></td>
		</tr>
		<tr>
			<th><label for="BLOG">Blog:</label></th>
			<td><input name="BLOG" type="text" id="BLOG" value="#blogentries.getBLOG()#" /></td>
		</tr>
		<tr>
			<th><label for="ALIAS">Alias:</label></th>
			<td><input name="ALIAS" type="text" id="ALIAS" value="#blogentries.getALIAS()#" /></td>
		</tr>
		<tr>
			<th><label for="USERNAME">Username:</label></th>
			<td><input name="USERNAME" type="text" id="USERNAME" value="#blogentries.getUSERNAME()#" /></td>
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