<cfif form.username eq "admin" and form.password eq "admin">
    <cfquery name="employees" datasource="EmployeeDB">
        SELECT * FROM Employees
    </cfquery>
    <div class="container">
        <h2>Çalışanlar Listesi</h2>
        <table class="table">
            <thead>
                <tr>
                    <th>Ad</th>
                    <th>Soyad</th>
                    <th>Yaş</th>
                    <th>Birim</th>
                    <th>Maaş</th>
                </tr>
            </thead>
            <tbody>
                <cfoutput query="employees">
                    <tr>
                        <td>#FirstName#</td>
                        <td>#LastName#</td>
                        <td>#Age#</td>
                        <td>#Department#</td>
                        <td>#Salary#</td>
                    </tr>
                </cfoutput>
            </tbody>
        </table>
        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#reportModal">Raporu Hesapla</button>

        <!-- Modal -->
        <div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Rapor</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <cfset totalEmployees = employees.RecordCount>
                        <cfset averageAge = 0>
                        <cfset totalSalary = 0>
                        <cfset averageSalary = 0>
                        <cfif totalEmployees gt 0>
                            <cfset totalAge = 0>
                            <cfoutput query="employees">
                                <cfset totalAge = totalAge + Age>
                                <cfset totalSalary = totalSalary + Salary>
                            </cfoutput>
                            <cfset averageAge = totalAge / totalEmployees>
                            <cfset averageSalary = totalSalary / totalEmployees>
                        </cfif>
                        <p>Toplam Çalışan Sayısı: #totalEmployees#</p>
                        <p>Çalışanların Yaş Ortalaması: #averageAge#</p>
                        <p>Çalışanların Toplam Maaş Miktarı: #totalSalary#</p>
                        <p>Çalışanların Ortalama Maaş Miktarı: #averageSalary#</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Kapat</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS ve jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</cfif>
