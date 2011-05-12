<!--- pollsRead.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.polls" type="any" />
<cfparam name="attributes.class" type="string" default="readpage" />
<cfset polls = attributes.polls /> 
<cfoutput>
<table>
	<tbody>
		<tr>
			<th>Pollid</th>
			<td>#polls.getPOLLID()#</td>
		</tr>
		<tr>
			<th>Question</th>
			<td>#polls.getQUESTION()#</td>
		</tr>
		<tr>
			<th>Answer1</th>
			<td>#polls.getANSWER1()#</td>
		</tr>
		<tr>
			<th>Answer2</th>
			<td>#polls.getANSWER2()#</td>
		</tr>
		<tr>
			<th>Answer3</th>
			<td>#polls.getANSWER3()#</td>
		</tr>
		<tr>
			<th>Answer4</th>
			<td>#polls.getANSWER4()#</td>
		</tr>
		<tr>
			<th>Answer5</th>
			<td>#polls.getANSWER5()#</td>
		</tr>
		<tr>
			<th>Islive</th>
			<td>#polls.getISLIVE()#</td>
		</tr>
	</tbody>
</table>
</cfoutput>
</cfprocessingdirective>
<cfexit method="exitTag" />