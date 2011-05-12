component {

	remote numeric function count() {
		return ormExecuteQuery("select Count(*) from sponsors")[1];
	}

	remote CFO_JenkinsPreso_PassingProject.cfc.sponsors[] function list(numeric offset ="0" , numeric maxresults ="0" ) {
		if(arguments.offset eq 0){
			structDelete(arguments, "offset");
		}
		if(arguments.maxresults eq 0){
			structDelete(arguments, "maxresults");
		}
		return entityLoad("sponsors", {}, "SPONSORID asc", arguments);
	}

	remote CFO_JenkinsPreso_PassingProject.cfc.sponsors function get(required numeric id ) {
		return EntityLoad("sponsors", arguments.id, true);
	}

	remote void function update(required any sponsors ) {
		arguments.sponsors.nullifyZeroID();
		EntitySave(arguments.sponsors);
	}

	remote void function destroy(required any sponsors ) {
		EntityDelete(arguments.sponsors);
	}

	remote CFO_JenkinsPreso_PassingProject.cfc.sponsors[] function search(string q , numeric offset ="0" , numeric maxresults ="0" ) {

		var hqlString = "FROM sponsors ";
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
			whereClause  = ListAppend(whereClause, " SPONSORNAME LIKE '%#arguments.q#%'", "|"); 	  
			whereClause  = ListAppend(whereClause, " WEBADDRESS LIKE '%#arguments.q#%'", "|"); 	  
			whereClause  = ListAppend(whereClause, " SPONSORAD LIKE '%#arguments.q#%'", "|"); 	  
			whereClause  = ListAppend(whereClause, " ISSPOTLIGHT LIKE '%#arguments.q#%'", "|"); 	  
			whereClause  = ListAppend(whereClause, " CITY LIKE '%#arguments.q#%'", "|"); 	  
			whereClause  = ListAppend(whereClause, " STATE LIKE '%#arguments.q#%'", "|"); 	  
			whereClause  = ListAppend(whereClause, " ADDRESS LIKE '%#arguments.q#%'", "|"); 	  
			whereClause  = ListAppend(whereClause, " POSTALCODE LIKE '%#arguments.q#%'", "|"); 	  
			whereClause  = ListAppend(whereClause, " PHONE LIKE '%#arguments.q#%'", "|"); 	  
			whereClause  = ListAppend(whereClause, " MAP LIKE '%#arguments.q#%'", "|"); 	  
			whereClause = Replace(whereClause, "|", " OR ", "all");
		}
		if (len(whereClause) gt 0){
			hqlString = hqlString & " WHERE " & whereClause;
		}
		hqlString = hqlString & " ORDER BY SPONSORID asc";
		return ormExecuteQuery(hqlString, false, params);
	}

}