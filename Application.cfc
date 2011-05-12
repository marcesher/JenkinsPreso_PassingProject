component {

	This.name = "cfbookclub";
	This.ormenabled = true;
	This.datasource = "cfbookclub";
	This.customTagPaths = GetDirectoryFromPath(GetCurrentTemplatePath()) & "customtags";;
	This.ormsettings.eventHandler = "CFO_JenkinsPreso_PassingProject.cfc.eventHandler";
	This.ormsettings.logSQL = true;

	application.BR = "<br>";

	public boolean function onRequestStart() {

		if (structKeyExists(url, "reset_app")){
			ApplicationStop();
			location(cgi.script_name, false);
		}

		return true;
	}

}