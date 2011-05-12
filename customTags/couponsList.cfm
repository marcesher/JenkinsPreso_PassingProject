<!--- couponsList.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.couponsArray" type="array" />
<cfparam name="attributes.maxresults" type="numeric" default="-1" />
<cfparam name="attributes.offset" type="numeric" default="-1" />
<cfset couponsCount = ormExecuteQuery("select Count(*) from coupons")[1]  />
<cfset prevOffset = attributes.offset - attributes.maxresults />
<cfset nextOffset = attributes.offset + attributes.maxresults />
<cfset pages = Ceiling(couponsCount / attributes.maxresults) />


<cfset message = attributes.message /> 
<cfif CompareNoCase(message, "deleted") eq 0>
	<p class="alert">Record deleted</p>
<cfelse>
	<p></p>
</cfif>
<cfoutput>
<table>
	<thead>
		<tr>
			<th>Couponid</th>
			<th>Sponsorid</th>
			<th>Coupon</th>
			<th>Expirationdate</th>
		</tr>
	</thead>
	<tbody>
	<cfloop array="#attributes.couponsArray#" index="coupons">
		<tr>
			<td>#coupons.getCOUPONID()#</td>
			<td>#coupons.getSPONSORID()#</td>
			<td>#coupons.getCOUPON()#</td>
			<td>#dateFormat(coupons.getEXPIRATIONDATE(),"mm/dd/yyyy" )# #timeFormat(coupons.getEXPIRATIONDATE(),"h:mm tt" )#</td>
			<td class="crudlink"><a href="coupons.cfm?method=read&COUPONID=#coupons.getCOUPONID()#">Read</a></td>
			<td class="crudlink"><a href="coupons.cfm?method=edit&COUPONID=#coupons.getCOUPONID()#">Edit</a></td>
			<td class="crudlink"><a href="coupons.cfm?method=delete_process&COUPONID=#coupons.getCOUPONID()#" onclick="if (confirm('Are you sure?')) { return true}; return false"">Delete</a></td>
		</tr>
	</cfloop>
<cfif attributes.offset gte 0>
	<tr>
	<td colspan="7">
		<table class="listnav">
			<tr>
				<td class="prev">
					<cfif prevOffset gte 0>
						<a href="?offset=#prevOffset#&amp;maxresults=#attributes.maxresults#">&larr; Prev</a>
					</cfif>
				</td>
				<td class="pages">
					<cfloop index="i" from="1" to="#pages#">
						<cfset offset = 0 + ((i -1) * attributes.maxresults) />
						<cfif offset eq attributes.offset>
							#i#
						<cfelse>
							<a href="?offset=#offset#&amp;maxresults=#attributes.maxresults#">#i#</a>
						</cfif>
					</cfloop>
				</td>
				<td class="next">
					<cfif nextOffset lt couponsCount>
					<a href="?offset=#nextOffset#&amp;maxresults=#attributes.maxresults#">Next &rarr;<a/>
					</cfif>
				</td>
			</tr>
		</table>
	</td>
	</tr>
</cfif>
	</tbody>
	</cfoutput>
</table>
</cfprocessingdirective>
<cfexit method="exitTag" />