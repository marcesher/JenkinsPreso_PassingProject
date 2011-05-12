<!--- meetingsEdit.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.meetings" type="any" />
<cfparam name="attributes.message" type="string" default="" />
<cfset meetings = attributes.meetings /> 
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
			<input name="MEETINGID" type="hidden" value="#meetings.getMEETINGID()#" />
		<tr>
			<th><label for="BOOKID">Bookid:</label></th>
			<td><input name="BOOKID" type="text" id="BOOKID" value="#meetings.getBOOKID()#" /></td>
		</tr>
		<tr>
			<th><label for="HOST">Host:</label></th>
			<td><input name="HOST" type="text" id="HOST" value="#meetings.getHOST()#" /></td>
		</tr>
		<tr>
			<th><label for="MEETINGINFO">Meetinginfo:</label></th>
			<td><cftextarea name="MEETINGINFO"  id="MEETINGINFO" value="#meetings.getMEETINGINFO()#" richtext="true" toolbar="Basic" skin="Silver" /></td>
		</tr>
		<tr>
			<th />
			<td><input name="save" type="submit" value="Save" /></td>
			
			<!--- more html here --->
		</tr>
	</tbody>
	</table>
</cfform>
</cfoutput>
</cfprocessingdirective>
<cfexit method="exitTag" />