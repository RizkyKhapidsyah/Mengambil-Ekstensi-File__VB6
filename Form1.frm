VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Mengambil Ekstensi File"
   ClientHeight    =   3090
   ClientLeft      =   -15
   ClientTop       =   375
   ClientWidth     =   5490
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3090
   ScaleWidth      =   5490
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Fungsi ini juga akan memeriksa jika yang diberikan 'anya nama direktori...
Function GetExtension(FileName As String)
    Dim PthPos, ExtPos As Integer
    For i = Len(FileName) To 1 Step -1
        If Mid(FileName, i, 1) = "." Then
            ExtPos = i
            For j = Len(FileName) To 1 Step -1
                If Mid(FileName, j, 1) = "\" Then
                    PthPos = j
                    Exit For
                End If
            Next j
            Exit For
        End If
    Next i
    If PthPos > ExtPos Then
        Exit Function
    Else
        If ExtPos = 0 Then Exit Function
        GetExtension = Mid(FileName, ExtPos + 1, _
                       Len(FileName) - ExtPos)
    End If
End Function

Private Sub Form_Load()
    'Ganti nama file di bawah dengan nama file yang
    'ingin Anda ambil data ekstensinya...
    MsgBox GetExtension("c:\mydir\myfile.exe")
    'Contoh ini menghasilkan 'exe'
End Sub


