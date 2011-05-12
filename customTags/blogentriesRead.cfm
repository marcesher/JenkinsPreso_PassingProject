<!--- blogentriesRead.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.blogentries" type="any" />
<cfparam name="attributes.class" type="string" default="readpage" />
<cfset blogentries = attributes.blogentries /> 
<cfoutput>
<table>
	<tbody>
		<tr>
			<th>Id</th>
			<td>#blogentries.getID()#</td>
		</tr>
		<tr>
			<th>Title</th>
			<td>#blogentries.getTITLE()#</td>
		</tr>
		<tr>
			<th>Body</th>
			<td>#blogentries.getBODY()#</td>
		</tr>
		<tr>
			<th>Posted</th>
			<td>#dateFormat(blogentries.getPOSTED(),"mm/dd/yyyy" )# #timeFormat(blogentries.getPOSTED(),"h:mm tt" )#</td>
		</tr>
		<tr>
			<th>Morebody</th>
			<td>#blogentries.getMOREBODY()#</td>
		</tr>
		<tr>
			<th>Blog</th>
			<td>#blogentries.getBLOG()#</td>
		</tr>
		<tr>
			<th>Alias</th>
			<td>#blogentries.getALIAS()#</td>
		</tr>
		<tr>
			<th>Username</th>
			<td>#blogentries.getUSERNAME()#</td>
		</tr>
	</tbody>
</table>
</cfoutput>
</cfprocessingdirective>
<cfexit method="exitTag" />