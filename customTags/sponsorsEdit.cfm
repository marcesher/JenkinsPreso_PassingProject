<!--- sponsorsEdit.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.sponsors" type="any" />
<cfparam name="attributes.message" type="string" default="" />
<cfset sponsors = attributes.sponsors /> 
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
			<input name="SPONSORID" type="hidden" value="#sponsors.getSPONSORID()#" />
		<tr>
			<th><label for="SPONSORNAME">Sponsorname:</label></th>
			<td><input name="SPONSORNAME" type="text" id="SPONSORNAME" value="#sponsors.getSPONSORNAME()#" /></td>
		</tr>
		<tr>
			<th><label for="WEBADDRESS">Webaddress:</label></th>
			<td><input name="WEBADDRESS" type="text" id="WEBADDRESS" value="#sponsors.getWEBADDRESS()#" /></td>
		</tr>
		<tr>
			<th><label for="DESCRIPTION">Description:</label></th>
			<td><cftextarea name="DESCRIPTION"  id="DESCRIPTION" value="#sponsors.getDESCRIPTION()#" richtext="true" toolbar="Basic" skin="Silver" /></td>
		</tr>
		<tr>
			<th><label for="SPONSORAD">Sponsorad:</label></th>
			<td><input name="SPONSORAD" type="text" id="SPONSORAD" value="#sponsors.getSPONSORAD()#" /></td>
		</tr>
		<tr>
			<th><label for="ISSPOTLIGHT">Isspotlight:</label></th>
			<td><input name="ISSPOTLIGHT" type="text" id="ISSPOTLIGHT" value="#sponsors.getISSPOTLIGHT()#" /></td>
		</tr>
		<tr>
			<th><label for="CITY">City:</label></th>
			<td><input name="CITY" type="text" id="CITY" value="#sponsors.getCITY()#" /></td>
		</tr>
		<tr>
			<th><label for="STATE">State:</label></th>
			<td><input name="STATE" type="text" id="STATE" value="#sponsors.getSTATE()#" /></td>
		</tr>
		<tr>
			<th><label for="ADDRESS">Address:</label></th>
			<td><input name="ADDRESS" type="text" id="ADDRESS" value="#sponsors.getADDRESS()#" /></td>
		</tr>
		<tr>
			<th><label for="POSTALCODE">Postalcode:</label></th>
			<td><input name="POSTALCODE" type="text" id="POSTALCODE" value="#sponsors.getPOSTALCODE()#" /></td>
		</tr>
		<tr>
			<th><label for="PHONE">Phone:</label></th>
			<td><input name="PHONE" type="text" id="PHONE" value="#sponsors.getPHONE()#" /></td>
		</tr>
		<tr>
			<th><label for="MAP">Map:</label></th>
			<td><input name="MAP" type="text" id="MAP" value="#sponsors.getMAP()#" /></td>
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