component {

	remote numeric function count() {
		return ormExecuteQuery("select Count(*) from meetings")[1];
	}

	remote CFO_JenkinsPreso_PassingProject.cfc.meetings[] function list(numeric offset ="0" , numeric maxresults ="0" ) {
		if(arguments.offset eq 0){
			structDelete(arguments, "offset");
		}
		if(arguments.maxresults eq 0){
			structDelete(arguments, "maxresults");
		}
		return entityLoad("meetings", {}, "MEETINGID asc", arguments);
	}

	remote CFO_JenkinsPreso_PassingProject.cfc.meetings function get(required numeric id ) {
		return EntityLoad("meetings", arguments.id, true);
	}

	remote void function update(required any meetings ) {
		arguments.meetings.nullifyZeroID();
		EntitySave(arguments.meetings);
	}

	remote void function destroy(required any meetings ) {
		EntityDelete(arguments.meetings);
	}

	remote CFO_JenkinsPreso_PassingProject.cfc.meetings[] function search(string q , numeric offset ="0" , numeric maxresults ="0" ) {

		var hqlString = "FROM meetings ";
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
			whereClause  = ListAppend(whereClause, " HOST LIKE '%#arguments.q#%'", "|"); 	  
			whereClause = Replace(whereClause, "|", " OR ", "all");
		}
		if (len(whereClause) gt 0){
			hqlString = hqlString & " WHERE " & whereClause;
		}
		hqlString = hqlString & " ORDER BY MEETINGID asc";
		return ormExecuteQuery(hqlString, false, params);
	}

}