component {

	remote numeric function count() {
		return ormExecuteQuery("select Count(*) from authors")[1];
	}

	remote CFO_JenkinsPreso_PassingProject.cfc.authors[] function list(numeric offset ="0" , numeric maxresults ="0" ) {
		if(arguments.offset eq 0){
			structDelete(arguments, "offset");
		}
		if(arguments.maxresults eq 0){
			structDelete(arguments, "maxresults");
		}
		return entityLoad("authors", {}, "AUTHORID asc", arguments);
	}

	remote CFO_JenkinsPreso_PassingProject.cfc.authors function get(required numeric id ) {
		return EntityLoad("authors", arguments.id, true);
	}

	remote void function update(required any authors ) {
		arguments.authors.nullifyZeroID();
		EntitySave(arguments.authors);
	}

	remote void function destroy(required any authors ) {
		EntityDelete(arguments.authors);
	}

	remote CFO_JenkinsPreso_PassingProject.cfc.authors[] function search(string q , numeric offset ="0" , numeric maxresults ="0" ) {

		var hqlString = "FROM authors ";
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
			whereClause  = ListAppend(whereClause, " FIRSTNAME LIKE '%#arguments.q#%'", "|"); 	  
			whereClause  = ListAppend(whereClause, " LASTNAME LIKE '%#arguments.q#%'", "|"); 	  
			whereClause  = ListAppend(whereClause, " ISSPOTLIGHT LIKE '%#arguments.q#%'", "|"); 	  
			whereClause = Replace(whereClause, "|", " OR ", "all");
		}
		if (len(whereClause) gt 0){
			hqlString = hqlString & " WHERE " & whereClause;
		}
		hqlString = hqlString & " ORDER BY AUTHORID asc";
		return ormExecuteQuery(hqlString, false, params);
	}

}