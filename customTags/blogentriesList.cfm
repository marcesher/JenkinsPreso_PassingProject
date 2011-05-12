<!--- blogentriesList.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.blogentriesArray" type="array" />
<cfparam name="attributes.maxresults" type="numeric" default="-1" />
<cfparam name="attributes.offset" type="numeric" default="-1" />
<cfset blogentriesCount = ormExecuteQuery("select Count(*) from blogentries")[1]  />
<cfset prevOffset = attributes.offset - attributes.maxresults />
<cfset nextOffset = attributes.offset + attributes.maxresults />
<cfset pages = Ceiling(blogentriesCount / attributes.maxresults) />


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
			<th>Id</th>
			<th>Title</th>
			<th>Body</th>
			<th>Posted</th>
			<th>Morebody</th>
			<th>Blog</th>
			<th>Alias</th>
			<th>Username</th>
		</tr>
	</thead>
	<tbody>
	<cfloop array="#attributes.blogentriesArray#" index="blogentries">
		<tr>
			<td>#blogentries.getID()#</td>
			<td>#blogentries.getTITLE()#</td>
			<td>#blogentries.getBODY()#</td>
			<td>#dateFormat(blogentries.getPOSTED(),"mm/dd/yyyy" )# #timeFormat(blogentries.getPOSTED(),"h:mm tt" )#</td>
			<td>#blogentries.getMOREBODY()#</td>
			<td>#blogentries.getBLOG()#</td>
			<td>#blogentries.getALIAS()#</td>
			<td>#blogentries.getUSERNAME()#</td>
			<td class="crudlink"><a href="blogentries.cfm?method=read&ID=#blogentries.getID()#">Read</a></td>
			<td class="crudlink"><a href="blogentries.cfm?method=edit&ID=#blogentries.getID()#">Edit</a></td>
			<td class="crudlink"><a href="blogentries.cfm?method=delete_process&ID=#blogentries.getID()#" onclick="if (confirm('Are you sure?')) { return true}; return false"">Delete</a></td>
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
					<cfif nextOffset lt blogentriesCount>
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