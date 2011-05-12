<!--- booksEdit.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.books" type="any" />
<cfparam name="attributes.message" type="string" default="" />
<cfset books = attributes.books /> 
<cfset message = attributes.message /> 
<cfif CompareNoCase(message, "updated") eq 0>
	<p class="alert">Records updated</p>
<cfelse>
	<p></p>
</cfif>
<cfoutput>
<cfform action="?method=edit_process" method="post" format="html">
	<table>
	<tbody>
			<input name="BOOKID" type="hidden" value="#books.getBOOKID()#" />
		<tr>
			<th><label for="AUTHORID">Authorid:</label></th>
			<td><input name="AUTHORID" type="text" id="AUTHORID" value="#books.getAUTHORID()#" /></td>
		</tr>
		<tr>
			<th><label for="TITLE">Title:</label></th>
			<td><input name="TITLE" type="text" id="TITLE" value="#books.getTITLE()#" /></td>
		</tr>
		<tr>
			<th><label for="BOOKDESCRIPTION">Bookdescription:</label></th>
			<td><cftextarea name="BOOKDESCRIPTION"  id="BOOKDESCRIPTION" value="#books.getBOOKDESCRIPTION()#" richtext="true" toolbar="Basic" skin="Silver" /></td>
		</tr>
		<tr>
			<th><label for="BOOKIMAGE">Bookimage:</label></th>
			<td><input name="BOOKIMAGE" type="text" id="BOOKIMAGE" value="#books.getBOOKIMAGE()#" /></td>
		</tr>
		<tr>
			<th><label for="THUMBNAILIMAGE">Thumbnailimage:</label></th>
			<td><input name="THUMBNAILIMAGE" type="text" id="THUMBNAILIMAGE" value="#books.getTHUMBNAILIMAGE()#" /></td>
		</tr>
		<tr>
			<th><label for="ISSPOTLIGHT">Isspotlight:</label></th>
			<td><input name="ISSPOTLIGHT" type="text" id="ISSPOTLIGHT" value="#books.getISSPOTLIGHT()#" /></td>
		</tr>
		<tr>
			<th><label for="GENRE">Genre:</label></th>
			<td><input name="GENRE" type="text" id="GENRE" value="#books.getGENRE()#" /></td>
		</tr>
		<tr>
			<th />
			<td><input name="save" type="submit" value="Save" /></td>
		</tr>
	</tbody>
	</table>
</cfform>
</cfoutput>
</cfprocessingdirective>
<cfexit method="exitTag" />