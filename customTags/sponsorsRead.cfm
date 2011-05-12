<!--- sponsorsRead.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.sponsors" type="any" />
<cfparam name="attributes.class" type="string" default="readpage" />
<cfset sponsors = attributes.sponsors /> 
<cfoutput>
<table>
	<tbody>
		<tr>
			<th>Sponsorid</th>
			<td>#sponsors.getSPONSORID()#</td>
		</tr>
		<tr>
			<th>Sponsorname</th>
			<td>#sponsors.getSPONSORNAME()#</td>
		</tr>
		<tr>
			<th>Webaddress</th>
			<td>#sponsors.getWEBADDRESS()#</td>
		</tr>
		<tr>
			<th>Description</th>
			<td>#sponsors.getDESCRIPTION()#</td>
		</tr>
		<tr>
			<th>Sponsorad</th>
			<td>#sponsors.getSPONSORAD()#</td>
		</tr>
		<tr>
			<th>Isspotlight</th>
			<td>#sponsors.getISSPOTLIGHT()#</td>
		</tr>
		<tr>
			<th>City</th>
			<td>#sponsors.getCITY()#</td>
		</tr>
		<tr>
			<th>State</th>
			<td>#sponsors.getSTATE()#</td>
		</tr>
		<tr>
			<th>Address</th>
			<td>#sponsors.getADDRESS()#</td>
		</tr>
		<tr>
			<th>Postalcode</th>
			<td>#sponsors.getPOSTALCODE()#</td>
		</tr>
		<tr>
			<th>Phone</th>
			<td>#sponsors.getPHONE()#</td>
		</tr>
		<tr>
			<th>Map</th>
			<td>#sponsors.getMAP()#</td>
		</tr>
	</tbody>
</table>
</cfoutput>
</cfprocessingdirective>
<cfexit method="exitTag" />