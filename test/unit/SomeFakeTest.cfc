<cfcomponent extends="mxunit.framework.TestCase">
	<cffunction name="setUp" returntype="void" access="public" hint="put things here that you want to run before each test">
		<cfset coldfusion = 1>
		<cfset mxunit = 2>
		<cfset awesome = 3>
		
	</cffunction>
	
	<cffunction name="bettaPass" output="false" access="public" returntype="any" hint="">
		<cfset assertEquals("marc","marc")>
	</cffunction>
	
	<cffunction name="bettaThrowAnError" output="false" access="public" returntype="any" mxunit:expectedexception="expression">
		<cfset iArentNoGoodAtMath = 3/0>	
	</cffunction>
	
	<cffunction name="wtfDude" output="false" access="public" returntype="any" hint="">
		<cfset assertTrue((coldfusion + mxunit) eq awesome)>
	</cffunction>
	
		<cffunction name="wtfDude2" output="false" access="public" returntype="any" hint="">
		<cfset assertTrue((coldfusion + mxunit) eq awesome)>
	</cffunction>
	
		<cffunction name="wtfDude3" output="false" access="public" returntype="any" hint="">
		<cfset assertTrue((coldfusion + mxunit) eq awesome)>
	</cffunction>
	
		<cffunction name="wtfDude4" output="false" access="public" returntype="any" hint="">
		<cfset assertTrue((coldfusion + mxunit) eq awesome)>
	</cffunction>
	
		<cffunction name="wtfDude6" output="false" access="public" returntype="any" hint="">
		<cfset assertTrue((coldfusion + mxunit) eq awesome)>
	</cffunction>
	
		<cffunction name="wtfDude5" output="false" access="public" returntype="any" hint="">
		<cfset assertTrue((coldfusion + mxunit) eq awesome)>
	</cffunction>
	
		<cffunction name="wtfDude7" output="false" access="public" returntype="any" hint="">
		<cfset assertTrue((coldfusion + mxunit) eq awesome)>
	</cffunction>
	
		<cffunction name="wtfDude8" output="false" access="public" returntype="any" hint="">
		<cfset assertTrue((coldfusion + mxunit) eq awesome)>
	</cffunction>
	
		<cffunction name="wtfDude9" output="false" access="public" returntype="any" hint="">
		<cfset assertTrue((coldfusion + mxunit) eq awesome)>
	</cffunction>
	
		<cffunction name="wtfDude10" output="false" access="public" returntype="any" hint="">
		<cfset assertTrue((coldfusion + mxunit) eq awesome)>
	</cffunction>
	
		<cffunction name="wtfDude11" output="false" access="public" returntype="any" hint="">
		<cfset assertTrue((coldfusion + mxunit) eq awesome)>
	</cffunction>
	
		<cffunction name="wtfDude111" output="false" access="public" returntype="any" hint="">
		<cfset assertTrue((coldfusion + mxunit) eq awesome)>
	</cffunction>
	
		<cffunction name="wtfDude1111" output="false" access="public" returntype="any" hint="">
		<cfset assertTrue((coldfusion + mxunit) eq awesome)>
	</cffunction>
	
		<cffunction name="wtfDude11111" output="false" access="public" returntype="any" hint="">
		<cfset assertTrue((coldfusion + mxunit) eq awesome)>
	</cffunction>
	
		<cffunction name="wtfDude111111" output="false" access="public" returntype="any" hint="">
		<cfset assertTrue((coldfusion + mxunit) eq awesome)>
	</cffunction>
	
	<cffunction name="wtfDude1111111" output="false" access="public" returntype="any" hint="">
		<cfset assertTrue((coldfusion + mxunit) eq awesome)>
	</cffunction>
	
	<cffunction name="wtfDude11111111" output="false" access="public" returntype="any" hint="">
		<cfset assertTrue((coldfusion + mxunit) eq awesome)>
	</cffunction>
	
	<cffunction name="wtfDude111111111" output="false" access="public" returntype="any" hint="">
		<cfset assertTrue((coldfusion + mxunit) eq awesome)>
	</cffunction>
	
	
</cfcomponent>
