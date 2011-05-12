component {

	remote numeric function count() {
		return ormExecuteQuery("select Count(*) from books")[1];
	}

	remote CFO_JenkinsPreso_PassingProject.cfc.books[] function list(numeric offset ="0" , numeric maxresults ="0" ) {
		if(arguments.offset eq 0){
			structDelete(arguments, "offset");
		}
		if(arguments.maxresults eq 0){
			structDelete(arguments, "maxresults");
		}
		return entityLoad("books", {}, "BOOKID asc", arguments);
	}

	remote CFO_JenkinsPreso_PassingProject.cfc.books function get(required numeric id ) {
		return EntityLoad("books", arguments.id, true);
	}

	remote void function update(required any books ) {
		arguments.books.nullifyZeroID();
		EntitySave(arguments.books);
	}

	remote void function destroy(required any books ) {
		EntityDelete(arguments.books);
	}

	remote CFO_JenkinsPreso_PassingProject.cfc.books[] function search(string q , numeric offset ="0" , numeric maxresults ="0" ) {

		var hqlString = "FROM books ";
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
			whereClause  = ListAppend(whereClause, " TITLE LIKE '%#arguments.q#%'", "|"); 	  
			whereClause  = ListAppend(whereClause, " BOOKIMAGE LIKE '%#arguments.q#%'", "|"); 	  
			whereClause  = ListAppend(whereClause, " THUMBNAILIMAGE LIKE '%#arguments.q#%'", "|"); 	  
			whereClause  = ListAppend(whereClause, " ISSPOTLIGHT LIKE '%#arguments.q#%'", "|"); 	  
			whereClause  = ListAppend(whereClause, " GENRE LIKE '%#arguments.q#%'", "|"); 	  
			whereClause = Replace(whereClause, "|", " OR ", "all");
		}
		if (len(whereClause) gt 0){
			hqlString = hqlString & " WHERE " & whereClause;
		}
		hqlString = hqlString & " ORDER BY BOOKID asc";
		return ormExecuteQuery(hqlString, false, params);
	}

}