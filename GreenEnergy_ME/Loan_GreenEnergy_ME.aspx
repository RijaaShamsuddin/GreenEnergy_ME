﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Loan_GreenEnergy_ME.aspx.cs" Inherits="GreenEnergy_ME.Loan_GreenEnergy_ME" %>

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

    </style>
</head>
<body>
    <form id="form1" runat="server">


      <div class="container-fluid" id="container">
          <img src="img/image002_new.jpg" alt="www.bankalfalah.com"  style="width: 136px; height: 25px"/>
            <br />
          <br />
          <div class="whitespace">
              <h6>I/We Hereby apply to avail financing (new/rollover/enhancement) at your branch. Our particulars are provided as below:</h6>
          </div>
          <br />
                <asp:Repeater ID="Repeater" runat="server" OnItemCommand="Repeater_ItemCommand">
                <ItemTemplate>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <table runat="server" id="Table1" class="Table" style="width: 100%; border-collapse: inherit">
                                <tr>
                                    <th colspan="12" class="headings">GREEN ENERGY ME</th>
                                </tr>
                                <tr>
                                    <td rowspan="2" colspan="3" class="row_heading headings">1. Business Status:</td>
                                    <td rowspan="2">
                                        <label><%# Eval("legstatus") %>&nbsp;</label></td>
                                    <td rowspan="2" colspan="3" class="row_heading headings">2. Business Nature:</td>
                                    <td>
                                        <label><%# Eval("nat_business") %>&nbsp;</label></td>
                                </tr>
                            </table>

                        </div>
                    </div>

                    <br />

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <table runat="server" id="Table2" class="Table" style="width: 100%; border-collapse: inherit">
                                <tr>
                                    <td rowspan="1" colspan="12" class="row_heading headings">3. Business Details</td></tr>
                                <tr>
                                    <td class="td">Name of Business:</td>
                                    <td colspan="2">
                                        <label><%# Eval("clientName") %>&nbsp;</label></td>                                   
                                    <td class="td">No. of employees:</td>
                                    <td colspan="3">
                                        <label><%# Eval("no_of_emp") %>&nbsp;</label></td>                                  
                                </tr>
                                <tr>
                                    <td class="td">Business Phone No:</td>
                                    <td colspan="2">
                                        <label><%# Eval("tel_no") %>&nbsp;</label></td>
                                    <td class="td">Annual Sales Turnover (Rs.):</td>
                                    <td colspan="3">
                                        <label><%# Eval("client_sales") %>&nbsp;</label></td>
                                    
                                </tr>
                                <tr>
                                    <td class="td">Fax No:</td>
                                    <td colspan="2">
                                        <label><%# Eval("fax") %>&nbsp;</label></td>
                                    
                                    <td class="td">Date of Establishment:</td>
                                    <td colspan="3">
                                        <label><%# Eval("est_date") %>&nbsp;</label></td>

                                    
                                </tr>
                                <tr>

                                    <td class="td">Email Address:</td>
                                    <td colspan="2">
                                        <label><%# Eval("email_add") %>&nbsp;</label></td>
                                    <td class="td">Registration No:</td>
                                    <td colspan="3">
                                        <label><%# Eval("reg_no") %>&nbsp;</label></td>
                                </tr>
                                <tr>
                                    <td class="td">Address:</td>
                                    <td colspan="2">
                                        <label><%# Eval("addrs") %>&nbsp;</label></td>
                                    <td rowspan="3" colspan="1" class="td auto-style8">Main Business Account:</td>
                                    <td class="td" colspan="2">Bank Name</td>
                                    <td colspan="2" class="auto-style8">
                                        <label>Bank Alfalah</label></td>
                                </tr>
                                <tr>
                                    <td class="td">Business Premises</td>
                                    <td colspan="2">
                                        <label><%# Eval("premises") %>&nbsp;</label></td> 
                                    <td class="td" colspan="2">Account No.</td>
                                    <td colspan="2" class="auto-style8">
                                        <label><%# Eval("account_num") %>&nbsp;</label></td>
                                    
                                </tr>
                                <tr>
                                    <td class="td">NTN No</td>
                                    <td colspan="2">
                                        <label><%# Eval("ntn") %>&nbsp;</label></td>
                                    <td class="td" colspan="2">Date of A/C opening</td>
                                    <td colspan="2" class="auto-style8">
                                        <label><%# Eval("accnt_op_date") %>&nbsp;</label></td>
                                    
                                </tr>
                            </table>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

          <br />

          <div class="row">
              <div class="col-lg-12 col-md-12 col-sm-12">
                  <table id="Table" class="Table" style="width: 100%;table-layout: fixed;">
                
                      <tr>
                         <td rowspan="1" colspan="12" class="row_heading headings">
                           4. Brief Description about business (products & services offered)</td></tr>
                      <tr>
                          <td colspan="12" class="whitespace">
                              <%=nat_bus%>
                          </td>
                      </tr>
                    </table>
              </div>
           </div>

          <br />

          <div class="row">
              <div class="col-lg-12 col-md-12 col-sm-12">
                  <table id="Table11" class="Table" style="width: 100%;">
                <tr><td colspan="12" class="row_heading headings">5. Owners/Partners/Directors Details</td></tr>
            <asp:Repeater ID="dir_details" runat="server">
               <HeaderTemplate>
                   <tr><td class="td" colspan="2">Name</td>
                       <td class="td" colspan="2">Address</td>
                       <td class="td" colspan="2">Contact Details</td>
                       <td class="td" colspan="2">CNIC No</td>
                       <td class="td" colspan="2">Status in Business</td>
                       <td class="td" colspan="2">Shareholding (%)</td>
                   </tr>
               </HeaderTemplate>
               <ItemTemplate> 
                   <tr>  
                       <td colspan="2" class="whitespace">
                       <label><%# Eval("Director") %>&nbsp;</label></td>
                       <td colspan="2" class="whitespace">
                       <label><%# Eval("Address") %>&nbsp;</label></td>
                       <td colspan="2">
                       <table style="border-collapse: collapse; border: none;">
                        <tr style="border: none;">
                            <td style="border: none;" colspan="2">Cell No:</td>
                            <td style="border: none;" colspan="2"><%# Eval("cell_no") %></td>
                        </tr>
                        <tr style="border: none;">
                            <td style="border: none;" colspan="2">Tell No:</td>
                            <td style="border: none;" colspan="2"><%# Eval("tel_no") %></td>
                        </tr>
                        <tr style="border: none;">
                            <td style="border: none;" colspan="2">Email:</td>
                            <td style="border: none;" colspan="2"><%# Eval("email") %></td>
                        </tr>
                       </table>
                           </td>
                       <td colspan="2" class="whitespace">
                       <label><%# Eval("NIC") %>&nbsp;</label></td>
                       <td colspan="2" class="whitespace">
                       <label><%# Eval("Director_Type") %>&nbsp;</label></td>
                       <td colspan="2" class="whitespace">
                       <label><%# Eval("Share") %>&nbsp;</label></td>

                   </tr>
               </ItemTemplate>
                </asp:Repeater>
                      </table>
              </div>
           </div>

          <div class ="row" style="margin-top: 15px;">
              <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
           <table id="Table5" class="Table" style="width: 100%;">
                <tr><td colspan="12" class="row_heading headings">6. Faciliy(ies)</td></tr>
                  <asp:GridView ID="GridView1" Width="100%" runat="server" AutoGenerateColumns="False" OnDataBound="GridView1_DataBound" OnPreRender="GridView1_PreRender" OnRowDataBound="GridView1_RowDataBound" ShowFooter="True">
            <Columns>
                <asp:TemplateField HeaderText="Line No."><HeaderStyle CssClass="row_heading whitespace" BorderStyle="Solid"/>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Sno") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Facility"><HeaderStyle CssClass="row_heading whitespace" BorderStyle="Solid"/>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("facility_Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="FRR"><HeaderStyle CssClass="row_heading whitespace" BorderStyle="Solid"/>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("FRR") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Status"><HeaderStyle CssClass="row_heading whitespace" BorderStyle="Solid"/>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("fac_status") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="O/s" Visible="false"><HeaderStyle CssClass="row_heading whitespace" BorderStyle="Solid"/>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("outstanding") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Approved Limit"><HeaderStyle CssClass="row_heading whitespace" BorderStyle="Solid"/>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("AppLimit") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Proposed Limit"><HeaderStyle CssClass="row_heading whitespace" BorderStyle="Solid"/>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("ProposedLimit") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Repayment Frequency"><HeaderStyle CssClass="row_heading whitespace" BorderStyle="Solid"/>
                    <ItemTemplate>
                        <asp:Label ID="Label11" runat="server" Text='<%# Eval("repayment_freq") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tenor" Visible="false"><HeaderStyle CssClass="row_heading whitespace" BorderStyle="Solid"/>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("Tenor") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Security"><HeaderStyle CssClass="row_heading whitespace" BorderStyle="Solid"/>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Eval("coll_name") + " --- " + Eval("coll_type")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Value"><HeaderStyle CssClass="row_heading whitespace" BorderStyle="Solid"/>
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Eval("coll_value") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle CssClass="Footer1" ></FooterStyle>
        </asp:GridView>
        </table>
              
          </div>
          
          <br />

          <div class ="row" style="margin-top: 15px;">
              <div class="col-lg-12 col-md-12 col-sm-12">
                  <table id="Table12" class="Table" style="width: 100%;">
                <tr><td colspan="12" class="row_heading headings">7. Market Information</td></tr>
            <asp:Repeater ID="marketinfo" runat="server">
               <HeaderTemplate>
                   <tr>
                       <td class="td" colspan="2" ></td>
                       <td class="td" colspan="2" >Name</td>
                       <td class="td" colspan="2" >Terms of Trade (Cash or Credit Based)</td>
                       <td class="td" colspan="2" ></td>
                       <td class="td" colspan="2" >Name</td>
                       <td class="td" colspan="2" >Terms of Trade (Cash or Credit Based)</td>
                   </tr>
               </HeaderTemplate>
               <ItemTemplate> 
                   <tr> 
                       <td class="td" colspan="2" >Suppliers</td> 
                       <td colspan="2"  class="whitespace">
                       <label><%# Eval("supp_name") %>&nbsp;</label></td>
                       <td colspan="2">
                       <table style="border-collapse: collapse; border: none;">
                        <tr style="border: none;">
                            <td style="border: none;"  >Cash(%):</td>
                            <td style="border: none;" ><%# Eval("supp_cash") %></td>
                        </tr>
                        <tr style="border: none;">
                            <td style="border: none;"  >Credit(%):</td>
                            <td style="border: none;" ><%# Eval("supp_credit") %></td>
                        </tr>
                        <tr style="border: none;">
                            <td style="border: none;"  >Tenor:</td>
                            <td style="border: none;" ><%# Eval("supp_tenor") %></td>
                        </tr>
                       </table>
                           </td>
                       <td class="td" colspan="2"  >Customers</td>
                       <td  colspan="2" class="whitespace">
                       <label><%# Eval("cust_name") %>&nbsp;</label></td>
                       <td colspan="2">
                       <table style="border-collapse: collapse; border: none;">
                        <tr style="border: none;">
                            <td style="border: none;"  >Cash(%):</td>
                            <td style="border: none;" ><%# Eval("cust_cash") %></td>
                        </tr>
                        <tr style="border: none;">
                            <td style="border: none;"  >Credit(%):</td>
                            <td style="border: none;" ><%# Eval("cust_credit") %></td>
                        </tr>
                        <tr style="border: none;">
                            <td style="border: none;"  >Tenor:</td>
                            <td style="border: none;" ><%# Eval("cust_tenor") %></td>
                        </tr>
                       </table>
                           </td>

                   </tr>
               </ItemTemplate>
                </asp:Repeater>
                      </table>
              </div>
           </div>

              <br />

         <div class="row">
              <div class="col-lg-12 col-md-12 col-sm-12">
                  <table id="Table21" class="Table" style="width: 100%;">
                <tr><td colspan="12" class="row_heading headings">8. Detail of Guarantees provided by the Directors/Partners to Financial institutions to Secure Credit</td></tr>
            <asp:Repeater ID="guarantee" runat="server">
               <HeaderTemplate>
                   <tr><td class="td" colspan="3">Name of Guarantor(s)</td>
                       <td class="td" colspan="3">To whom Guarantee Given</td>
                       <td class="td" colspan="2">Amount of Guarantee</td>
                       <td class="td" colspan="2">Validity Period</td>
                       <td class="td" colspan="2">Net Worth of Guarantor</td>
                   </tr>
               </HeaderTemplate>
               <ItemTemplate> 
                   <tr>  
                       <td colspan="3" class="whitespace">
                       <label><%# Eval("guarantor_name") %>&nbsp;</label></td>
                       <td colspan="3" class="whitespace">
                       <label><%# Eval("guarantee_given") %>&nbsp;</label></td>
                       <td colspan="2" class="whitespace">
                       <label><%# Eval("amt_guarantee") %>&nbsp;</label></td>
                       <td colspan="2" class="whitespace">
                       <label><%# Eval("validity_period") %>&nbsp;</label></td>
                       <td colspan="2" class="whitespace">
                       <label><%# Eval("networth_guarantor") %>&nbsp;</label></td>
                   </tr>
               </ItemTemplate>
                </asp:Repeater>
                      </table>
              </div>
           </div>

          <br />

          <div class="row">
              <div class="col-lg-12 col-md-12 col-sm-12">
                  <table id="Table22" class="Table" style="width: 100%;">
                <tr><td colspan="12" class="row_heading headings">9. Financial Indicators(amount in Rs.)</td></tr>
            <asp:Repeater ID="Repeater1" runat="server">
                <HeaderTemplate>
                    <tr>
                        <td class="td row_heading" colspan="3">Particulars</td>
                        <td class="td row_heading" colspan="3">Amount in Rs.</td>
                        <td class="td row_heading" colspan="3">Particulars</td>
                        <td class="td row_heading" colspan="3">Amount in Rs.</td>
                    </tr>
                </HeaderTemplate>
               <ItemTemplate>
                   <tr><td class="td" colspan="3">Cash in Hand</td>
                       <td colspan="3" class="whitespace">
                       <label><%# Eval("Cash_Bank_Balances") %>&nbsp;</label></td>
                       <td colspan="3" class="td" >Current Liabilities</td>
                       <td colspan="3" class="whitespace">
                       <label><%# Eval("Total_Curr_Liabilities") %>&nbsp;</label></td>
                   </tr>
                   <tr><td class="td" colspan="3">Cash at Bank</td>
                       <td colspan="3" class="whitespace">
                       <label><%# Eval("Cash_Bank_Balances") %>&nbsp;</label></td>
                       <td class="td" colspan="3">Borrowings</td>
                       <td colspan="3" class="whitespace">
                       <label><%# Eval("DTER") %>&nbsp;</label></td>
                   </tr>
                   <tr><td class="td" colspan="3">Inventory value</td>
                       <td colspan="3" class="whitespace">
                       <label><%# Eval("Inventory") %>&nbsp;</label></td>
                       <td class="td" colspan="3">Total Liabilities</td>
                       <td colspan="3" class="whitespace">
                       <label><%# Eval("Total_Liab") %>&nbsp;</label></td>
                   </tr>
                   <tr><td class="td" colspan="3" >Investments</td>
                       <td colspan="3" class="whitespace">
                       <label><%# Eval("Investments") %>&nbsp;</label></td>
                       <td class="td" colspan="3">Total Equity</td>
                       <td colspan="3" class="whitespace">
                       <label><%# Eval("Total_Equity") %>&nbsp;</label></td>
                   </tr>
                   <tr><td class="td" colspan="3">Fixed Investments</td>
                       <td colspan="3" class="whitespace">
                       <label><%# Eval("Fixed_Investments") %>&nbsp;</label></td>
                       <td class="td" colspan="3">Gross Revenue</td>
                       <td colspan="3" class="whitespace">
                       <label><%# Eval("Gross_Profit") %>&nbsp;</label></td>
                   </tr>
                   <tr><td class="td" colspan="3">Current Assets</td>
                       <td colspan="3" class="whitespace">
                       <label><%# Eval("Total_Curr_Asset") %>&nbsp;</label></td>
                       <td class="td" colspan="3">Total Expenses</td>
                       <td colspan="3" class="whitespace">
                       <label><%# Eval("DTER") %>&nbsp;</label></td>
                   </tr>
                   <tr><td class="td" colspan="3">Total Assets</td>
                       <td colspan="3" class="whitespace">
                       <label><%# Eval("Total_Assets") %>&nbsp;</label></td>
                       <td class="td" colspan="3">Profit after tax</td>
                       <td colspan="3" class="whitespace">
                       <label><%# Eval("Profit_atax") %>&nbsp;</label></td>
                   </tr>
                   </tr>
               </ItemTemplate>
                </asp:Repeater>
                      </table>
              </div>
           </div>

          <br />

              <div class="row">
              <div class="col-lg-12 col-md-12 col-sm-12">
                  <table id="Table32" class="Table" style="width: 100%;table-layout: fixed;">
                
                      <tr>
                         <td rowspan="1" colspan="12" class="row_heading headings">
                           10. Net Metering Required</td></tr>
                      <tr>
                          <td colspan="12" class="whitespace">
                             <%=metering%>
                          </td>
                      </tr>
                    </table>
              </div>
           </div>

              <br />

            <div class="row">
              <div class="col-lg-12 col-md-12 col-sm-12">
                  <h5 style="font-weight:bold;text-decoration: underline;">Undertaking</h5>
                  
                      <ul class="whitespace">
                          <li>
                              I/We certify and undertake that the information furnished above is true to the best of my knowledge.
                          </li>
                          <li>
                              I/We hereby authorize the bank to obtain information/data regarding my/our Allied Concern's financial
                              and personal details from any credut bureau, agent, financial institution, companies or from any other 
                              sources for the purposes of processing my/our loan application form and to monitor my/our facilities/accounts.
                          </li>
                          <li>
                              I/We agree that the submission of above information and loan application form is not the approval of finance
                              and I shall have no right to clain for finance before any forum, if my request of those finance declined by 
                              bank for any reason.
                          </li>
                          <li>
                              I/We undertake that the loan will be utilized for the same purpose as specified above in the loan.
                          </li>
                          <li>
                              I/We agree that thecost of any electrical or contruction work to be carried out as a preparation to install 
                              solar equipmet shall be borne by us and shall not be a part of financing provided by the bank.
                          </li>
                      </ul>
                  
              </div>
          </div>

              <br />

          <div class ="row" style="margin-top: 15px;">
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
              <asp:Button ID="Button2" CssClass="btn btn-secondary btn-sm" runat="server" Text="Next" onClick ="Next" style ="width:150px;"/>
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
