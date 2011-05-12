<!--- blogcommentsList.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.blogcommentsArray" type="array" />
<cfparam name="attributes.maxresults" type="numeric" default="-1" />
<cfparam name="attributes.offset" type="numeric" default="-1" />
<cfset blogcommentsCount = ormExecuteQuery("select Count(*) from blogcomments")[1]  />
<cfset prevOffset = attributes.offset - attributes.maxresults />
<cfset nextOffset = attributes.offset + attributes.maxresults />
<cfset pages = Ceiling(blogcommentsCount / attributes.maxresults) />


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
			<th>Entryidfk</th>
			<th>Name</th>
			<th>Email</th>
			<th>Comment</th>
			<th>Posted</th>
		</tr>
	</thead>
	<tbody>
	<cfloop array="#attributes.blogcommentsArray#" index="blogcomments">
		<tr>
			<td>#blogcomments.getID()#</td>
			<td>#blogcomments.getENTRYIDFK()#</td>
			<td>#blogcomments.getNAME()#</td>
			<td>#blogcomments.getEMAIL()#</td>
			<td>#blogcomments.getCOMMENT()#</td>
			<td>#dateFormat(blogcomments.getPOSTED(),"mm/dd/yyyy" )# #timeFormat(blogcomments.getPOSTED(),"h:mm tt" )#</td>
			<td class="crudlink"><a href="blogcomments.cfm?method=read&ID=#blogcomments.getID()#">Read</a></td>
			<td class="crudlink"><a href="blogcomments.cfm?method=edit&ID=#blogcomments.getID()#">Edit</a></td>
			<td class="crudlink"><a href="blogcomments.cfm?method=delete_process&ID=#blogcomments.getID()#" onclick="if (confirm('Are you sure?')) { return true}; return false"">Delete</a></td>
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
					<cfif nextOffset lt blogcommentsCount>
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