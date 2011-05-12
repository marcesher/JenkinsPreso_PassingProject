<!--- booksList.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.booksArray" type="array" />
<cfparam name="attributes.maxresults" type="numeric" default="-1" />
<cfparam name="attributes.offset" type="numeric" default="-1" />
<cfset booksCount = ormExecuteQuery("select Count(*) from books")[1]  />
<cfset prevOffset = attributes.offset - attributes.maxresults />
<cfset nextOffset = attributes.offset + attributes.maxresults />
<cfset pages = Ceiling(booksCount / attributes.maxresults) />


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
			<th>Bookid</th>
			<th>Authorid</th>
			<th>Title</th>
			<th>Bookdescription</th>
			<th>Bookimage</th>
			<th>Thumbnailimage</th>
			<th>Isspotlight</th>
			<th>Genre</th>
		</tr>
	</thead>
	<tbody>
	<cfloop array="#attributes.booksArray#" index="books">
		<tr>
			<td>#books.getBOOKID()#</td>
			<td>#books.getAUTHORID()#</td>
			<td>#books.getTITLE()#</td>
			<td>#books.getBOOKDESCRIPTION()#</td>
			<td>#books.getBOOKIMAGE()#</td>
			<td>#books.getTHUMBNAILIMAGE()#</td>
			<td>#books.getISSPOTLIGHT()#</td>
			<td>#books.getGENRE()#</td>
			<td class="crudlink"><a href="books.cfm?method=read&BOOKID=#books.getBOOKID()#">Read</a></td>
			<td class="crudlink"><a href="books.cfm?method=edit&BOOKID=#books.getBOOKID()#">Edit</a></td>
			<td class="crudlink"><a href="books.cfm?method=delete_process&BOOKID=#books.getBOOKID()#" onclick="if (confirm('Are you sure?')) { return true}; return false"">Delete</a></td>
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
					<cfif nextOffset lt booksCount>
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