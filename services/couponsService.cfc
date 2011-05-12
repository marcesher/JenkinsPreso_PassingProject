component {

	remote numeric function count() {
		return ormExecuteQuery("select Count(*) from coupons")[1];
	}

	remote CFO_JenkinsPreso_PassingProject.cfc.coupons[] function list(numeric offset ="0" , numeric maxresults ="0" ) {
		if(arguments.offset eq 0){
			structDelete(arguments, "offset");
		}
		if(arguments.maxresults eq 0){
			structDelete(arguments, "maxresults");
		}
		return entityLoad("coupons", {}, "COUPONID asc", arguments);
	}

	remote CFO_JenkinsPreso_PassingProject.cfc.coupons function get(required numeric id ) {
		return EntityLoad("coupons", arguments.id, true);
	}

	remote void function update(required any coupons ) {
		arguments.coupons.nullifyZeroID();
		EntitySave(arguments.coupons);
	}

	remote void function destroy(required any coupons ) {
		EntityDelete(arguments.coupons);
	}

	remote CFO_JenkinsPreso_PassingProject.cfc.coupons[] function search(string q , numeric offset ="0" , numeric maxresults ="0" ) {

		var hqlString = "FROM coupons ";
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
		hqlString = hqlString & " ORDER BY COUPONID asc";
		return ormExecuteQuery(hqlString, false, params);
	}

}