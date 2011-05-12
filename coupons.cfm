<cfsetting showdebugoutput="false" />
<cfparam name="url.method" type="string" default="list" />
<cfparam name="url.COUPONID" type="any" default="0" />
<cfparam name="url.message" type="string" default="" />
<cfparam name="url.offset" type="numeric" default="0" />
<cfparam name="url.maxresults" type="numeric" default="10" />
<cfimport path="CFO_JenkinsPreso_PassingProject.cfc.*" />
<cf_pageWrapper>

<h2>Coupons</h2>

<cfswitch expression="#url.method#" >

	<cfcase value="list">
		<cfset couponsArray = entityLoad("coupons", {}, "COUPONID asc", {offset=url.offset, maxresults=url.maxresults} ) />
		<cfoutput><p class="breadcrumb">
			<a href="index.cfm">Main</a> / <a href="#cgi.script_name#">List</a> /
			<a href="coupons.cfm?method=edit">New</a>
		</p></cfoutput>
		<cf_couponsList couponsArray = "#couponsArray#" message="#url.message#" offset="#url.offset#" maxresults="#url.maxresults#" /> 
	</cfcase>

	<cfcase value="read">
		<cfset coupons = entityLoad("coupons", url.COUPONID, true) />
		<cfoutput><p class="breadcrumb">
			<a href="index.cfm">Main</a> / <a href="#cgi.script_name#">List</a> /
			<a href="coupons.cfm?method=edit&amp;COUPONID=#coupons.getCOUPONID()#">Edit</a> /
			<a href="coupons.cfm?method=edit">New</a>
		</p></cfoutput>
		<cf_couponsRead coupons = "#coupons#" /> 
	</cfcase>

	<cfcase value="edit">
		<cfif url.COUPONID eq 0>
			<cfset coupons = New coupons() />
		<cfelse>
			<cfset coupons = entityLoad("coupons", url.COUPONID, true) />
		</cfif>
		<cfoutput><p class="breadcrumb">
			<a href="index.cfm">Main</a> / <a href="#cgi.script_name#">List</a> /
		<cfif url.COUPONID neq 0>
			<a href="coupons.cfm?method=read&amp;COUPONID=#coupons.getCOUPONID()#">Read</a> /
			<a href="coupons.cfm?method=edit">New</a>
		</cfif>
		</p></cfoutput>

		<cf_couponsEdit coupons = "#coupons#" message="#url.message#" /> 
	</cfcase>

	<cfcase value="edit_process">
		<cfset coupons = EntityNew("coupons") />
		<cfset coupons = coupons.populate(form) />
		<cfset EntitySave(coupons) />
		<cfset ORMFlush() />
		<cflocation url ="#cgi.script_name#?method=edit&COUPONID=#coupons.getCOUPONID()#&message=updated" />
	</cfcase>

	<cfcase value="delete_process">
		<cfset coupons = entityLoad("coupons", url.COUPONID, true) />
		<cfset EntityDelete(coupons) />
		<cfset ORMFlush() />
		<cflocation url ="#cgi.script_name#?method=list&message=deleted" />
	</cfcase>

</cfswitch>
</cf_pageWrapper>