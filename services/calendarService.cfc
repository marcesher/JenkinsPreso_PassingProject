component {

	remote numeric function count() {
		return ormExecuteQuery("select Count(*) from calendar")[1];
	}

	remote CFO_JenkinsPreso_PassingProject.cfc.calendar[] function list(numeric offset ="0" , numeric maxresults ="0" ) {
		if(arguments.offset eq 0){
			structDelete(arguments, "offset");
		}
		if(arguments.maxresults eq 0){
			structDelete(arguments, "maxresults");
		}
		return entityLoad("calendar", {}, "CALENDARID asc", arguments);
	}

	remote CFO_JenkinsPreso_PassingProject.cfc.calendar function get(required numeric id ) {
		return EntityLoad("calendar", arguments.id, true);
	}

	remote void function update(required any calendar ) {
		arguments.calendar.nullifyZeroID();
		EntitySave(arguments.calendar);
	}

	remote void function destroy(required any calendar ) {
		EntityDelete(arguments.calendar);
	}

	remote CFO_JenkinsPreso_PassingProject.cfc.calendar[] function search(string q , numeric offset ="0" , numeric maxresults ="0" ) {

		var hqlString = "FROM calendar ";
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
			whereClause  = ListAppend(whereClause, " ISAUTHORAVAILABLE LIKE '%#arguments.q#%'", "|"); 	  
			whereClause = Replace(whereClause, "|", " OR ", "all");
		}
		if (len(whereClause) gt 0){
			hqlString = hqlString & " WHERE " & whereClause;
		}
		hqlString = hqlString & " ORDER BY CALENDARID asc";
		return ormExecuteQuery(hqlString, false, params);
	}

}