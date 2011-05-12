<cfsetting showdebugoutput="false" />
<cfparam name="url.method" type="string" default="list" />
<cfparam name="url.ID" type="any" default="0" />
<cfparam name="url.message" type="string" default="" />
<cfparam name="url.offset" type="numeric" default="0" />
<cfparam name="url.maxresults" type="numeric" default="10" />
<cfimport path="CFO_JenkinsPreso_PassingProject.cfc.*" />
<cf_pageWrapper>

<h2>Blogcomments</h2>

<cfswitch expression="#url.method#" >

	<cfcase value="list">
		<cfset blogcommentsArray = entityLoad("blogcomments", {}, "ID asc", {offset=url.offset, maxresults=url.maxresults} ) />
		<cfoutput><p class="breadcrumb">
			<a href="index.cfm">Main</a> / <a href="#cgi.script_name#">List</a> /
			<a href="blogcomments.cfm?method=edit">New</a>
		</p></cfoutput>
		<cf_blogcommentsList blogcommentsArray = "#blogcommentsArray#" message="#url.message#" offset="#url.offset#" maxresults="#url.maxresults#" /> 
	</cfcase>

	<cfcase value="read">
		<cfset blogcomments = entityLoad("blogcomments", url.ID, true) />
		<cfoutput><p class="breadcrumb">
			<a href="index.cfm">Main</a> / <a href="#cgi.script_name#">List</a> /
			<a href="blogcomments.cfm?method=edit&amp;ID=#blogcomments.getID()#">Edit</a> /
			<a href="blogcomments.cfm?method=edit">New</a>
		</p></cfoutput>
		<cf_blogcommentsRead blogcomments = "#blogcomments#" /> 
	</cfcase>

	<cfcase value="edit">
		<cfif url.ID eq 0>
			<cfset blogcomments = New blogcomments() />
		<cfelse>
			<cfset blogcomments = entityLoad("blogcomments", url.ID, true) />
		</cfif>
		<cfoutput><p class="breadcrumb">
			<a href="index.cfm">Main</a> / <a href="#cgi.script_name#">List</a> /
		<cfif url.ID neq 0>
			<a href="blogcomments.cfm?method=read&amp;ID=#blogcomments.getID()#">Read</a> /
			<a href="blogcomments.cfm?method=edit">New</a>
		</cfif>
		</p></cfoutput>

		<cf_blogcommentsEdit blogcomments = "#blogcomments#" message="#url.message#" /> 
	</cfcase>

	<cfcase value="edit_process">
		<cfset blogcomments = EntityNew("blogcomments") />
		<cfset blogcomments = blogcomments.populate(form) />
		<cfset EntitySave(blogcomments) />
		<cfset ORMFlush() />
		<cflocation url ="#cgi.script_name#?method=edit&ID=#blogcomments.getID()#&message=updated" />
	</cfcase>

	<cfcase value="delete_process">
		<cfset blogcomments = entityLoad("blogcomments", url.ID, true) />
		<cfset EntityDelete(blogcomments) />
		<cfset ORMFlush() />
		<cflocation url ="#cgi.script_name#?method=list&message=deleted" />
	</cfcase>

</cfswitch>
</cf_pageWrapper>