<!--- pollresponsesRead.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.pollresponses" type="any" />
<cfparam name="attributes.class" type="string" default="readpage" />
<cfset pollresponses = attributes.pollresponses /> 
<cfoutput>
<table>
	<tbody>
		<tr>
			<th>Pollid</th>
			<td>#pollresponses.getPOLLID()#</td>
		</tr>
		<tr>
			<th>A1</th>
			<td>#pollresponses.getA1()#</td>
		</tr>
		<tr>
			<th>A2</th>
			<td>#pollresponses.getA2()#</td>
		</tr>
		<tr>
			<th>A3</th>
			<td>#pollresponses.getA3()#</td>
		</tr>
		<tr>
			<th>A4</th>
			<td>#pollresponses.getA4()#</td>
		</tr>
		<tr>
			<th>A5</th>
			<td>#pollresponses.getA5()#</td>
		</tr>
		<tr>
			<th>Total</th>
			<td>#pollresponses.getTOTAL()#</td>
		</tr>
	</tbody>
</table>
</cfoutput>
</cfprocessingdirective>
<cfexit method="exitTag" />