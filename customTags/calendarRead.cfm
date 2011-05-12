<!--- calendarRead.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.calendar" type="any" />
<cfparam name="attributes.class" type="string" default="readpage" />
<cfset calendar = attributes.calendar /> 
<cfoutput>
<table>
	<tbody>
		<tr>
			<th>Calendarid</th>
			<td>#calendar.getCALENDARID()#</td>
		</tr>
		<tr>
			<th>Meetingid</th>
			<td>#calendar.getMEETINGID()#</td>
		</tr>
		<tr>
			<th>Calendardate</th>
			<td>#dateFormat(calendar.getCALENDARDATE(),"mm/dd/yyyy" )# #timeFormat(calendar.getCALENDARDATE(),"h:mm tt" )#</td>
		</tr>
		<tr>
			<th>Starttime</th>
			<td>#calendar.getSTARTTIME()#</td>
		</tr>
		<tr>
			<th>Additionalinfo</th>
			<td>#calendar.getADDITIONALINFO()#</td>
		</tr>
		<tr>
			<th>Isauthoravailable</th>
			<td>#calendar.getISAUTHORAVAILABLE()#</td>
		</tr>
	</tbody>
</table>
</cfoutput>
</cfprocessingdirective>
<cfexit method="exitTag" />