<!--- authorsList.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.authorsArray" type="array" />
<cfparam name="attributes.maxresults" type="numeric" default="-1" />
<cfparam name="attributes.offset" type="numeric" default="-1" />
<cfset authorsCount = ormExecuteQuery("select Count(*) from authors")[1]  />
<cfset prevOffset = attributes.offset - attributes.maxresults />
<cfset nextOffset = attributes.offset + attributes.maxresults />
<cfset pages = Ceiling(authorsCount / attributes.maxresults) />

<!--- TODO: fix this and make it less lame --->
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
			<th>Authorid</th>
			<th>Firstname</th>
			<th>Lastname</th>
			<th>Bio</th>
			<th>Isspotlight</th>
		</tr>
	</thead>
	<tbody>
	<cfloop array="#attributes.authorsArray#" index="authors">
		<tr>
			<td>#authors.getAUTHORID()#</td>
			<td>#authors.getFIRSTNAME()#</td>
			<td>#authors.getLASTNAME()#</td>
			<td>#authors.getBIO()#</td>
			<td>#authors.getISSPOTLIGHT()#</td>
			<td class="crudlink"><a href="authors.cfm?method=read&AUTHORID=#authors.getAUTHORID()#">Read</a></td>
			<td class="crudlink"><a href="authors.cfm?method=edit&AUTHORID=#authors.getAUTHORID()#">Edit</a></td>
			<td class="crudlink"><a href="authors.cfm?method=delete_process&AUTHORID=#authors.getAUTHORID()#" onclick="if (confirm('Are you sure?')) { return true}; return false"">Delete</a></td>
		</tr>
	</cfloop>
<cfif attributes.offset gte 0>
	<tr>
	<td colspan="8">
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
					<cfif nextOffset lt authorsCount>
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