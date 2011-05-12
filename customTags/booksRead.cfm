<!--- booksRead.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.books" type="any" />
<cfparam name="attributes.class" type="string" default="readpage" />
<cfset books = attributes.books /> 
<cfoutput>
<table>
	<tbody>
		<tr>
			<th>Bookid</th>
			<td>#books.getBOOKID()#</td>
		</tr>
		<tr>
			<th>Authorid</th>
			<td>#books.getAUTHORID()#</td>
		</tr>
		<tr>
			<th>Title</th>
			<td>#books.getTITLE()#</td>
		</tr>
		<tr>
			<th>Bookdescription</th>
			<td>#books.getBOOKDESCRIPTION()#</td>
		</tr>
		<tr>
			<th>Bookimage</th>
			<td>#books.getBOOKIMAGE()#</td>
		</tr>
		<tr>
			<th>Thumbnailimage</th>
			<td>#books.getTHUMBNAILIMAGE()#</td>
		</tr>
		<tr>
			<th>Isspotlight</th>
			<td>#books.getISSPOTLIGHT()#</td>
		</tr>
		<tr>
			<th>Genre</th>
			<td>#books.getGENRE()#</td>
		</tr>
	</tbody>
</table>
</cfoutput>
</cfprocessingdirective>
<cfexit method="exitTag" />