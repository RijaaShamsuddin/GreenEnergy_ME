<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Loan_GreenEnergy_ME_Page2.aspx.cs" Inherits="GreenEnergy_ME.Loan_GreenEnergy_ME_Page2" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title></title>
    <!--<link rel="stylesheet"  href="Styles/ScorecardTables.css" id="Table" runat="server" type="text/css" />-->
    <link rel="stylesheet" href="Styles/Table.css" id="Link1" runat="server" type="text/css" />

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <!--<link href="~/Content/css/sb-admin-2.min.css" rel="stylesheet">-->

    <!-- Bootstrap core CSS -->
    <link href="~/Content/bootstrap.min.css" rel="stylesheet">

    <script src="js/jquery.min.js"></script>


    <!-- Page CSS -->
    <style type="text/css">
        .table td {
            word-wrap: break-word;
            white-space: normal !important;
            padding: 1px 5px;
            vertical-align: text-bottom;

        }

        .Table td, .Table2 td {
            padding: 1px 5px;
            text-align: inherit;
        }

        .italic {
            font-style:italic;
        }

        .Table td center {
            text-align:center;
        }

        .whitespace  
        {
            white-space: normal !important;
        }

        #outer_table {
            /*table-layout: fixed;*/
            padding-right: 30px;
        }

        #outer_table table {
             table-layout: fixed;
        }

        .inarow {
            float: left;
            width:27%;
            padding-right: 40px;
        }
        .auto-style1 {
            height: 22px;
        }
        .headings {
            font-size: large;
        }
        .hr {
            border-top: 2px solid black;
            margin-right: 15px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">


      <div class="container-fluid" id="container">
          <div class="row">
              <div class="col-lg-12 col-md-12 col-sm-12">
                  <table id="Table22" class="Table" style="width: 100%;">
                <tr><td colspan="12" class="row_heading headings">CheckList</td></tr>
            <asp:GridView ID="GridView1" Width="100%" runat="server" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound">
            <Columns>
                <asp:TemplateField HeaderText="Check List of Supporting Documents - For Medium Enterprises"><HeaderStyle CssClass="row_heading whitespace" BorderStyle="Solid"/>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("list") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Yes (✓)"><HeaderStyle CssClass="row_heading whitespace" BorderStyle="Solid"/>
                    <ItemTemplate>
                        <asp:Label ID="lblyes" runat="server" Text='<%# Eval("Yes") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="No (X)"><HeaderStyle CssClass="row_heading whitespace" BorderStyle="Solid"/>
                    <ItemTemplate>
                        <asp:Label ID="lblno" runat="server" Text='<%# Eval("No") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Not Applicable (N/A)"><HeaderStyle CssClass="row_heading whitespace" BorderStyle="Solid"/>
                    <ItemTemplate>
                        <asp:Label ID="lblna" runat="server" Text='<%# Eval("NA") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>   
                </Columns>
          </asp:GridView>                                 
               </table>
              </div>
           </div>

          <div class ="row" style="margin-top: 25px;">
              <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
                  <hr align="right" width="20%" class="hr">
                  <h6 style="margin-right:15px">
                      BORROWER'S SIGNATURE & STAMP
                  </h6>
              </div>
          </div>

          <div class ="row" style="margin-top: 15px;">
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
              <asp:Button ID="Button1" CssClass="btn btn-secondary btn-sm" runat="server" Text="Previous" onClick ="Previous" style ="width:150px;"/>
            </div>
            </div>
          <br />
          <br />

      
        </div>

    <!-- Bootstrap core JavaScript -->
    <script src="~/Content/vendor/jquery/jquery.min.js"></script>
    <script src="~/Scripts/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="~/Content/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="~/Scripts/js/sb-admin-2.min.js"></script>
    <script src="~/Content/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- htmlToCanvas script-->
    <script src="Scripts/htmlToCanvas.min.js"></script>
    <script src="https://unpkg.com/jspdf@latest/dist/jspdf.min.js"></script>


    </form>

</body>
</html>