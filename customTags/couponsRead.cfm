<!--- couponsRead.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.coupons" type="any" />
<cfparam name="attributes.class" type="string" default="readpage" />
<cfset coupons = attributes.coupons /> 
<cfoutput>
<table>
	<tbody>
		<tr>
			<th>Couponid</th>
			<td>#coupons.getCOUPONID()#</td>
		</tr>
		<tr>
			<th>Sponsorid</th>
			<td>#coupons.getSPONSORID()#</td>
		</tr>
		<tr>
			<th>Coupon</th>
			<td>#coupons.getCOUPON()#</td>
		</tr>
		<tr>
			<th>Expirationdate</th>
			<td>#dateFormat(coupons.getEXPIRATIONDATE(),"mm/dd/yyyy" )# #timeFormat(coupons.getEXPIRATIONDATE(),"h:mm tt" )#</td>
		</tr>
	</tbody>
</table>
</cfoutput>
</cfprocessingdirective>
<cfexit method="exitTag" />