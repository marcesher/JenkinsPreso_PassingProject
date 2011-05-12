<!--- memberdownloadEdit.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.memberdownload" type="any" />
<cfparam name="attributes.message" type="string" default="" />
<cfset memberdownload = attributes.memberdownload /> 
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
			<input name="MEMBERDOWNLOADID" type="hidden" value="#memberdownload.getMEMBERDOWNLOADID()#" />
		<tr>
			<th><label for="MEMBERID">Memberid:</label></th>
			<td><input name="MEMBERID" type="text" id="MEMBERID" value="#memberdownload.getMEMBERID()#" /></td>
		</tr>
		<tr>
			<th><label for="COUPONID">Couponid:</label></th>
			<td><input name="COUPONID" type="text" id="COUPONID" value="#memberdownload.getCOUPONID()#" /></td>
		</tr>
		<tr>
			<th><label for="COUPONCODE">Couponcode:</label></th>
			<td><input name="COUPONCODE" type="text" id="COUPONCODE" value="#memberdownload.getCOUPONCODE()#" /></td>
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