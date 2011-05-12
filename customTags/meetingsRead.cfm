<!--- meetingsRead.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.meetings" type="any" />
<cfparam name="attributes.class" type="string" default="readpage" />
<cfset meetings = attributes.meetings /> 
<cfoutput>
<table>
	<tbody>
		<tr>
			<th>Meetingid</th>
			<td>#meetings.getMEETINGID()#</td>
		</tr>
		<tr>
			<th>Bookid</th>
			<td>#meetings.getBOOKID()#</td>
		</tr>
		<tr>
			<th>Host</th>
			<td>#meetings.getHOST()#</td>
		</tr>
		<tr>
			<th>Meetinginfo</th>
			<td>#meetings.getMEETINGINFO()#</td>
		</tr>
	</tbody>
</table>
</cfoutput>
</cfprocessingdirective>
<cfexit method="exitTag" />