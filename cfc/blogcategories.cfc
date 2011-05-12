component persistent="true" table="BLOGCATEGORIES" entityName="blogcategories" {

	property name="CATEGORYID" column="CATEGORYID" ormtype="string" type="string" fieldtype="id" generator="native" length="35" ;
	property name="CATEGORYNAME" column="CATEGORYNAME" ormtype="string" type="string" length="50" ;
	property name="BLOG" column="BLOG" ormtype="string" type="string" length="50" ;

	public blogcategories function init() {
		return This;
	}

	public void function nullifyZeroID() {
		if (getIDValue() eq 0){
			variables[getIDName()] = JavaCast("Null", "");
		}
	}

	public blogcategories function populate(required struct formStruct ) {
		if (StructKeyExists(arguments.formstruct, "CATEGORYID") AND arguments.formstruct.CATEGORYID > 0){
			This = EntityLoad("blogcategories", arguments.formstruct.CATEGORYID, true);
		}
		if (StructKeyExists(arguments.formstruct, "CATEGORYNAME")){
			this.setCATEGORYNAME(arguments.formstruct.CATEGORYNAME);
		}
		if (StructKeyExists(arguments.formstruct, "BLOG")){
			this.setBLOG(arguments.formstruct.BLOG);
		}
		return This;
	}

}