<cfsetting showdebugoutput="false" />
<cfparam name="url.method" type="string" default="list" />
<cfparam name="url.BOOKID" type="any" default="0" />
<cfparam name="url.message" type="string" default="" />
<cfparam name="url.offset" type="numeric" default="0" />
<cfparam name="url.maxresults" type="numeric" default="10" />
<cfimport path="CFO_JenkinsPreso_PassingProject.cfc.*" />
<cf_pageWrapper>

<h2>Books</h2>

<cfswitch expression="#url.method#" >

	<cfcase value="list">
		<cfset booksArray = entityLoad("books", {}, "BOOKID asc", {offset=url.offset, maxresults=url.maxresults} ) />
		<cfoutput><p class="breadcrumb">
			<a href="index.cfm">Main</a> / <a href="#cgi.script_name#">List</a> /
			<a href="books.cfm?method=edit">New</a>
		</p></cfoutput>
		<cf_booksList booksArray = "#booksArray#" message="#url.message#" offset="#url.offset#" maxresults="#url.maxresults#" /> 
	</cfcase>

	<cfcase value="read">
		<cfset books = entityLoad("books", url.BOOKID, true) />
		<cfoutput><p class="breadcrumb">
			<a href="index.cfm">Main</a> / <a href="#cgi.script_name#">List</a> /
			<a href="books.cfm?method=edit&amp;BOOKID=#books.getBOOKID()#">Edit</a> /
			<a href="books.cfm?method=edit">New</a>
		</p></cfoutput>
		<cf_booksRead books = "#books#" /> 
	</cfcase>

	<cfcase value="edit">
		<cfif url.BOOKID eq 0>
			<cfset books = New books() />
		<cfelse>
			<cfset books = entityLoad("books", url.BOOKID, true) />
		</cfif>
		<cfoutput><p class="breadcrumb">
			<a href="index.cfm">Main</a> / <a href="#cgi.script_name#">List</a> /
		<cfif url.BOOKID neq 0>
			<a href="books.cfm?method=read&amp;BOOKID=#books.getBOOKID()#">Read</a> /
			<a href="books.cfm?method=edit">New</a>
		</cfif>
		</p></cfoutput>

		<cf_booksEdit books = "#books#" message="#url.message#" /> 
	</cfcase>

	<cfcase value="edit_process">
		<cfset books = EntityNew("books") />
		<cfset books = books.populate(form) />
		<cfset EntitySave(books) />
		<cfset ORMFlush() />
		<cflocation url ="#cgi.script_name#?method=edit&BOOKID=#books.getBOOKID()#&message=updated" />
	</cfcase>

	<cfcase value="delete_process">
		<cfset books = entityLoad("books", url.BOOKID, true) />
		<cfset EntityDelete(books) />
		<cfset ORMFlush() />
		<cflocation url ="#cgi.script_name#?method=list&message=deleted" />
	</cfcase>

</cfswitch>
</cf_pageWrapper>