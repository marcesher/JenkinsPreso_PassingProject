component persistent="true" table="MEMBERS" entityName="members" {

	property name="MEMBERID" column="MEMBERID" ormtype="integer" type="numeric" fieldtype="id" generator="native" length="10" ;
	property name="FIRSTNAME" column="FIRSTNAME" ormtype="string" type="string" length="50" ;
	property name="LASTNAME" column="LASTNAME" ormtype="string" type="string" length="50" ;
	property name="EMAIL" column="EMAIL" ormtype="string" type="string" length="50" ;
	property name="MEMBERPASSWORD" column="MEMBERPASSWORD" ormtype="string" type="string" length="8" ;
	property name="ISADMIN" column="ISADMIN" ormtype="string" type="string" length="1" ;
	property name="ISACTIVE" column="ISACTIVE" ormtype="string" type="string" length="1" ;
	property name="ISBLOGSPOTLIGHT" column="ISBLOGSPOTLIGHT" ormtype="string" type="string" length="1" ;

	public members function init() {
		return This;
	}

	public void function nullifyZeroID() {
		if (getIDValue() eq 0){
			variables[getIDName()] = JavaCast("Null", "");
		}
	}

	public members function populate(required struct formStruct ) {
		if (StructKeyExists(arguments.formstruct, "MEMBERID") AND arguments.formstruct.MEMBERID > 0){
			This = EntityLoad("members", arguments.formstruct.MEMBERID, true);
		}
		if (StructKeyExists(arguments.formstruct, "FIRSTNAME")){
			this.setFIRSTNAME(arguments.formstruct.FIRSTNAME);
		}
		if (StructKeyExists(arguments.formstruct, "LASTNAME")){
			this.setLASTNAME(arguments.formstruct.LASTNAME);
		}
		if (StructKeyExists(arguments.formstruct, "EMAIL")){
			this.setEMAIL(arguments.formstruct.EMAIL);
		}
		if (StructKeyExists(arguments.formstruct, "MEMBERPASSWORD")){
			this.setMEMBERPASSWORD(arguments.formstruct.MEMBERPASSWORD);
		}
		if (StructKeyExists(arguments.formstruct, "ISADMIN")){
			this.setISADMIN(arguments.formstruct.ISADMIN);
		}
		if (StructKeyExists(arguments.formstruct, "ISACTIVE")){
			this.setISACTIVE(arguments.formstruct.ISACTIVE);
		}
		if (StructKeyExists(arguments.formstruct, "ISBLOGSPOTLIGHT")){
			this.setISBLOGSPOTLIGHT(arguments.formstruct.ISBLOGSPOTLIGHT);
		}
		return This;
	}

}