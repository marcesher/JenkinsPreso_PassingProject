<!--- sponsorsList.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.sponsorsArray" type="array" />
<cfparam name="attributes.maxresults" type="numeric" default="-1" />
<cfparam name="attributes.offset" type="numeric" default="-1" />
<cfset sponsorsCount = ormExecuteQuery("select Count(*) from sponsors")[1]  />
<cfset prevOffset = attributes.offset - attributes.maxresults />
<cfset nextOffset = attributes.offset + attributes.maxresults />
<cfset pages = Ceiling(sponsorsCount / attributes.maxresults) />


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
			<th>Sponsorid</th>
			<th>Sponsorname</th>
			<th>Webaddress</th>
			<th>Description</th>
			<th>Sponsorad</th>
			<th>Isspotlight</th>
			<th>City</th>
			<th>State</th>
			<th>Address</th>
			<th>Postalcode</th>
			<th>Phone</th>
			<th>Map</th>
		</tr>
	</thead>
	<tbody>
	<cfloop array="#attributes.sponsorsArray#" index="sponsors">
		<tr>
			<td>#sponsors.getSPONSORID()#</td>
			<td>#sponsors.getSPONSORNAME()#</td>
			<td>#sponsors.getWEBADDRESS()#</td>
			<td>#sponsors.getDESCRIPTION()#</td>
			<td>#sponsors.getSPONSORAD()#</td>
			<td>#sponsors.getISSPOTLIGHT()#</td>
			<td>#sponsors.getCITY()#</td>
			<td>#sponsors.getSTATE()#</td>
			<td>#sponsors.getADDRESS()#</td>
			<td>#sponsors.getPOSTALCODE()#</td>
			<td>#sponsors.getPHONE()#</td>
			<td>#sponsors.getMAP()#</td>
			<td class="crudlink"><a href="sponsors.cfm?method=read&SPONSORID=#sponsors.getSPONSORID()#">Read</a></td>
			<td class="crudlink"><a href="sponsors.cfm?method=edit&SPONSORID=#sponsors.getSPONSORID()#">Edit</a></td>
			<td class="crudlink"><a href="sponsors.cfm?method=delete_process&SPONSORID=#sponsors.getSPONSORID()#" onclick="if (confirm('Are you sure?')) { return true}; return false"">Delete</a></td>
		</tr>
	</cfloop>
<cfif attributes.offset gte 0>
	<tr>
	<td colspan="15">
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
					<cfif nextOffset lt sponsorsCount>
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