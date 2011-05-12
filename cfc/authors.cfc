component persistent="true" table="AUTHORS" entityName="authors" {

	property name="AUTHORID" column="AUTHORID" ormtype="integer" type="numeric" fieldtype="id" generator="native" length="10" ;
	property name="FIRSTNAME" column="FIRSTNAME" ormtype="string" type="string" length="50" ;
	property name="LASTNAME" column="LASTNAME" ormtype="string" type="string" length="50" ;
	property name="BIO" column="BIO" ormtype="string" type="string" length="2147483647" ;
	property name="ISSPOTLIGHT" column="ISSPOTLIGHT" ormtype="string" type="string" length="1" ;

	public authors function init() {
		return This;
	}

	public void function nullifyZeroID() {
		if (getIDValue() eq 0){
			variables[getIDName()] = JavaCast("Null", "");
		}
	}

	public authors function populate(required struct formStruct ) {
		if (StructKeyExists(arguments.formstruct, "AUTHORID") AND arguments.formstruct.AUTHORID > 0){
			This = EntityLoad("authors", arguments.formstruct.AUTHORID, true);
		}
		if (StructKeyExists(arguments.formstruct, "FIRSTNAME")){
			this.setFIRSTNAME(arguments.formstruct.FIRSTNAME);
		}
		if (StructKeyExists(arguments.formstruct, "LASTNAME")){
			this.setLASTNAME(arguments.formstruct.LASTNAME);
		}
		if (StructKeyExists(arguments.formstruct, "BIO")){
			this.setBIO(arguments.formstruct.BIO);
		}
		if (StructKeyExists(arguments.formstruct, "ISSPOTLIGHT")){
			this.setISSPOTLIGHT(arguments.formstruct.ISSPOTLIGHT);
		}
		return This;
	}

}