<cfsetting showdebugoutput="false" />
<cfparam name="url.method" type="string" default="list" />
<cfparam name="url.MEETINGID" type="any" default="0" />
<cfparam name="url.message" type="string" default="" />
<cfparam name="url.offset" type="numeric" default="0" />
<cfparam name="url.maxresults" type="numeric" default="10" />
<cfimport path="CFO_JenkinsPreso_PassingProject.cfc.*" />
<cf_pageWrapper>

<h2>Meetings</h2>

<cfswitch expression="#url.method#" >

	<cfcase value="list">
		<cfset meetingsArray = entityLoad("meetings", {}, "MEETINGID asc", {offset=url.offset, maxresults=url.maxresults} ) />
		<cfoutput><p class="breadcrumb">
			<a href="index.cfm">Main</a> / <a href="#cgi.script_name#">List</a> /
			<a href="meetings.cfm?method=edit">New</a>
		</p></cfoutput>
		<cf_meetingsList meetingsArray = "#meetingsArray#" message="#url.message#" offset="#url.offset#" maxresults="#url.maxresults#" /> 
	</cfcase>

	<cfcase value="read">
		<cfset meetings = entityLoad("meetings", url.MEETINGID, true) />
		<cfoutput><p class="breadcrumb">
			<a href="index.cfm">Main</a> / <a href="#cgi.script_name#">List</a> /
			<a href="meetings.cfm?method=edit&amp;MEETINGID=#meetings.getMEETINGID()#">Edit</a> /
			<a href="meetings.cfm?method=edit">New</a>
		</p></cfoutput>
		<cf_meetingsRead meetings = "#meetings#" /> 
	</cfcase>

	<cfcase value="edit">
		<cfif url.MEETINGID eq 0>
			<cfset meetings = New meetings() />
		<cfelse>
			<cfset meetings = entityLoad("meetings", url.MEETINGID, true) />
		</cfif>
		<cfoutput><p class="breadcrumb">
			<a href="index.cfm">Main</a> / <a href="#cgi.script_name#">List</a> /
		<cfif url.MEETINGID neq 0>
			<a href="meetings.cfm?method=read&amp;MEETINGID=#meetings.getMEETINGID()#">Read</a> /
			<a href="meetings.cfm?method=edit">New</a>
		</cfif>
		</p></cfoutput>

		<cf_meetingsEdit meetings = "#meetings#" message="#url.message#" /> 
	</cfcase>

	<cfcase value="edit_process">
		<cfset meetings = EntityNew("meetings") />
		<cfset meetings = meetings.populate(form) />
		<cfset EntitySave(meetings) />
		<cfset ORMFlush() />
		<cflocation url ="#cgi.script_name#?method=edit&MEETINGID=#meetings.getMEETINGID()#&message=updated" />
	</cfcase>

	<cfcase value="delete_process">
		<cfset meetings = entityLoad("meetings", url.MEETINGID, true) />
		<cfset EntityDelete(meetings) />
		<cfset ORMFlush() />
		<cflocation url ="#cgi.script_name#?method=list&message=deleted" />
	</cfcase>

</cfswitch>
</cf_pageWrapper>