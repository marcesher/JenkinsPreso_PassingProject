<!--- meetingsList.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.meetingsArray" type="array" />
<cfparam name="attributes.maxresults" type="numeric" default="-1" />
<cfparam name="attributes.offset" type="numeric" default="-1" />
<cfset meetingsCount = ormExecuteQuery("select Count(*) from meetings")[1]  />
<cfset prevOffset = attributes.offset - attributes.maxresults />
<cfset nextOffset = attributes.offset + attributes.maxresults />
<cfset pages = Ceiling(meetingsCount / attributes.maxresults) />


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
			<th>Meetingid</th>
			<th>Bookid</th>
			<th>Host</th>
			<th>Meetinginfo</th>
		</tr>
	</thead>
	<tbody>
	<cfloop array="#attributes.meetingsArray#" index="meetings">
		<tr>
			<td>#meetings.getMEETINGID()#</td>
			<td>#meetings.getBOOKID()#</td>
			<td>#meetings.getHOST()#</td>
			<td>#meetings.getMEETINGINFO()#</td>
			<td class="crudlink"><a href="meetings.cfm?method=read&MEETINGID=#meetings.getMEETINGID()#">Read</a></td>
			<td class="crudlink"><a href="meetings.cfm?method=edit&MEETINGID=#meetings.getMEETINGID()#">Edit</a></td>
			<td class="crudlink"><a href="meetings.cfm?method=delete_process&MEETINGID=#meetings.getMEETINGID()#" onclick="if (confirm('Are you sure?')) { return true}; return false"">Delete</a></td>
		</tr>
	</cfloop>
<cfif attributes.offset gte 0>
	<tr>
	<td colspan="7">
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
					<cfif nextOffset lt meetingsCount>
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