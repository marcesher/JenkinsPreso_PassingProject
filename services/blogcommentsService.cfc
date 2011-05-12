component {

	remote numeric function count() {
		return ormExecuteQuery("select Count(*) from blogcomments")[1];
	}

	remote CFO_JenkinsPreso_PassingProject.cfc.blogcomments[] function list(numeric offset ="0" , numeric maxresults ="0" ) {
		if(arguments.offset eq 0){
			structDelete(arguments, "offset");
		}
		if(arguments.maxresults eq 0){
			structDelete(arguments, "maxresults");
		}
		return entityLoad("blogcomments", {}, "ID asc", arguments);
	}

	remote CFO_JenkinsPreso_PassingProject.cfc.blogcomments function get(required numeric id ) {
		return EntityLoad("blogcomments", arguments.id, true);
	}

	remote void function update(required any blogcomments ) {
		arguments.blogcomments.nullifyZeroID();
		EntitySave(arguments.blogcomments);
	}

	remote void function destroy(required any blogcomments ) {
		EntityDelete(arguments.blogcomments);
	}

	remote CFO_JenkinsPreso_PassingProject.cfc.blogcomments[] function search(string q , numeric offset ="0" , numeric maxresults ="0" ) {

		var hqlString = "FROM blogcomments ";
		var whereClause = "";
		var params = Duplicate(arguments);

		if(params.offset eq 0){
			structDelete(params, "offset");
		}
		if(params.maxresults eq 0){
			structDelete(params, "maxresults");
		}
		structDelete(params, "q");

		if (len(arguments.q) gt 0){
			whereClause  = ListAppend(whereClause, " ID LIKE '%#arguments.q#%'", "|"); 	  
			whereClause  = ListAppend(whereClause, " ENTRYIDFK LIKE '%#arguments.q#%'", "|"); 	  
			whereClause  = ListAppend(whereClause, " NAME LIKE '%#arguments.q#%'", "|"); 	  
			whereClause  = ListAppend(whereClause, " EMAIL LIKE '%#arguments.q#%'", "|"); 	  
			whereClause = Replace(whereClause, "|", " OR ", "all");
		}
		if (len(whereClause) gt 0){
			hqlString = hqlString & " WHERE " & whereClause;
		}
		hqlString = hqlString & " ORDER BY ID asc";
		return ormExecuteQuery(hqlString, false, params);
	}

}