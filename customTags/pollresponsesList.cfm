<!--- pollresponsesList.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.pollresponsesArray" type="array" />
<cfparam name="attributes.maxresults" type="numeric" default="-1" />
<cfparam name="attributes.offset" type="numeric" default="-1" />
<cfset pollresponsesCount = ormExecuteQuery("select Count(*) from pollresponses")[1]  />
<cfset prevOffset = attributes.offset - attributes.maxresults />
<cfset nextOffset = attributes.offset + attributes.maxresults />
<cfset pages = Ceiling(pollresponsesCount / attributes.maxresults) />


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
			<th>Pollid</th>
			<th>A1</th>
			<th>A2</th>
			<th>A3</th>
			<th>A4</th>
			<th>A5</th>
			<th>Total</th>
		</tr>
	</thead>
	<tbody>
	<cfloop array="#attributes.pollresponsesArray#" index="pollresponses">
		<tr>
			<td>#pollresponses.getPOLLID()#</td>
			<td>#pollresponses.getA1()#</td>
			<td>#pollresponses.getA2()#</td>
			<td>#pollresponses.getA3()#</td>
			<td>#pollresponses.getA4()#</td>
			<td>#pollresponses.getA5()#</td>
			<td>#pollresponses.getTOTAL()#</td>
			<td class="crudlink"><a href="pollresponses.cfm?method=read&POLLID=#pollresponses.getPOLLID()#">Read</a></td>
			<td class="crudlink"><a href="pollresponses.cfm?method=edit&POLLID=#pollresponses.getPOLLID()#">Edit</a></td>
			<td class="crudlink"><a href="pollresponses.cfm?method=delete_process&POLLID=#pollresponses.getPOLLID()#" onclick="if (confirm('Are you sure?')) { return true}; return false"">Delete</a></td>
		</tr>
	</cfloop>
<cfif attributes.offset gte 0>
	<tr>
	<td colspan="10">
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
					<cfif nextOffset lt pollresponsesCount>
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