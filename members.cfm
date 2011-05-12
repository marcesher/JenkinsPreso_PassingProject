<cfsetting showdebugoutput="false" />
<cfparam name="url.method" type="string" default="list" />
<cfparam name="url.MEMBERID" type="any" default="0" />
<cfparam name="url.message" type="string" default="" />
<cfparam name="url.offset" type="numeric" default="0" />
<cfparam name="url.maxresults" type="numeric" default="10" />
<cfimport path="CFO_JenkinsPreso_PassingProject.cfc.*" />
<cf_pageWrapper>

<h2>Members</h2>

<cfswitch expression="#url.method#" >

	<cfcase value="list">
		<cfset membersArray = entityLoad("members", {}, "MEMBERID asc", {offset=url.offset, maxresults=url.maxresults} ) />
		<cfoutput><p class="breadcrumb">
			<a href="index.cfm">Main</a> / <a href="#cgi.script_name#">List</a> /
			<a href="members.cfm?method=edit">New</a>
		</p></cfoutput>
		<cf_membersList membersArray = "#membersArray#" message="#url.message#" offset="#url.offset#" maxresults="#url.maxresults#" /> 
	</cfcase>

	<cfcase value="read">
		<cfset members = entityLoad("members", url.MEMBERID, true) />
		<cfoutput><p class="breadcrumb">
			<a href="index.cfm">Main</a> / <a href="#cgi.script_name#">List</a> /
			<a href="members.cfm?method=edit&amp;MEMBERID=#members.getMEMBERID()#">Edit</a> /
			<a href="members.cfm?method=edit">New</a>
		</p></cfoutput>
		<cf_membersRead members = "#members#" /> 
	</cfcase>

	<cfcase value="edit">
		<cfif url.MEMBERID eq 0>
			<cfset members = New members() />
		<cfelse>
			<cfset members = entityLoad("members", url.MEMBERID, true) />
		</cfif>
		<cfoutput><p class="breadcrumb">
			<a href="index.cfm">Main</a> / <a href="#cgi.script_name#">List</a> /
		<cfif url.MEMBERID neq 0>
			<a href="members.cfm?method=read&amp;MEMBERID=#members.getMEMBERID()#">Read</a> /
			<a href="members.cfm?method=edit">New</a>
		</cfif>
		</p></cfoutput>

		<cf_membersEdit members = "#members#" message="#url.message#" /> 
	</cfcase>

	<cfcase value="edit_process">
		<cfset members = EntityNew("members") />
		<cfset members = members.populate(form) />
		<cfset EntitySave(members) />
		<cfset ORMFlush() />
		<cflocation url ="#cgi.script_name#?method=edit&MEMBERID=#members.getMEMBERID()#&message=updated" />
	</cfcase>

	<cfcase value="delete_process">
		<cfset members = entityLoad("members", url.MEMBERID, true) />
		<cfset EntityDelete(members) />
		<cfset ORMFlush() />
		<cflocation url ="#cgi.script_name#?method=list&message=deleted" />
	</cfcase>

</cfswitch>
</cf_pageWrapper>