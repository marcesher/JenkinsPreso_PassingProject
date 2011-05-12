<!--- pollsEdit.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.polls" type="any" />
<cfparam name="attributes.message" type="string" default="" />
<cfset polls = attributes.polls /> 
<cfset message = attributes.message /> 
<cfif CompareNoCase(message, "updated") eq 0>
	<p class="alert">Records updated</p>
<cfelse>
	<p></p>
</cfif>
<cfoutput>
<cfform action="?method=edit_process" method="post" format="html">
	<table>
	<tbody>
			<input name="POLLID" type="hidden" value="#polls.getPOLLID()#" />
		<tr>
			<th><label for="QUESTION">Question:</label></th>
			<td><cftextarea name="QUESTION"  id="QUESTION" value="#polls.getQUESTION()#" richtext="true" toolbar="Basic" skin="Silver" /></td>
		</tr>
		<tr>
			<th><label for="ANSWER1">Answer1:</label></th>
			<td><cftextarea name="ANSWER1"  id="ANSWER1" value="#polls.getANSWER1()#" richtext="true" toolbar="Basic" skin="Silver" /></td>
		</tr>
		<tr>
			<th><label for="ANSWER2">Answer2:</label></th>
			<td><cftextarea name="ANSWER2"  id="ANSWER2" value="#polls.getANSWER2()#" richtext="true" toolbar="Basic" skin="Silver" /></td>
		</tr>
		<tr>
			<th><label for="ANSWER3">Answer3:</label></th>
			<td><cftextarea name="ANSWER3"  id="ANSWER3" value="#polls.getANSWER3()#" richtext="true" toolbar="Basic" skin="Silver" /></td>
		</tr>
		<tr>
			<th><label for="ANSWER4">Answer4:</label></th>
			<td><cftextarea name="ANSWER4"  id="ANSWER4" value="#polls.getANSWER4()#" richtext="true" toolbar="Basic" skin="Silver" /></td>
		</tr>
		<tr>
			<th><label for="ANSWER5">Answer5:</label></th>
			<td><cftextarea name="ANSWER5"  id="ANSWER5" value="#polls.getANSWER5()#" richtext="true" toolbar="Basic" skin="Silver" /></td>
		</tr>
		<tr>
			<th><label for="ISLIVE">Islive:</label></th>
			<td><input name="ISLIVE" type="text" id="ISLIVE" value="#polls.getISLIVE()#" /></td>
		</tr>
		<tr>
			<th />
			<td><input name="save" type="submit" value="Save" /></td>
		</tr>
	</tbody>
	</table>
</cfform>
</cfoutput>
</cfprocessingdirective>
<cfexit method="exitTag" />