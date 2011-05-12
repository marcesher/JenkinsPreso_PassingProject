component {

	remote numeric function count() {
		return ormExecuteQuery("select Count(*) from memberdownload")[1];
	}

	remote CFO_JenkinsPreso_PassingProject.cfc.memberdownload[] function list(numeric offset ="0" , numeric maxresults ="0" ) {
		if(arguments.offset eq 0){
			structDelete(arguments, "offset");
		}
		if(arguments.maxresults eq 0){
			structDelete(arguments, "maxresults");
		}
		return entityLoad("memberdownload", {}, "MEMBERDOWNLOADID asc", arguments);
	}

	remote CFO_JenkinsPreso_PassingProject.cfc.memberdownload function get(required numeric id ) {
		return EntityLoad("memberdownload", arguments.id, true);
	}

	remote void function update(required any memberdownload ) {
		arguments.memberdownload.nullifyZeroID();
		EntitySave(arguments.memberdownload);
	}

	remote void function destroy(required any memberdownload ) {
		EntityDelete(arguments.memberdownload);
	}

	remote CFO_JenkinsPreso_PassingProject.cfc.memberdownload[] function search(string q , numeric offset ="0" , numeric maxresults ="0" ) {

		var hqlString = "FROM memberdownload ";
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
			whereClause  = ListAppend(whereClause, " COUPONCODE LIKE '%#arguments.q#%'", "|"); 	  
			whereClause = Replace(whereClause, "|", " OR ", "all");
		}
		if (len(whereClause) gt 0){
			hqlString = hqlString & " WHERE " & whereClause;
		}
		hqlString = hqlString & " ORDER BY MEMBERDOWNLOADID asc";
		return ormExecuteQuery(hqlString, false, params);
	}

}