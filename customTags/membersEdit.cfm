<!--- membersEdit.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.members" type="any" />
<cfparam name="attributes.message" type="string" default="" />
<cfset members = attributes.members /> 
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
			<input name="MEMBERID" type="hidden" value="#members.getMEMBERID()#" />
		<tr>
			<th><label for="FIRSTNAME">Firstname:</label></th>
			<td><input name="FIRSTNAME" type="text" id="FIRSTNAME" value="#members.getFIRSTNAME()#" /></td>
		</tr>
		<tr>
			<th><label for="LASTNAME">Lastname:</label></th>
			<td><input name="LASTNAME" type="text" id="LASTNAME" value="#members.getLASTNAME()#" /></td>
		</tr>
		<tr>
			<th><label for="EMAIL">Email:</label></th>
			<td><input name="EMAIL" type="text" id="EMAIL" value="#members.getEMAIL()#" /></td>
		</tr>
		<tr>
			<th><label for="MEMBERPASSWORD">Memberpassword:</label></th>
			<td><input name="MEMBERPASSWORD" type="text" id="MEMBERPASSWORD" value="#members.getMEMBERPASSWORD()#" /></td>
		</tr>
		<tr>
			<th><label for="ISADMIN">Isadmin:</label></th>
			<td><input name="ISADMIN" type="text" id="ISADMIN" value="#members.getISADMIN()#" /></td>
		</tr>
		<tr>
			<th><label for="ISACTIVE">Isactive:</label></th>
			<td><input name="ISACTIVE" type="text" id="ISACTIVE" value="#members.getISACTIVE()#" /></td>
		</tr>
		<tr>
			<th><label for="ISBLOGSPOTLIGHT">Isblogspotlight:</label></th>
			<td><input name="ISBLOGSPOTLIGHT" type="text" id="ISBLOGSPOTLIGHT" value="#members.getISBLOGSPOTLIGHT()#" /></td>
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