<!--- authorsRead.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.authors" type="any" />
<cfparam name="attributes.class" type="string" default="readpage" />
<cfset authors = attributes.authors /> 
<cfoutput>
<table>
	<tbody>
		<tr>
			<th>Authorid</th>
			<td>#authors.getAUTHORID()#</td>
		</tr>
		<tr>
			<th>Firstname</th>
			<td>#authors.getFIRSTNAME()#</td>
		</tr>
		<tr>
			<th>Lastname</th>
			<td>#authors.getLASTNAME()#</td>
		</tr>
		<tr>
			<th>Bio</th>
			<td>#authors.getBIO()#</td>
		</tr>
		<tr>
			<th>Isspotlight</th>
			<td>#authors.getISSPOTLIGHT()#</td>
		</tr>
	</tbody>
</table>
</cfoutput>
</cfprocessingdirective>
<cfexit method="exitTag" />