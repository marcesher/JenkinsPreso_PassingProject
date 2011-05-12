component {

	remote numeric function count() {
		return ormExecuteQuery("select Count(*) from pollresponses")[1];
	}

	remote CFO_JenkinsPreso_PassingProject.cfc.pollresponses[] function list(numeric offset ="0" , numeric maxresults ="0" ) {
		if(arguments.offset eq 0){
			structDelete(arguments, "offset");
		}
		if(arguments.maxresults eq 0){
			structDelete(arguments, "maxresults");
		}
		return entityLoad("pollresponses", {}, "POLLID asc", arguments);
	}

	remote CFO_JenkinsPreso_PassingProject.cfc.pollresponses function get(required numeric id ) {
		return EntityLoad("pollresponses", arguments.id, true);
	}

	remote void function update(required any pollresponses ) {
		arguments.pollresponses.nullifyZeroID();
		EntitySave(arguments.pollresponses);
	}

	remote void function destroy(required any pollresponses ) {
		EntityDelete(arguments.pollresponses);
	}

	remote CFO_JenkinsPreso_PassingProject.cfc.pollresponses[] function search(string q , numeric offset ="0" , numeric maxresults ="0" ) {

		var hqlString = "FROM pollresponses ";
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
			whereClause = Replace(whereClause, "|", " OR ", "all");
		}
		if (len(whereClause) gt 0){
			hqlString = hqlString & " WHERE " & whereClause;
		}
		hqlString = hqlString & " ORDER BY POLLID asc";
		return ormExecuteQuery(hqlString, false, params);
	}

}