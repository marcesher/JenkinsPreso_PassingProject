<!--- calendarList.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.calendarArray" type="array" />
<cfparam name="attributes.maxresults" type="numeric" default="-1" />
<cfparam name="attributes.offset" type="numeric" default="-1" />
<cfset calendarCount = ormExecuteQuery("select Count(*) from calendar")[1]  />
<cfset prevOffset = attributes.offset - attributes.maxresults />
<cfset nextOffset = attributes.offset + attributes.maxresults />
<cfset pages = Ceiling(calendarCount / attributes.maxresults) />


<cfset message = attributes.message /> 
<cfif CompareNoCase(message, "deleted") eq 0>
	<p class="alert">Record deleted</p>
<cfelse>
	<p></p>
</cfif>
<cfoutput>
<table>
	<thead>
		<tr>
			<th>Calendarid</th>
			<th>Meetingid</th>
			<th>Calendardate</th>
			<th>Starttime</th>
			<th>Additionalinfo</th>
			<th>Isauthoravailable</th>
		</tr>
	</thead>
	<tbody>
	<cfloop array="#attributes.calendarArray#" index="calendar">
		<tr>
			<td>#calendar.getCALENDARID()#</td>
			<td>#calendar.getMEETINGID()#</td>
			<td>#dateFormat(calendar.getCALENDARDATE(),"mm/dd/yyyy" )# #timeFormat(calendar.getCALENDARDATE(),"h:mm tt" )#</td>
			<td>#calendar.getSTARTTIME()#</td>
			<td>#calendar.getADDITIONALINFO()#</td>
			<td>#calendar.getISAUTHORAVAILABLE()#</td>
			<td class="crudlink"><a href="calendar.cfm?method=read&CALENDARID=#calendar.getCALENDARID()#">Read</a></td>
			<td class="crudlink"><a href="calendar.cfm?method=edit&CALENDARID=#calendar.getCALENDARID()#">Edit</a></td>
			<td class="crudlink"><a href="calendar.cfm?method=delete_process&CALENDARID=#calendar.getCALENDARID()#" onclick="if (confirm('Are you sure?')) { return true}; return false"">Delete</a></td>
		</tr>
	</cfloop>
<cfif attributes.offset gte 0>
	<tr>
	<td colspan="9">
		<table class="listnav">
			<tr>
				<td class="prev">
					<cfif prevOffset gte 0>
						<a href="?offset=#prevOffset#&amp;maxresults=#attributes.maxresults#">&larr; Prev</a>
					</cfif>
				</td>
				<td class="pages">
					<cfloop index="i" from="1" to="#pages#">
						<cfset offset = 0 + ((i -1) * attributes.maxresults) />
						<cfif offset eq attributes.offset>
							#i#
						<cfelse>
							<a href="?offset=#offset#&amp;maxresults=#attributes.maxresults#">#i#</a>
						</cfif>
					</cfloop>
				</td>
				<td class="next">
					<cfif nextOffset lt calendarCount>
					<a href="?offset=#nextOffset#&amp;maxresults=#attributes.maxresults#">Next &rarr;<a/>
					</cfif>
				</td>
			</tr>
		</table>
	</td>
	</tr>
</cfif>
	</tbody>
	</cfoutput>
</table>
</cfprocessingdirective>
<cfexit method="exitTag" />