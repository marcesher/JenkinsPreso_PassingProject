<cfsetting showdebugoutput="false" />
<cfparam name="url.method" type="string" default="list" />
<cfparam name="url.CATEGORYID" type="any" default="0" />
<cfparam name="url.message" type="string" default="" />
<cfparam name="url.offset" type="numeric" default="0" />
<cfparam name="url.maxresults" type="numeric" default="10" />
<cfimport path="CFO_JenkinsPreso_PassingProject.cfc.*" />
<cf_pageWrapper>

<h2>Blogcategories</h2>

<cfswitch expression="#url.method#" >

	<cfcase value="list">
		<cfset blogcategoriesArray = entityLoad("blogcategories", {}, "CATEGORYID asc", {offset=url.offset, maxresults=url.maxresults} ) />
		<cfoutput><p class="breadcrumb">
			<a href="index.cfm">Main</a> / <a href="#cgi.script_name#">List</a> /
			<a href="blogcategories.cfm?method=edit">New</a>
		</p></cfoutput>
		<cf_blogcategoriesList blogcategoriesArray = "#blogcategoriesArray#" message="#url.message#" offset="#url.offset#" maxresults="#url.maxresults#" /> 
	</cfcase>

	<cfcase value="read">
		<cfset blogcategories = entityLoad("blogcategories", url.CATEGORYID, true) />
		<cfoutput><p class="breadcrumb">
			<a href="index.cfm">Main</a> / <a href="#cgi.script_name#">List</a> /
			<a href="blogcategories.cfm?method=edit&amp;CATEGORYID=#blogcategories.getCATEGORYID()#">Edit</a> /
			<a href="blogcategories.cfm?method=edit">New</a>
		</p></cfoutput>
		<cf_blogcategoriesRead blogcategories = "#blogcategories#" /> 
	</cfcase>

	<cfcase value="edit">
		<cfif url.CATEGORYID eq 0>
			<cfset blogcategories = New blogcategories() />
		<cfelse>
			<cfset blogcategories = entityLoad("blogcategories", url.CATEGORYID, true) />
		</cfif>
		<cfoutput><p class="breadcrumb">
			<a href="index.cfm">Main</a> / <a href="#cgi.script_name#">List</a> /
		<cfif url.CATEGORYID neq 0>
			<a href="blogcategories.cfm?method=read&amp;CATEGORYID=#blogcategories.getCATEGORYID()#">Read</a> /
			<a href="blogcategories.cfm?method=edit">New</a>
		</cfif>
		</p></cfoutput>

		<cf_blogcategoriesEdit blogcategories = "#blogcategories#" message="#url.message#" /> 
	</cfcase>

	<cfcase value="edit_process">
		<cfset blogcategories = EntityNew("blogcategories") />
		<cfset blogcategories = blogcategories.populate(form) />
		<cfset EntitySave(blogcategories) />
		<cfset ORMFlush() />
		<cflocation url ="#cgi.script_name#?method=edit&CATEGORYID=#blogcategories.getCATEGORYID()#&message=updated" />
	</cfcase>

	<cfcase value="delete_process">
		<cfset blogcategories = entityLoad("blogcategories", url.CATEGORYID, true) />
		<cfset EntityDelete(blogcategories) />
		<cfset ORMFlush() />
		<cflocation url ="#cgi.script_name#?method=list&message=deleted" />
	</cfcase>

</cfswitch>
</cf_pageWrapper>