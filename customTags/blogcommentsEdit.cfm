<!--- blogcommentsEdit.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.blogcomments" type="any" />
<cfparam name="attributes.message" type="string" default="" />
<cfset blogcomments = attributes.blogcomments /> 
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
			<input name="ID" type="hidden" value="#blogcomments.getID()#" />
		<tr>
			<th><label for="ENTRYIDFK">Entryidfk:</label></th>
			<td><input name="ENTRYIDFK" type="text" id="ENTRYIDFK" value="#blogcomments.getENTRYIDFK()#" /></td>
		</tr>
		<tr>
			<th><label for="NAME">Name:</label></th>
			<td><input name="NAME" type="text" id="NAME" value="#blogcomments.getNAME()#" /></td>
		</tr>
		<tr>
			<th><label for="EMAIL">Email:</label></th>
			<td><input name="EMAIL" type="text" id="EMAIL" value="#blogcomments.getEMAIL()#" /></td>
		</tr>
		<tr>
			<th><label for="COMMENT">Comment:</label></th>
			<td><cftextarea name="COMMENT"  id="COMMENT" value="#blogcomments.getCOMMENT()#" richtext="true" toolbar="Basic" skin="Silver" /></td>
		</tr>
		<tr>
			<th><label for="POSTED">Posted:</label></th>
			<td><input name="POSTED" type="text" id="POSTED" value="#blogcomments.getPOSTED()#" /></td>
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