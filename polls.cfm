<cfsetting showdebugoutput="false" />
<cfparam name="url.method" type="string" default="list" />
<cfparam name="url.POLLID" type="any" default="0" />
<cfparam name="url.message" type="string" default="" />
<cfparam name="url.offset" type="numeric" default="0" />
<cfparam name="url.maxresults" type="numeric" default="10" />
<cfimport path="CFO_JenkinsPreso_PassingProject.cfc.*" />
<cf_pageWrapper>

<h2>Polls</h2>

<cfswitch expression="#url.method#" >

	<cfcase value="list">
		<cfset pollsArray = entityLoad("polls", {}, "POLLID asc", {offset=url.offset, maxresults=url.maxresults} ) />
		<cfoutput><p class="breadcrumb">
			<a href="index.cfm">Main</a> / <a href="#cgi.script_name#">List</a> /
			<a href="polls.cfm?method=edit">New</a>
		</p></cfoutput>
		<cf_pollsList pollsArray = "#pollsArray#" message="#url.message#" offset="#url.offset#" maxresults="#url.maxresults#" /> 
	</cfcase>

	<cfcase value="read">
		<cfset polls = entityLoad("polls", url.POLLID, true) />
		<cfoutput><p class="breadcrumb">
			<a href="index.cfm">Main</a> / <a href="#cgi.script_name#">List</a> /
			<a href="polls.cfm?method=edit&amp;POLLID=#polls.getPOLLID()#">Edit</a> /
			<a href="polls.cfm?method=edit">New</a>
		</p></cfoutput>
		<cf_pollsRead polls = "#polls#" /> 
	</cfcase>

	<cfcase value="edit">
		<cfif url.POLLID eq 0>
			<cfset polls = New polls() />
		<cfelse>
			<cfset polls = entityLoad("polls", url.POLLID, true) />
		</cfif>
		<cfoutput><p class="breadcrumb">
			<a href="index.cfm">Main</a> / <a href="#cgi.script_name#">List</a> /
		<cfif url.POLLID neq 0>
			<a href="polls.cfm?method=read&amp;POLLID=#polls.getPOLLID()#">Read</a> /
			<a href="polls.cfm?method=edit">New</a>
		</cfif>
		</p></cfoutput>

		<cf_pollsEdit polls = "#polls#" message="#url.message#" /> 
	</cfcase>

	<cfcase value="edit_process">
		<cfset polls = EntityNew("polls") />
		<cfset polls = polls.populate(form) />
		<cfset EntitySave(polls) />
		<cfset ORMFlush() />
		<cflocation url ="#cgi.script_name#?method=edit&POLLID=#polls.getPOLLID()#&message=updated" />
	</cfcase>

	<cfcase value="delete_process">
		<cfset polls = entityLoad("polls", url.POLLID, true) />
		<cfset EntityDelete(polls) />
		<cfset ORMFlush() />
		<cflocation url ="#cgi.script_name#?method=list&message=deleted" />
	</cfcase>

</cfswitch>
</cf_pageWrapper>