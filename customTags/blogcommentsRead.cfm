<!--- blogcommentsRead.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.blogcomments" type="any" />
<cfparam name="attributes.class" type="string" default="readpage" />
<cfset blogcomments = attributes.blogcomments /> 
<cfoutput>
<table>
	<tbody>
		<tr>
			<th>Id</th>
			<td>#blogcomments.getID()#</td>
		</tr>
		<tr>
			<th>Entryidfk</th>
			<td>#blogcomments.getENTRYIDFK()#</td>
		</tr>
		<tr>
			<th>Name</th>
			<td>#blogcomments.getNAME()#</td>
		</tr>
		<tr>
			<th>Email</th>
			<td>#blogcomments.getEMAIL()#</td>
		</tr>
		<tr>
			<th>Comment</th>
			<td>#blogcomments.getCOMMENT()#</td>
		</tr>
		<tr>
			<th>Posted</th>
			<td>#dateFormat(blogcomments.getPOSTED(),"mm/dd/yyyy" )# #timeFormat(blogcomments.getPOSTED(),"h:mm tt" )#</td>
		</tr>
	</tbody>
</table>
</cfoutput>
</cfprocessingdirective>
<cfexit method="exitTag" />