<cfsetting showdebugoutput="false" />
<cfparam name="url.method" type="string" default="list" />
<cfparam name="url.AUTHORID" type="any" default="0" />
<cfparam name="url.message" type="string" default="" />
<cfparam name="url.offset" type="numeric" default="0" />
<cfparam name="url.maxresults" type="numeric" default="10" />
<cfimport path="CFO_JenkinsPreso_PassingProject.cfc.*" />
<cf_pageWrapper>

<h2>Authors</h2>

<cfswitch expression="#url.method#" >

	<cfcase value="list">
		<cfset authorsArray = entityLoad("authors", {}, "AUTHORID asc", {offset=url.offset, maxresults=url.maxresults} ) />
		<cfoutput><p class="breadcrumb">
			<a href="index.cfm">Main</a> / <a href="#cgi.script_name#">List</a> /
			<a href="authors.cfm?method=edit">New</a>
		</p></cfoutput>
		<cf_authorsList authorsArray = "#authorsArray#" message="#url.message#" offset="#url.offset#" maxresults="#url.maxresults#" /> 
	</cfcase>

	<cfcase value="read">
		<cfset authors = entityLoad("authors", url.AUTHORID, true) />
		<cfoutput><p class="breadcrumb">
			<a href="index.cfm">Main</a> / <a href="#cgi.script_name#">List</a> /
			<a href="authors.cfm?method=edit&amp;AUTHORID=#authors.getAUTHORID()#">Edit</a> /
			<a href="authors.cfm?method=edit">New</a>
		</p></cfoutput>
		<cf_authorsRead authors = "#authors#" /> 
	</cfcase>

	<cfcase value="edit">
		<cfif url.AUTHORID eq 0>
			<cfset authors = New authors() />
		<cfelse>
			<cfset authors = entityLoad("authors", url.AUTHORID, true) />
		</cfif>
		<cfoutput><p class="breadcrumb">
			<a href="index.cfm">Main</a> / <a href="#cgi.script_name#">List</a> /
		<cfif url.AUTHORID neq 0>
			<a href="authors.cfm?method=read&amp;AUTHORID=#authors.getAUTHORID()#">Read</a> /
			<a href="authors.cfm?method=edit">New</a>
		</cfif>
		</p></cfoutput>

		<cf_authorsEdit authors = "#authors#" message="#url.message#" /> 
	</cfcase>

	<cfcase value="edit_process">
		<cfset authors = EntityNew("authors") />
		<cfset authors = authors.populate(form) />
		<cfset EntitySave(authors) />
		<cfset ORMFlush() />
		<cflocation url ="#cgi.script_name#?method=edit&AUTHORID=#authors.getAUTHORID()#&message=updated" />
	</cfcase>

	<cfcase value="delete_process">
		<cfset authors = entityLoad("authors", url.AUTHORID, true) />
		<cfset EntityDelete(authors) />
		<cfset ORMFlush() />
		<cflocation url ="#cgi.script_name#?method=list&message=deleted" />
	</cfcase>

</cfswitch>
</cf_pageWrapper>