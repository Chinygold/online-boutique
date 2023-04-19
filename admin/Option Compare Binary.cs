Option Compare Binary
Imports System.Data.OleDb
Imports System.IO
Imports System.Drawing
Public Class frmRegistration
    Dim rdr As OleDbDataReader = Nothing
    Dim dtable As DataTable
    Dim con As OleDbConnection = Nothing
    Dim adp As OleDbDataAdapter
    Dim ds As DataSet
    Dim cmd As OleDbCommand = Nothing
    Dim dt As New DataTable

    Dim dtAC As DataTable
    Const cs As String = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\Department.accdb;Persist Security Info=False;"

    Dim myConnection As OleDbConnection

    Dim myCommand As OleDbCommand


    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
       

        Try
            With OpenFileDialog1
                .Filter = ("Images |*.png; *.bmp; *.jpg;*.jpeg; *.gif;")
                .FilterIndex = 4
            End With
            'Clear the file name
            OpenFileDialog1.FileName = ""
            If OpenFileDialog1.ShowDialog() = DialogResult.OK Then
                picImage.Image = Image.FromFile(OpenFileDialog1.FileName)
            End If
        Catch ex As Exception
            MessageBox.Show(ex.Message, "Image Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try


    End Sub
    Sub SetImg()
        Dim ms1 As New MemoryStream()

        Dim bmpImage1 As New Bitmap(picImage.Image)

        bmpImage1.Save(ms1, System.Drawing.Imaging.ImageFormat.Jpeg)

        Dim data1 As Byte() = ms1.GetBuffer()
        Dim p As New OleDbParameter("@d1", OleDbType.VarBinary)

        p.Value = data1

        cmd.Parameters.Add(p)

    End Sub

    Private Sub txtYr_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtYear.TextChanged
        txtYear.MaxLength = 4
    End Sub

   
    Private Sub cleartxt()

        cboBatch.SelectedIndex = -1
        cboClass.SelectedIndex = -1
        cboDay.SelectedIndex = -1
        cboMonth.SelectedIndex = -1
        cboLevel.SelectedIndex = -1
        cboSession.SelectedIndex = -1
        cboGender.SelectedIndex = -1

        txtStudentID.Clear()
        txtYear.Clear()
        txtFN.Clear()
        txtLN.Clear()
        txtOth.Clear()
        txtcontactno.Clear()
        txtemail.Clear()
        txtemail.Clear()


        picImage.Image = My.Resources.noimage

    End Sub

    Private Sub Button4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button4.Click
        cleartxt()
        txtFN.Focus()

    End Sub

    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        cleartxt()
        txtFN.Focus()
    End Sub

    
    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
       
        If Len(Trim(txtFN.Text)) = 0 Then
            MessageBox.Show("Please enter First Name", "Input Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
            txtFN.Focus()
            Exit Sub
        End If
        If Len(Trim(txtLN.Text)) = 0 Then
            MessageBox.Show("Please enter Surname", "Input Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
            txtLN.Focus()
            Exit Sub
        End If

        If Len(Trim(cboGender.Text)) = 0 Then
            MessageBox.Show("Please select gender", "Input Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
            cboGender.Focus()
            Exit Sub
        End If
        If Len(Trim(txtStudentID.Text)) = 0 Then
            MessageBox.Show("Please enter StudentID", "Input Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
            txtStudentID.Focus()
            Exit Sub
        End If
        If Len(Trim(cboLevel.Text)) = 0 Then
            MessageBox.Show("Please select Level of Student", "Input Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
            cboLevel.Focus()
            Exit Sub
        End If
        If Len(Trim(cboSession.Text)) = 0 Then
            MessageBox.Show("Please Select Session", "Input Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
            cboSession.Focus()
            Exit Sub
        End If
        If Len(Trim(cboBatch.Text)) = 0 Then
            MessageBox.Show("Please select Batch or year group", "Input Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
            cboBatch.Focus()
            Exit Sub
        End If
        If Len(Trim(cboClass.Text)) = 0 Then
            MessageBox.Show("Please select Class", "Input Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
            cboClass.Focus()
            Exit Sub
        End If
        If Len(Trim(txtcontactno.Text)) = 0 Then
            MessageBox.Show("Please enter telephone no.", "Input Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
            txtcontactno.Focus()
            Exit Sub
        End If
        If Len(Trim(txtemail.Text)) = 0 Then
            MessageBox.Show("Please enter email address", "Input Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
            txtemail.Focus()
            Exit Sub
        End If
      
        Try

            con = New OleDbConnection(cs)
            con.Open()
            Dim cb As String = "insert into Enrollment(StudentID, FirstName, Surname, MiddleName, Gender, Day, Month, Year, Session, Batch, Level, Class, ContactNo, Email, DateEnrolled) VALUES ('" & txtStudentID.Text & "','" & txtFN.Text & "','" & txtLN.Text & "','" & txtOth.Text & "','" & cboGender.Text & "','" & cboDay.Text & "','" & cboMonth.Text & "','" & txtYear.Text & "','" & cboSession.Text & "','" & cboBatch.Text & "','" & cboLevel.Text & "','" & cboClass.Text & "','" & txtcontactno.Text & "'," & txtemail.Text & "','" & System.DateTime.Now & "')"



           
            cmd = New OleDbCommand(cb)
            cmd.Connection = con
            cmd.ExecuteReader()
            con.Close()


            MessageBox.Show("Successfully saved", "Record", MessageBoxButtons.OK, MessageBoxIcon.Information)


        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try

    End Sub

    Private Sub txtemail_Validating(ByVal sender As Object, ByVal e As System.ComponentModel.CancelEventArgs) Handles txtemail.Validating
        Dim rEMail As New System.Text.RegularExpressions.Regex("[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$")
        'NO NUMBER FIRST 
        'Dim rEMail As New System.Text.RegularExpressions.Regex("^[a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$")

        If txtemail.Text.Length > 0 Then
            If Not rEMail.IsMatch(txtemail.Text) Then
                MessageBox.Show("invalid email address", "Check Email", MessageBoxButtons.OK, MessageBoxIcon.[Error])
                txtemail.SelectAll()
                e.Cancel = True
            End If
        End If
    End Sub



    Private Sub txtStudentID_Validating(ByVal sender As Object, ByVal e As System.ComponentModel.CancelEventArgs) Handles txtStudentID.Validating
        If (txtStudentID.TextLength > 10) Then
            MessageBox.Show("Only 10 digits are allowed", "Check Student ID", MessageBoxButtons.OK, MessageBoxIcon.Error)
            txtStudentID.Focus()
        End If
        If (txtStudentID.TextLength < 10) Then
            MessageBox.Show("Only 10 digits are allowed, StudentID should be up to 10 digit", "Check Student ID", MessageBoxButtons.OK, MessageBoxIcon.Error)
            txtStudentID.Focus()
        End If
    End Sub

    Private Sub txtcontactno_Validating(ByVal sender As Object, ByVal e As System.ComponentModel.CancelEventArgs) Handles txtcontactno.Validating
        If (txtcontactno.TextLength > 10) Then
            MessageBox.Show("Only 10 digits are allowed", "Check Phone Number", MessageBoxButtons.OK, MessageBoxIcon.Error)
            txtcontactno.Focus()
        End If
        If (txtcontactno.TextLength < 10) Then
            MessageBox.Show("Only 10 digits are allowed, Number not up to 10 digit", "Check Phone Number", MessageBoxButtons.OK, MessageBoxIcon.Error)
            txtcontactno.Focus()
        End If
    End Sub


    Private Sub frmRegistration_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

    End Sub

    Private Sub txtStudentID_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtStudentID.TextChanged
        txtStudentID.MaxLength = 10
    End Sub

    Private Sub txtcontactno_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtcontactno.TextChanged
        txtcontactno.MaxLength = 10
    End Sub
End Class