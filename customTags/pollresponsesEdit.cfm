<!--- pollresponsesEdit.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.pollresponses" type="any" />
<cfparam name="attributes.message" type="string" default="" />
<cfset pollresponses = attributes.pollresponses /> 
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
			<input name="POLLID" type="hidden" value="#pollresponses.getPOLLID()#" />
		<tr>
			<th><label for="A1">A1:</label></th>
			<td><input name="A1" type="text" id="A1" value="#pollresponses.getA1()#" /></td>
		</tr>
		<tr>
			<th><label for="A2">A2:</label></th>
			<td><input name="A2" type="text" id="A2" value="#pollresponses.getA2()#" /></td>
		</tr>
		<tr>
			<th><label for="A3">A3:</label></th>
			<td><input name="A3" type="text" id="A3" value="#pollresponses.getA3()#" /></td>
		</tr>
		<tr>
			<th><label for="A4">A4:</label></th>
			<td><input name="A4" type="text" id="A4" value="#pollresponses.getA4()#" /></td>
		</tr>
		<tr>
			<th><label for="A5">A5:</label></th>
			<td><input name="A5" type="text" id="A5" value="#pollresponses.getA5()#" /></td>
		</tr>
		<tr>
			<th><label for="TOTAL">Total:</label></th>
			<td><input name="TOTAL" type="text" id="TOTAL" value="#pollresponses.getTOTAL()#" /></td>
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