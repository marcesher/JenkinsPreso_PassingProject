<cfsetting showdebugoutput="false" />
<cfparam name="url.method" type="string" default="list" />
<cfparam name="url.SPONSORID" type="any" default="0" />
<cfparam name="url.message" type="string" default="" />
<cfparam name="url.offset" type="numeric" default="0" />
<cfparam name="url.maxresults" type="numeric" default="10" />
<cfimport path="CFO_JenkinsPreso_PassingProject.cfc.*" />
<cf_pageWrapper>

<h2>Sponsors</h2>

<cfswitch expression="#url.method#" >

	<cfcase value="list">
		<cfset sponsorsArray = entityLoad("sponsors", {}, "SPONSORID asc", {offset=url.offset, maxresults=url.maxresults} ) />
		<cfoutput><p class="breadcrumb">
			<a href="index.cfm">Main</a> / <a href="#cgi.script_name#">List</a> /
			<a href="sponsors.cfm?method=edit">New</a>
		</p></cfoutput>
		<cf_sponsorsList sponsorsArray = "#sponsorsArray#" message="#url.message#" offset="#url.offset#" maxresults="#url.maxresults#" /> 
	</cfcase>

	<cfcase value="read">
		<cfset sponsors = entityLoad("sponsors", url.SPONSORID, true) />
		<cfoutput><p class="breadcrumb">
			<a href="index.cfm">Main</a> / <a href="#cgi.script_name#">List</a> /
			<a href="sponsors.cfm?method=edit&amp;SPONSORID=#sponsors.getSPONSORID()#">Edit</a> /
			<a href="sponsors.cfm?method=edit">New</a>
		</p></cfoutput>
		<cf_sponsorsRead sponsors = "#sponsors#" /> 
	</cfcase>

	<cfcase value="edit">
		<cfif url.SPONSORID eq 0>
			<cfset sponsors = New sponsors() />
		<cfelse>
			<cfset sponsors = entityLoad("sponsors", url.SPONSORID, true) />
		</cfif>
		<cfoutput><p class="breadcrumb">
			<a href="index.cfm">Main</a> / <a href="#cgi.script_name#">List</a> /
		<cfif url.SPONSORID neq 0>
			<a href="sponsors.cfm?method=read&amp;SPONSORID=#sponsors.getSPONSORID()#">Read</a> /
			<a href="sponsors.cfm?method=edit">New</a>
		</cfif>
		</p></cfoutput>

		<cf_sponsorsEdit sponsors = "#sponsors#" message="#url.message#" /> 
	</cfcase>

	<cfcase value="edit_process">
		<cfset sponsors = EntityNew("sponsors") />
		<cfset sponsors = sponsors.populate(form) />
		<cfset EntitySave(sponsors) />
		<cfset ORMFlush() />
		<cflocation url ="#cgi.script_name#?method=edit&SPONSORID=#sponsors.getSPONSORID()#&message=updated" />
	</cfcase>

	<cfcase value="delete_process">
		<cfset sponsors = entityLoad("sponsors", url.SPONSORID, true) />
		<cfset EntityDelete(sponsors) />
		<cfset ORMFlush() />
		<cflocation url ="#cgi.script_name#?method=list&message=deleted" />
	</cfcase>

</cfswitch>
</cf_pageWrapper>