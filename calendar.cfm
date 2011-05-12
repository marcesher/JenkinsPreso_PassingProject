<cfsetting showdebugoutput="false" />
<cfparam name="url.method" type="string" default="list" />
<cfparam name="url.CALENDARID" type="any" default="0" />
<cfparam name="url.message" type="string" default="" />
<cfparam name="url.offset" type="numeric" default="0" />
<cfparam name="url.maxresults" type="numeric" default="10" />
<cfimport path="CFO_JenkinsPreso_PassingProject.cfc.*" />
<cf_pageWrapper>

<h2>Calendar</h2>

<cfswitch expression="#url.method#" >

	<cfcase value="list">
		<cfset calendarArray = entityLoad("calendar", {}, "CALENDARID asc", {offset=url.offset, maxresults=url.maxresults} ) />
		<cfoutput><p class="breadcrumb">
			<a href="index.cfm">Main</a> / <a href="#cgi.script_name#">List</a> /
			<a href="calendar.cfm?method=edit">New</a>
		</p></cfoutput>
		<cf_calendarList calendarArray = "#calendarArray#" message="#url.message#" offset="#url.offset#" maxresults="#url.maxresults#" /> 
	</cfcase>

	<cfcase value="read">
		<cfset calendar = entityLoad("calendar", url.CALENDARID, true) />
		<cfoutput><p class="breadcrumb">
			<a href="index.cfm">Main</a> / <a href="#cgi.script_name#">List</a> /
			<a href="calendar.cfm?method=edit&amp;CALENDARID=#calendar.getCALENDARID()#">Edit</a> /
			<a href="calendar.cfm?method=edit">New</a>
		</p></cfoutput>
		<cf_calendarRead calendar = "#calendar#" /> 
	</cfcase>

	<cfcase value="edit">
		<cfif url.CALENDARID eq 0>
			<cfset calendar = New calendar() />
		<cfelse>
			<cfset calendar = entityLoad("calendar", url.CALENDARID, true) />
		</cfif>
		<cfoutput><p class="breadcrumb">
			<a href="index.cfm">Main</a> / <a href="#cgi.script_name#">List</a> /
		<cfif url.CALENDARID neq 0>
			<a href="calendar.cfm?method=read&amp;CALENDARID=#calendar.getCALENDARID()#">Read</a> /
			<a href="calendar.cfm?method=edit">New</a>
		</cfif>
		</p></cfoutput>

		<cf_calendarEdit calendar = "#calendar#" message="#url.message#" /> 
	</cfcase>

	<cfcase value="edit_process">
		<cfset calendar = EntityNew("calendar") />
		<cfset calendar = calendar.populate(form) />
		<cfset EntitySave(calendar) />
		<cfset ORMFlush() />
		<cflocation url ="#cgi.script_name#?method=edit&CALENDARID=#calendar.getCALENDARID()#&message=updated" />
	</cfcase>

	<cfcase value="delete_process">
		<cfset calendar = entityLoad("calendar", url.CALENDARID, true) />
		<cfset EntityDelete(calendar) />
		<cfset ORMFlush() />
		<cflocation url ="#cgi.script_name#?method=list&message=deleted" />
	</cfcase>

</cfswitch>
</cf_pageWrapper>