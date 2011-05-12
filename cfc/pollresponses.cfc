component persistent="true" table="POLLRESPONSES" entityName="pollresponses" {

	property name="POLLID" column="POLLID" ormtype="integer" type="numeric" fieldtype="id" generator="native" length="10" ;
	property name="A1" column="A1" ormtype="integer" type="numeric" length="10" ;
	property name="A2" column="A2" ormtype="integer" type="numeric" length="10" ;
	property name="A3" column="A3" ormtype="integer" type="numeric" length="10" ;
	property name="A4" column="A4" ormtype="integer" type="numeric" length="10" ;
	property name="A5" column="A5" ormtype="integer" type="numeric" length="10" ;
	property name="TOTAL" column="TOTAL" ormtype="integer" type="numeric" length="10" ;

	public pollresponses function init() {
		return This;
	}

	public void function nullifyZeroID() {
		if (getIDValue() eq 0){
			variables[getIDName()] = JavaCast("Null", "");
		}
	}

	public pollresponses function populate(required struct formStruct ) {
		if (StructKeyExists(arguments.formstruct, "POLLID") AND arguments.formstruct.POLLID > 0){
			This = EntityLoad("pollresponses", arguments.formstruct.POLLID, true);
		}
		if (StructKeyExists(arguments.formstruct, "A1")){
			this.setA1(arguments.formstruct.A1);
		}
		if (StructKeyExists(arguments.formstruct, "A2")){
			this.setA2(arguments.formstruct.A2);
		}
		if (StructKeyExists(arguments.formstruct, "A3")){
			this.setA3(arguments.formstruct.A3);
		}
		if (StructKeyExists(arguments.formstruct, "A4")){
			this.setA4(arguments.formstruct.A4);
		}
		if (StructKeyExists(arguments.formstruct, "A5")){
			this.setA5(arguments.formstruct.A5);
		}
		if (StructKeyExists(arguments.formstruct, "TOTAL")){
			this.setTOTAL(arguments.formstruct.TOTAL);
		}
		return This;
	}

}