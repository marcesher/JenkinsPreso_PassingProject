component persistent="true" table="CALENDAR" entityName="calendar" {

	property name="CALENDARID" column="CALENDARID" ormtype="integer" type="numeric" fieldtype="id" generator="native" length="10" ;
	property name="MEETINGID" column="MEETINGID" ormtype="integer" type="numeric" length="10" ;
	property name="CALENDARDATE" column="CALENDARDATE" ormtype="timestamp" type="date" length="26" ;
	property name="STARTTIME" column="STARTTIME" ormtype="time" type="date" length="8" ;
	property name="ADDITIONALINFO" column="ADDITIONALINFO" ormtype="string" type="string" length="2147483647" ;
	property name="ISAUTHORAVAILABLE" column="ISAUTHORAVAILABLE" ormtype="string" type="string" length="1" ;

	public calendar function init() {
		return This;
	}

	public void function nullifyZeroID() {
		if (getIDValue() eq 0){
			variables[getIDName()] = JavaCast("Null", "");
		}
	}

	public calendar function populate(required struct formStruct ) {
		if (StructKeyExists(arguments.formstruct, "CALENDARID") AND arguments.formstruct.CALENDARID > 0){
			This = EntityLoad("calendar", arguments.formstruct.CALENDARID, true);
		}
		if (StructKeyExists(arguments.formstruct, "MEETINGID")){
			this.setMEETINGID(arguments.formstruct.MEETINGID);
		}
		if (StructKeyExists(arguments.formstruct, "CALENDARDATE")){
			this.setCALENDARDATE(arguments.formstruct.CALENDARDATE);
		}
		if (StructKeyExists(arguments.formstruct, "STARTTIME")){
			this.setSTARTTIME(arguments.formstruct.STARTTIME);
		}
		if (StructKeyExists(arguments.formstruct, "ADDITIONALINFO")){
			this.setADDITIONALINFO(arguments.formstruct.ADDITIONALINFO);
		}
		if (StructKeyExists(arguments.formstruct, "ISAUTHORAVAILABLE")){
			this.setISAUTHORAVAILABLE(arguments.formstruct.ISAUTHORAVAILABLE);
		}
		return This;
	}

}