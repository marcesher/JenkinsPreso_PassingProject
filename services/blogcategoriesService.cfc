component {

	remote numeric function count() {
		return ormExecuteQuery("select Count(*) from blogcategories")[1];
	}

	remote CFO_JenkinsPreso_PassingProject.cfc.blogcategories[] function list(numeric offset ="0" , numeric maxresults ="0" ) {
		if(arguments.offset eq 0){
			structDelete(arguments, "offset");
		}
		if(arguments.maxresults eq 0){
			structDelete(arguments, "maxresults");
		}
		return entityLoad("blogcategories", {}, "CATEGORYID asc", arguments);
	}

	remote CFO_JenkinsPreso_PassingProject.cfc.blogcategories function get(required numeric id ) {
		return EntityLoad("blogcategories", arguments.id, true);
	}

	remote void function update(required any blogcategories ) {
		arguments.blogcategories.nullifyZeroID();
		EntitySave(arguments.blogcategories);
	}

	remote void function destroy(required any blogcategories ) {
		EntityDelete(arguments.blogcategories);
	}

	remote CFO_JenkinsPreso_PassingProject.cfc.blogcategories[] function search(string q , numeric offset ="0" , numeric maxresults ="0" ) {

		var hqlString = "FROM blogcategories ";
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
			whereClause  = ListAppend(whereClause, " CATEGORYID LIKE '%#arguments.q#%'", "|"); 	  
			whereClause  = ListAppend(whereClause, " CATEGORYNAME LIKE '%#arguments.q#%'", "|"); 	  
			whereClause  = ListAppend(whereClause, " BLOG LIKE '%#arguments.q#%'", "|"); 	  
			whereClause = Replace(whereClause, "|", " OR ", "all");
		}
		if (len(whereClause) gt 0){
			hqlString = hqlString & " WHERE " & whereClause;
		}
		hqlString = hqlString & " ORDER BY CATEGORYID asc";
		return ormExecuteQuery(hqlString, false, params);
	}

}