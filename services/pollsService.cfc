component {

	remote numeric function count() {
		return ormExecuteQuery("select Count(*) from polls")[1];
	}

	remote CFO_JenkinsPreso_PassingProject.cfc.polls[] function list(numeric offset ="0" , numeric maxresults ="0" ) {
		if(arguments.offset eq 0){
			structDelete(arguments, "offset");
		}
		if(arguments.maxresults eq 0){
			structDelete(arguments, "maxresults");
		}
		return entityLoad("polls", {}, "POLLID asc", arguments);
	}

	remote CFO_JenkinsPreso_PassingProject.cfc.polls function get(required numeric id ) {
		return EntityLoad("polls", arguments.id, true);
	}

	remote void function update(required any polls ) {
		arguments.polls.nullifyZeroID();
		EntitySave(arguments.polls);
	}

	remote void function destroy(required any polls ) {
		EntityDelete(arguments.polls);
	}

	remote CFO_JenkinsPreso_PassingProject.cfc.polls[] function search(string q , numeric offset ="0" , numeric maxresults ="0" ) {

		var hqlString = "FROM polls ";
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
			whereClause  = ListAppend(whereClause, " ISLIVE LIKE '%#arguments.q#%'", "|"); 	  
			whereClause = Replace(whereClause, "|", " OR ", "all");
		}
		if (len(whereClause) gt 0){
			hqlString = hqlString & " WHERE " & whereClause;
		}
		hqlString = hqlString & " ORDER BY POLLID asc";
		return ormExecuteQuery(hqlString, false, params);
	}

}