component {

	remote numeric function count() {
		return ormExecuteQuery("select Count(*) from blogentries")[1];
	}

	remote CFO_JenkinsPreso_PassingProject.cfc.blogentries[] function list(numeric offset ="0" , numeric maxresults ="0" ) {
		if(arguments.offset eq 0){
			structDelete(arguments, "offset");
		}
		if(arguments.maxresults eq 0){
			structDelete(arguments, "maxresults");
		}
		return entityLoad("blogentries", {}, "ID asc", arguments);
	}

	remote CFO_JenkinsPreso_PassingProject.cfc.blogentries function get(required numeric id ) {
		return EntityLoad("blogentries", arguments.id, true);
	}

	remote void function update(required any blogentries ) {
		arguments.blogentries.nullifyZeroID();
		EntitySave(arguments.blogentries);
	}

	remote void function destroy(required any blogentries ) {
		EntityDelete(arguments.blogentries);
	}

	remote CFO_JenkinsPreso_PassingProject.cfc.blogentries[] function search(string q , numeric offset ="0" , numeric maxresults ="0" ) {

		var hqlString = "FROM blogentries ";
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
			whereClause  = ListAppend(whereClause, " TITLE LIKE '%#arguments.q#%'", "|"); 	  
			whereClause  = ListAppend(whereClause, " BLOG LIKE '%#arguments.q#%'", "|"); 	  
			whereClause  = ListAppend(whereClause, " ALIAS LIKE '%#arguments.q#%'", "|"); 	  
			whereClause  = ListAppend(whereClause, " USERNAME LIKE '%#arguments.q#%'", "|"); 	  
			whereClause = Replace(whereClause, "|", " OR ", "all");
		}
		if (len(whereClause) gt 0){
			hqlString = hqlString & " WHERE " & whereClause;
		}
		hqlString = hqlString & " ORDER BY ID asc";
		return ormExecuteQuery(hqlString, false, params);
	}

}