<!--- couponsEdit.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.coupons" type="any" />
<cfparam name="attributes.message" type="string" default="" />
<cfset coupons = attributes.coupons /> 
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
			<input name="COUPONID" type="hidden" value="#coupons.getCOUPONID()#" />
		<tr>
			<th><label for="SPONSORID">Sponsorid:</label></th>
			<td><input name="SPONSORID" type="text" id="SPONSORID" value="#coupons.getSPONSORID()#" /></td>
		</tr>
		<tr>
			<th><label for="COUPON">Coupon:</label></th>
			<td><cftextarea name="COUPON"  id="COUPON" value="#coupons.getCOUPON()#" richtext="true" toolbar="Basic" skin="Silver" /></td>
		</tr>
		<tr>
			<th><label for="EXPIRATIONDATE">Expirationdate:</label></th>
			<td><input name="EXPIRATIONDATE" type="text" id="EXPIRATIONDATE" value="#coupons.getEXPIRATIONDATE()#" /></td>
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