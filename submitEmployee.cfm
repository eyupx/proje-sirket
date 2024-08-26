<cfif structKeyExists(form, "firstName")>
    <cfquery datasource="EmployeeDB">
        INSERT INTO Employees (FirstName, LastName, Age, Department, Salary)
        VALUES (<cfqueryparam value="#form.firstName#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#form.lastName#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#form.age#" cfsqltype="cf_sql_integer">,
                <cfqueryparam value="#form.department#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#form.salary#" cfsqltype="cf_sql_decimal">)
    </cfquery>
    <cfoutput>
        <p>Çalışan başarıyla eklendi!</p>
        <a href="addEmployee.cfm">Başka bir çalışan ekle</a>
    </cfoutput>
</cfif>
