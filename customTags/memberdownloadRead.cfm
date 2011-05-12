<!--- memberdownloadRead.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.memberdownload" type="any" />
<cfparam name="attributes.class" type="string" default="readpage" />
<cfset memberdownload = attributes.memberdownload /> 
<cfoutput>
<table>
	<tbody>
		<tr>
			<th>Memberdownloadid</th>
			<td>#memberdownload.getMEMBERDOWNLOADID()#</td>
		</tr>
		<tr>
			<th>Memberid</th>
			<td>#memberdownload.getMEMBERID()#</td>
		</tr>
		<tr>
			<th>Couponid</th>
			<td>#memberdownload.getCOUPONID()#</td>
		</tr>
		<tr>
			<th>Couponcode</th>
			<td>#memberdownload.getCOUPONCODE()#</td>
		</tr>
	</tbody>
</table>
</cfoutput>
</cfprocessingdirective>
<cfexit method="exitTag" />