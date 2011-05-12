<!--- pollsList.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.pollsArray" type="array" />
<cfparam name="attributes.maxresults" type="numeric" default="-1" />
<cfparam name="attributes.offset" type="numeric" default="-1" />
<cfset pollsCount = ormExecuteQuery("select Count(*) from polls")[1]  />
<cfset prevOffset = attributes.offset - attributes.maxresults />
<cfset nextOffset = attributes.offset + attributes.maxresults />
<cfset pages = Ceiling(pollsCount / attributes.maxresults) />


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
			<th>Question</th>
			<th>Answer1</th>
			<th>Answer2</th>
			<th>Answer3</th>
			<th>Answer4</th>
			<th>Answer5</th>
			<th>Islive</th>
		</tr>
	</thead>
	<tbody>
	<cfloop array="#attributes.pollsArray#" index="polls">
		<tr>
			<td>#polls.getPOLLID()#</td>
			<td>#polls.getQUESTION()#</td>
			<td>#polls.getANSWER1()#</td>
			<td>#polls.getANSWER2()#</td>
			<td>#polls.getANSWER3()#</td>
			<td>#polls.getANSWER4()#</td>
			<td>#polls.getANSWER5()#</td>
			<td>#polls.getISLIVE()#</td>
			<td class="crudlink"><a href="polls.cfm?method=read&POLLID=#polls.getPOLLID()#">Read</a></td>
			<td class="crudlink"><a href="polls.cfm?method=edit&POLLID=#polls.getPOLLID()#">Edit</a></td>
			<td class="crudlink"><a href="polls.cfm?method=delete_process&POLLID=#polls.getPOLLID()#" onclick="if (confirm('Are you sure?')) { return true}; return false"">Delete</a></td>
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
					<cfif nextOffset lt pollsCount>
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