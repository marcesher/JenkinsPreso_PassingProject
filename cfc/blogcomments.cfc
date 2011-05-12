component persistent="true" table="BLOGCOMMENTS" entityName="blogcomments" {

	property name="ID" column="ID" ormtype="string" type="string" fieldtype="id" generator="native" length="35" ;
	property name="ENTRYIDFK" column="ENTRYIDFK" ormtype="string" type="string" length="35" ;
	property name="NAME" column="NAME" ormtype="string" type="string" length="50" ;
	property name="EMAIL" column="EMAIL" ormtype="string" type="string" length="50" ;
	property name="COMMENT" column="COMMENT" ormtype="string" type="string" length="2147483647" ;
	property name="POSTED" column="POSTED" ormtype="timestamp" type="date" length="26" ;

	public blogcomments function init() {
		return This;
	}

	public void function nullifyZeroID() {
		if (getIDValue() eq 0){
			variables[getIDName()] = JavaCast("Null", "");
		}
	}

	public blogcomments function populate(required struct formStruct ) {
		if (StructKeyExists(arguments.formstruct, "ID") AND arguments.formstruct.ID > 0){
			This = EntityLoad("blogcomments", arguments.formstruct.ID, true);
		}
		if (StructKeyExists(arguments.formstruct, "ENTRYIDFK")){
			this.setENTRYIDFK(arguments.formstruct.ENTRYIDFK);
		}
		if (StructKeyExists(arguments.formstruct, "NAME")){
			this.setNAME(arguments.formstruct.NAME);
		}
		if (StructKeyExists(arguments.formstruct, "EMAIL")){
			this.setEMAIL(arguments.formstruct.EMAIL);
		}
		if (StructKeyExists(arguments.formstruct, "COMMENT")){
			this.setCOMMENT(arguments.formstruct.COMMENT);
		}
		if (StructKeyExists(arguments.formstruct, "POSTED")){
			this.setPOSTED(arguments.formstruct.POSTED);
		}
		return This;
	}

}