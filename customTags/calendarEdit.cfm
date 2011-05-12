<!--- calendarEdit.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.calendar" type="any" />
<cfparam name="attributes.message" type="string" default="" />
<cfset calendar = attributes.calendar /> 
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
			<input name="CALENDARID" type="hidden" value="#calendar.getCALENDARID()#" />
		<tr>
			<th><label for="MEETINGID">Meetingid:</label></th>
			<td><input name="MEETINGID" type="text" id="MEETINGID" value="#calendar.getMEETINGID()#" /></td>
		</tr>
		<tr>
			<th><label for="CALENDARDATE">Calendardate:</label></th>
			<td><input name="CALENDARDATE" type="text" id="CALENDARDATE" value="#calendar.getCALENDARDATE()#" /></td>
		</tr>
		<tr>
			<th><label for="STARTTIME">Starttime:</label></th>
			<td><input name="STARTTIME" type="text" id="STARTTIME" value="#calendar.getSTARTTIME()#" /></td>
		</tr>
		<tr>
			<th><label for="ADDITIONALINFO">Additionalinfo:</label></th>
			<td><cftextarea name="ADDITIONALINFO"  id="ADDITIONALINFO" value="#calendar.getADDITIONALINFO()#" richtext="true" toolbar="Basic" skin="Silver" /></td>
		</tr>
		<tr>
			<th><label for="ISAUTHORAVAILABLE">Isauthoravailable:</label></th>
			<td><input name="ISAUTHORAVAILABLE" type="text" id="ISAUTHORAVAILABLE" value="#calendar.getISAUTHORAVAILABLE()#" /></td>
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