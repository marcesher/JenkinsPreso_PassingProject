<!--- authorsEdit.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.authors" type="any" />
<cfparam name="attributes.message" type="string" default="" />
<cfset authors = attributes.authors /> 
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
			<input name="AUTHORID" type="hidden" value="#authors.getAUTHORID()#" />
		<tr>
			<th><label for="FIRSTNAME">Firstname:</label></th>
			<td><input name="FIRSTNAME" type="text" id="FIRSTNAME" value="#authors.getFIRSTNAME()#" /></td>
		</tr>
		<tr>
			<th><label for="LASTNAME">Lastname:</label></th>
			<td><input name="LASTNAME" type="text" id="LASTNAME" value="#authors.getLASTNAME()#" /></td>
		</tr>
		<tr>
			<th><label for="BIO">Bio:</label></th>
			<td><cftextarea name="BIO"  id="BIO" value="#authors.getBIO()#" richtext="true" toolbar="Basic" skin="Silver" /></td>
		</tr>
		<tr>
			<th><label for="ISSPOTLIGHT">Isspotlight:</label></th>
			<td><input name="ISSPOTLIGHT" type="text" id="ISSPOTLIGHT" value="#authors.getISSPOTLIGHT()#" /></td>
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