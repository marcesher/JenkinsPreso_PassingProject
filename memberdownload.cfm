<cfsetting showdebugoutput="false" />
<cfparam name="url.method" type="string" default="list" />
<cfparam name="url.MEMBERDOWNLOADID" type="any" default="0" />
<cfparam name="url.message" type="string" default="" />
<cfparam name="url.offset" type="numeric" default="0" />
<cfparam name="url.maxresults" type="numeric" default="10" />
<cfimport path="CFO_JenkinsPreso_PassingProject.cfc.*" />
<cf_pageWrapper>

<h2>Memberdownload</h2>

<cfswitch expression="#url.method#" >

	<cfcase value="list">
		<cfset memberdownloadArray = entityLoad("memberdownload", {}, "MEMBERDOWNLOADID asc", {offset=url.offset, maxresults=url.maxresults} ) />
		<cfoutput><p class="breadcrumb">
			<a href="index.cfm">Main</a> / <a href="#cgi.script_name#">List</a> /
			<a href="memberdownload.cfm?method=edit">New</a>
		</p></cfoutput>
		<cf_memberdownloadList memberdownloadArray = "#memberdownloadArray#" message="#url.message#" offset="#url.offset#" maxresults="#url.maxresults#" /> 
	</cfcase>

	<cfcase value="read">
		<cfset memberdownload = entityLoad("memberdownload", url.MEMBERDOWNLOADID, true) />
		<cfoutput><p class="breadcrumb">
			<a href="index.cfm">Main</a> / <a href="#cgi.script_name#">List</a> /
			<a href="memberdownload.cfm?method=edit&amp;MEMBERDOWNLOADID=#memberdownload.getMEMBERDOWNLOADID()#">Edit</a> /
			<a href="memberdownload.cfm?method=edit">New</a>
		</p></cfoutput>
		<cf_memberdownloadRead memberdownload = "#memberdownload#" /> 
	</cfcase>

	<cfcase value="edit">
		<cfif url.MEMBERDOWNLOADID eq 0>
			<cfset memberdownload = New memberdownload() />
		<cfelse>
			<cfset memberdownload = entityLoad("memberdownload", url.MEMBERDOWNLOADID, true) />
		</cfif>
		<cfoutput><p class="breadcrumb">
			<a href="index.cfm">Main</a> / <a href="#cgi.script_name#">List</a> /
		<cfif url.MEMBERDOWNLOADID neq 0>
			<a href="memberdownload.cfm?method=read&amp;MEMBERDOWNLOADID=#memberdownload.getMEMBERDOWNLOADID()#">Read</a> /
			<a href="memberdownload.cfm?method=edit">New</a>
		</cfif>
		</p></cfoutput>

		<cf_memberdownloadEdit memberdownload = "#memberdownload#" message="#url.message#" /> 
	</cfcase>

	<cfcase value="edit_process">
		<cfset memberdownload = EntityNew("memberdownload") />
		<cfset memberdownload = memberdownload.populate(form) />
		<cfset EntitySave(memberdownload) />
		<cfset ORMFlush() />
		<cflocation url ="#cgi.script_name#?method=edit&MEMBERDOWNLOADID=#memberdownload.getMEMBERDOWNLOADID()#&message=updated" />
	</cfcase>

	<cfcase value="delete_process">
		<cfset memberdownload = entityLoad("memberdownload", url.MEMBERDOWNLOADID, true) />
		<cfset EntityDelete(memberdownload) />
		<cfset ORMFlush() />
		<cflocation url ="#cgi.script_name#?method=list&message=deleted" />
	</cfcase>

</cfswitch>
</cf_pageWrapper>