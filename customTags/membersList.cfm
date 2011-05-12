<!--- membersList.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.membersArray" type="array" />
<cfparam name="attributes.maxresults" type="numeric" default="-1" />
<cfparam name="attributes.offset" type="numeric" default="-1" />
<cfset membersCount = ormExecuteQuery("select Count(*) from members")[1]  />
<cfset prevOffset = attributes.offset - attributes.maxresults />
<cfset nextOffset = attributes.offset + attributes.maxresults />
<cfset pages = Ceiling(membersCount / attributes.maxresults) />


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
			<th>Memberid</th>
			<th>Firstname</th>
			<th>Lastname</th>
			<th>Email</th>
			<th>Memberpassword</th>
			<th>Isadmin</th>
			<th>Isactive</th>
			<th>Isblogspotlight</th>
		</tr>
	</thead>
	<tbody>
	<cfloop array="#attributes.membersArray#" index="members">
		<tr>
			<td>#members.getMEMBERID()#</td>
			<td>#members.getFIRSTNAME()#</td>
			<td>#members.getLASTNAME()#</td>
			<td>#members.getEMAIL()#</td>
			<td>#members.getMEMBERPASSWORD()#</td>
			<td>#members.getISADMIN()#</td>
			<td>#members.getISACTIVE()#</td>
			<td>#members.getISBLOGSPOTLIGHT()#</td>
			<td class="crudlink"><a href="members.cfm?method=read&MEMBERID=#members.getMEMBERID()#">Read</a></td>
			<td class="crudlink"><a href="members.cfm?method=edit&MEMBERID=#members.getMEMBERID()#">Edit</a></td>
			<td class="crudlink"><a href="members.cfm?method=delete_process&MEMBERID=#members.getMEMBERID()#" onclick="if (confirm('Are you sure?')) { return true}; return false"">Delete</a></td>
		</tr>
	</cfloop>
<cfif attributes.offset gte 0>
	<tr>
	<td colspan="11">
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
					<cfif nextOffset lt membersCount>
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