component persistent="true" table="BLOGENTRIES" entityName="blogentries" {

	property name="ID" column="ID" ormtype="string" type="string" fieldtype="id" generator="native" length="35" ;
	property name="TITLE" column="TITLE" ormtype="string" type="string" length="100" ;
	property name="BODY" column="BODY" ormtype="string" type="string" length="2147483647" ;
	property name="POSTED" column="POSTED" ormtype="timestamp" type="date" length="26" ;
	property name="MOREBODY" column="MOREBODY" ormtype="string" type="string" length="2147483647" ;
	property name="BLOG" column="BLOG" ormtype="string" type="string" length="50" ;
	property name="ALIAS" column="ALIAS" ormtype="string" type="string" length="50" ;
	property name="USERNAME" column="USERNAME" ormtype="string" type="string" length="50" ;

	public blogentries function init() {
		return This;
	}

	public void function nullifyZeroID() {
		if (getIDValue() eq 0){
			variables[getIDName()] = JavaCast("Null", "");
		}
	}

	public blogentries function populate(required struct formStruct ) {
		if (StructKeyExists(arguments.formstruct, "ID") AND arguments.formstruct.ID > 0){
			This = EntityLoad("blogentries", arguments.formstruct.ID, true);
		}
		if (StructKeyExists(arguments.formstruct, "TITLE")){
			this.setTITLE(arguments.formstruct.TITLE);
		}
		if (StructKeyExists(arguments.formstruct, "BODY")){
			this.setBODY(arguments.formstruct.BODY);
		}
		if (StructKeyExists(arguments.formstruct, "POSTED")){
			this.setPOSTED(arguments.formstruct.POSTED);
		}
		if (StructKeyExists(arguments.formstruct, "MOREBODY")){
			this.setMOREBODY(arguments.formstruct.MOREBODY);
		}
		if (StructKeyExists(arguments.formstruct, "BLOG")){
			this.setBLOG(arguments.formstruct.BLOG);
		}
		if (StructKeyExists(arguments.formstruct, "ALIAS")){
			this.setALIAS(arguments.formstruct.ALIAS);
		}
		if (StructKeyExists(arguments.formstruct, "USERNAME")){
			this.setUSERNAME(arguments.formstruct.USERNAME);
		}
		return This;
	}

}