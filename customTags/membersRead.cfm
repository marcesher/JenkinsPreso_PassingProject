<!--- membersRead.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.members" type="any" />
<cfparam name="attributes.class" type="string" default="readpage" />
<cfset members = attributes.members /> 
<cfoutput>
<table>
	<tbody>
		<tr>
			<th>Memberid</th>
			<td>#members.getMEMBERID()#</td>
		</tr>
		<tr>
			<th>Firstname</th>
			<td>#members.getFIRSTNAME()#</td>
		</tr>
		<tr>
			<th>Lastname</th>
			<td>#members.getLASTNAME()#</td>
		</tr>
		<tr>
			<th>Email</th>
			<td>#members.getEMAIL()#</td>
		</tr>
		<tr>
			<th>Memberpassword</th>
			<td>#members.getMEMBERPASSWORD()#</td>
		</tr>
		<tr>
			<th>Isadmin</th>
			<td>#members.getISADMIN()#</td>
		</tr>
		<tr>
			<th>Isactive</th>
			<td>#members.getISACTIVE()#</td>
		</tr>
		<tr>
			<th>Isblogspotlight</th>
			<td>#members.getISBLOGSPOTLIGHT()#</td>
		</tr>
	</tbody>
</table>
</cfoutput>
</cfprocessingdirective>
<cfexit method="exitTag" />