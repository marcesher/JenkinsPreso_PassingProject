<cfsetting showdebugoutput="false" />
<cfparam name="url.method" type="string" default="list" />
<cfparam name="url.ID" type="any" default="0" />
<cfparam name="url.message" type="string" default="" />
<cfparam name="url.offset" type="numeric" default="0" />
<cfparam name="url.maxresults" type="numeric" default="10" />
<cfimport path="CFO_JenkinsPreso_PassingProject.cfc.*" />
<cf_pageWrapper>

<h2>Blogentries</h2>

<cfswitch expression="#url.method#" >

	<cfcase value="list">
		<cfset blogentriesArray = entityLoad("blogentries", {}, "ID asc", {offset=url.offset, maxresults=url.maxresults} ) />
		<cfoutput><p class="breadcrumb">
			<a href="index.cfm">Main</a> / <a href="#cgi.script_name#">List</a> /
			<a href="blogentries.cfm?method=edit">New</a>
		</p></cfoutput>
		<cf_blogentriesList blogentriesArray = "#blogentriesArray#" message="#url.message#" offset="#url.offset#" maxresults="#url.maxresults#" /> 
	</cfcase>

	<cfcase value="read">
		<cfset blogentries = entityLoad("blogentries", url.ID, true) />
		<cfoutput><p class="breadcrumb">
			<a href="index.cfm">Main</a> / <a href="#cgi.script_name#">List</a> /
			<a href="blogentries.cfm?method=edit&amp;ID=#blogentries.getID()#">Edit</a> /
			<a href="blogentries.cfm?method=edit">New</a>
		</p></cfoutput>
		<cf_blogentriesRead blogentries = "#blogentries#" /> 
	</cfcase>

	<cfcase value="edit">
		<cfif url.ID eq 0>
			<cfset blogentries = New blogentries() />
		<cfelse>
			<cfset blogentries = entityLoad("blogentries", url.ID, true) />
		</cfif>
		<cfoutput><p class="breadcrumb">
			<a href="index.cfm">Main</a> / <a href="#cgi.script_name#">List</a> /
		<cfif url.ID neq 0>
			<a href="blogentries.cfm?method=read&amp;ID=#blogentries.getID()#">Read</a> /
			<a href="blogentries.cfm?method=edit">New</a>
		</cfif>
		</p></cfoutput>

		<cf_blogentriesEdit blogentries = "#blogentries#" message="#url.message#" /> 
	</cfcase>

	<cfcase value="edit_process">
		<cfset blogentries = EntityNew("blogentries") />
		<cfset blogentries = blogentries.populate(form) />
		<cfset EntitySave(blogentries) />
		<cfset ORMFlush() />
		<cflocation url ="#cgi.script_name#?method=edit&ID=#blogentries.getID()#&message=updated" />
	</cfcase>

	<cfcase value="delete_process">
		<cfset blogentries = entityLoad("blogentries", url.ID, true) />
		<cfset EntityDelete(blogentries) />
		<cfset ORMFlush() />
		<cflocation url ="#cgi.script_name#?method=list&message=deleted" />
	</cfcase>

</cfswitch>
</cf_pageWrapper>