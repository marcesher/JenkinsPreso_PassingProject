component persistent="true" table="MEETINGS" entityName="meetings" {

	property name="MEETINGID" column="MEETINGID" ormtype="integer" type="numeric" fieldtype="id" generator="native" length="10" ;
	property name="BOOKID" column="BOOKID" ormtype="integer" type="numeric" length="10" ;
	property name="HOST" column="HOST" ormtype="string" type="string" length="50" ;
	property name="MEETINGINFO" column="MEETINGINFO" ormtype="string" type="string" length="2147483647" ;

	public meetings function init() {
		return This;
	}

	public void function nullifyZeroID() {
		if (getIDValue() eq 0){
			variables[getIDName()] = JavaCast("Null", "");
		}
	}

	public meetings function populate(required struct formStruct ) {
		if (StructKeyExists(arguments.formstruct, "MEETINGID") AND arguments.formstruct.MEETINGID > 0){
			This = EntityLoad("meetings", arguments.formstruct.MEETINGID, true);
		}
		if (StructKeyExists(arguments.formstruct, "BOOKID")){
			this.setBOOKID(arguments.formstruct.BOOKID);
		}
		if (StructKeyExists(arguments.formstruct, "HOST")){
			this.setHOST(arguments.formstruct.HOST);
		}
		if (StructKeyExists(arguments.formstruct, "MEETINGINFO")){
			this.setMEETINGINFO(arguments.formstruct.MEETINGINFO);
		}
		return This;
	}

}