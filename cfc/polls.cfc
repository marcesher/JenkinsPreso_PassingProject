component persistent="true" table="POLLS" entityName="polls" {

	property name="POLLID" column="POLLID" ormtype="integer" type="numeric" fieldtype="id" generator="native" length="10" ;
	property name="QUESTION" column="QUESTION" ormtype="string" type="string" length="2147483647" ;
	property name="ANSWER1" column="ANSWER1" ormtype="string" type="string" length="2147483647" ;
	property name="ANSWER2" column="ANSWER2" ormtype="string" type="string" length="2147483647" ;
	property name="ANSWER3" column="ANSWER3" ormtype="string" type="string" length="2147483647" ;
	property name="ANSWER4" column="ANSWER4" ormtype="string" type="string" length="2147483647" ;
	property name="ANSWER5" column="ANSWER5" ormtype="string" type="string" length="2147483647" ;
	property name="ISLIVE" column="ISLIVE" ormtype="string" type="string" length="1" ;

	public polls function init() {
		return This;
	}

	public void function nullifyZeroID() {
		if (getIDValue() eq 0){
			variables[getIDName()] = JavaCast("Null", "");
		}
	}

	public polls function populate(required struct formStruct ) {
		if (StructKeyExists(arguments.formstruct, "POLLID") AND arguments.formstruct.POLLID > 0){
			This = EntityLoad("polls", arguments.formstruct.POLLID, true);
		}
		if (StructKeyExists(arguments.formstruct, "QUESTION")){
			this.setQUESTION(arguments.formstruct.QUESTION);
		}
		if (StructKeyExists(arguments.formstruct, "ANSWER1")){
			this.setANSWER1(arguments.formstruct.ANSWER1);
		}
		if (StructKeyExists(arguments.formstruct, "ANSWER2")){
			this.setANSWER2(arguments.formstruct.ANSWER2);
		}
		if (StructKeyExists(arguments.formstruct, "ANSWER3")){
			this.setANSWER3(arguments.formstruct.ANSWER3);
		}
		if (StructKeyExists(arguments.formstruct, "ANSWER4")){
			this.setANSWER4(arguments.formstruct.ANSWER4);
		}
		if (StructKeyExists(arguments.formstruct, "ANSWER5")){
			this.setANSWER5(arguments.formstruct.ANSWER5);
		}
		if (StructKeyExists(arguments.formstruct, "ISLIVE")){
			this.setISLIVE(arguments.formstruct.ISLIVE);
		}
		return This;
	}

}