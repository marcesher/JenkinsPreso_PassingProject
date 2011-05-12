<cfsetting showdebugoutput="false" />
<cfparam name="url.method" type="string" default="list" />
<cfparam name="url.POLLID" type="any" default="0" />
<cfparam name="url.message" type="string" default="" />
<cfparam name="url.offset" type="numeric" default="0" />
<cfparam name="url.maxresults" type="numeric" default="10" />
<cfimport path="CFO_JenkinsPreso_PassingProject.cfc.*" />
<cf_pageWrapper>

<h2>Pollresponses</h2>

<cfswitch expression="#url.method#" >

	<cfcase value="list">
		<cfset pollresponsesArray = entityLoad("pollresponses", {}, "POLLID asc", {offset=url.offset, maxresults=url.maxresults} ) />
		<cfoutput><p class="breadcrumb">
			<a href="index.cfm">Main</a> / <a href="#cgi.script_name#">List</a> /
			<a href="pollresponses.cfm?method=edit">New</a>
		</p></cfoutput>
		<cf_pollresponsesList pollresponsesArray = "#pollresponsesArray#" message="#url.message#" offset="#url.offset#" maxresults="#url.maxresults#" /> 
	</cfcase>

	<cfcase value="read">
		<cfset pollresponses = entityLoad("pollresponses", url.POLLID, true) />
		<cfoutput><p class="breadcrumb">
			<a href="index.cfm">Main</a> / <a href="#cgi.script_name#">List</a> /
			<a href="pollresponses.cfm?method=edit&amp;POLLID=#pollresponses.getPOLLID()#">Edit</a> /
			<a href="pollresponses.cfm?method=edit">New</a>
		</p></cfoutput>
		<cf_pollresponsesRead pollresponses = "#pollresponses#" /> 
	</cfcase>

	<cfcase value="edit">
		<cfif url.POLLID eq 0>
			<cfset pollresponses = New pollresponses() />
		<cfelse>
			<cfset pollresponses = entityLoad("pollresponses", url.POLLID, true) />
		</cfif>
		<cfoutput><p class="breadcrumb">
			<a href="index.cfm">Main</a> / <a href="#cgi.script_name#">List</a> /
		<cfif url.POLLID neq 0>
			<a href="pollresponses.cfm?method=read&amp;POLLID=#pollresponses.getPOLLID()#">Read</a> /
			<a href="pollresponses.cfm?method=edit">New</a>
		</cfif>
		</p></cfoutput>

		<cf_pollresponsesEdit pollresponses = "#pollresponses#" message="#url.message#" /> 
	</cfcase>

	<cfcase value="edit_process">
		<cfset pollresponses = EntityNew("pollresponses") />
		<cfset pollresponses = pollresponses.populate(form) />
		<cfset EntitySave(pollresponses) />
		<cfset ORMFlush() />
		<cflocation url ="#cgi.script_name#?method=edit&POLLID=#pollresponses.getPOLLID()#&message=updated" />
	</cfcase>

	<cfcase value="delete_process">
		<cfset pollresponses = entityLoad("pollresponses", url.POLLID, true) />
		<cfset EntityDelete(pollresponses) />
		<cfset ORMFlush() />
		<cflocation url ="#cgi.script_name#?method=list&message=deleted" />
	</cfcase>

</cfswitch>
</cf_pageWrapper>