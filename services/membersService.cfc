component {

	remote numeric function count() {
		return ormExecuteQuery("select Count(*) from members")[1];
	}

	remote CFO_JenkinsPreso_PassingProject.cfc.members[] function list(numeric offset ="0" , numeric maxresults ="0" ) {
		if(arguments.offset eq 0){
			structDelete(arguments, "offset");
		}
		if(arguments.maxresults eq 0){
			structDelete(arguments, "maxresults");
		}
		return entityLoad("members", {}, "MEMBERID asc", arguments);
	}

	remote CFO_JenkinsPreso_PassingProject.cfc.members function get(required numeric id ) {
		return EntityLoad("members", arguments.id, true);
	}

	remote void function update(required any members ) {
		arguments.members.nullifyZeroID();
		EntitySave(arguments.members);
	}

	remote void function destroy(required any members ) {
		EntityDelete(arguments.members);
	}

	remote CFO_JenkinsPreso_PassingProject.cfc.members[] function search(string q , numeric offset ="0" , numeric maxresults ="0" ) {

		var hqlString = "FROM members ";
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
			whereClause  = ListAppend(whereClause, " EMAIL LIKE '%#arguments.q#%'", "|"); 	  
			whereClause  = ListAppend(whereClause, " MEMBERPASSWORD LIKE '%#arguments.q#%'", "|"); 	  
			whereClause  = ListAppend(whereClause, " ISADMIN LIKE '%#arguments.q#%'", "|"); 	  
			whereClause  = ListAppend(whereClause, " ISACTIVE LIKE '%#arguments.q#%'", "|"); 	  
			whereClause  = ListAppend(whereClause, " ISBLOGSPOTLIGHT LIKE '%#arguments.q#%'", "|"); 	  
			whereClause = Replace(whereClause, "|", " OR ", "all");
		}
		if (len(whereClause) gt 0){
			hqlString = hqlString & " WHERE " & whereClause;
		}
		hqlString = hqlString & " ORDER BY MEMBERID asc";
		return ormExecuteQuery(hqlString, false, params);
	}

}