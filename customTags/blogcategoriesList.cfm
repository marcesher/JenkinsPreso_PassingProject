<!--- blogcategoriesList.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.blogcategoriesArray" type="array" />
<cfparam name="attributes.maxresults" type="numeric" default="-1" />
<cfparam name="attributes.offset" type="numeric" default="-1" />
<cfset blogcategoriesCount = ormExecuteQuery("select Count(*) from blogcategories")[1]  />
<cfset prevOffset = attributes.offset - attributes.maxresults />
<cfset nextOffset = attributes.offset + attributes.maxresults />
<cfset pages = Ceiling(blogcategoriesCount / attributes.maxresults) />


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
			<th>Categoryid</th>
			<th>Categoryname</th>
			<th>Blog</th>
		</tr>
	</thead>
	<tbody>
	<cfloop array="#attributes.blogcategoriesArray#" index="blogcategories">
		<tr>
			<td>#blogcategories.getCATEGORYID()#</td>
			<td>#blogcategories.getCATEGORYNAME()#</td>
			<td>#blogcategories.getBLOG()#</td>
			<td class="crudlink"><a href="blogcategories.cfm?method=read&CATEGORYID=#blogcategories.getCATEGORYID()#">Read</a></td>
			<td class="crudlink"><a href="blogcategories.cfm?method=edit&CATEGORYID=#blogcategories.getCATEGORYID()#">Edit</a></td>
			<td class="crudlink"><a href="blogcategories.cfm?method=delete_process&CATEGORYID=#blogcategories.getCATEGORYID()#" onclick="if (confirm('Are you sure?')) { return true}; return false"">Delete</a></td>
		</tr>
	</cfloop>
<cfif attributes.offset gte 0>
	<tr>
	<td colspan="6">
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
					<cfif nextOffset lt blogcategoriesCount>
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