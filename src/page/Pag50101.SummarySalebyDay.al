page 50101 "Summary Sale by Day"
{
    ApplicationArea = All;
    Caption = 'Import Summary Sale by Day';
    PageType = List;
    SourceTable = "Summary Sale by Day";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Date field.';
                    Caption = 'วันที่';
                }
                field("Bill No."; Rec."Bill No.")
                {
                    ToolTip = 'Specifies the value of the Bill No. field.';
                    Caption = '# บิล';
                }
                field(Customer; Rec.Customer)
                {
                    ToolTip = 'Specifies the value of the Customer field.';
                    Caption = '# ลูกค้า';
                }
                field("Selling Price"; Rec."Selling Price")
                {
                    ToolTip = 'Specifies the value of the Selling Price field.';
                    Caption = 'ราคาขาย';
                }
                field(Discount; Rec.Discount)
                {
                    ToolTip = 'Specifies the value of the Discount field.';
                    Caption = 'ส่วนลด';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ToolTip = 'Specifies the value of the Total Amount field.';
                    Caption = 'รวมราคา';
                }
                field(SC; Rec.SC)
                {
                    ToolTip = 'Specifies the value of the SC field.';
                }
                field("Grand Total"; Rec."Grand Total")
                {
                    ToolTip = 'Specifies the value of the Grand Total field.';
                    Caption = 'ราคาสุทธิ';
                }
                field("Amount Before VAT"; Rec."Amount Before VAT")
                {
                    ToolTip = 'Specifies the value of the Amount Before VAT field.';
                    Caption = 'ยอดก่อนภาษี';
                }
                field("Sale VAT Amount"; Rec."Sale VAT Amount")
                {
                    ToolTip = 'Specifies the value of the Sale VAT Amount field.';
                    Caption = 'ภาษีขาย';
                }
                field(Cash; Rec.Cash)
                {
                    ToolTip = 'Specifies the value of the Cash field.';
                }
                field("Credit Card"; Rec."Credit Card")
                {
                    ToolTip = 'Specifies the value of the Credit Card field.';
                }
                field(KTC100; Rec.KTC100)
                {
                    ToolTip = 'Specifies the value of the KTC100 field.';
                }
                field(KTC500; Rec.KTC500)
                {
                    ToolTip = 'Specifies the value of the KTC500 field.';
                }
                field("Food Panda"; Rec."Food Panda")
                {
                    ToolTip = 'Specifies the value of the Food Panda field.';
                }
                field(Delivery; Rec.Delivery)
                {
                    ToolTip = 'Specifies the value of the Delivery field.';
                }
                field("PGS(CRM) 1000"; Rec."PGS(CRM) 1000")
                {
                    ToolTip = 'Specifies the value of the PGS(CRM) 1000 field.';
                }
                field("Grab Credit"; Rec."Grab Credit")
                {
                    ToolTip = 'Specifies the value of the Grab Credit field.';
                }
                field("Line Man (Credit)"; Rec."Line Man (Credit)")
                {
                    ToolTip = 'Specifies the value of the Line Man (Credit) field.';
                }
                field("HD (Cash)"; Rec."HD (Cash)")
                {
                    ToolTip = 'Specifies the value of the HD (Cash) field.';
                }
                field("HD (Credit)"; Rec."HD (Credit)")
                {
                    ToolTip = 'Specifies the value of the HD (Credit) field.';
                }
                field("HD PAY IN"; Rec."HD PAY IN")
                {
                    ToolTip = 'Specifies the value of the HD PAY IN field.';
                    Caption = 'HD PAY IN (โอนเงิน)';
                }
                field(Lazada; Rec.Lazada)
                {
                    ToolTip = 'Specifies the value of the Lazada field.';
                }
                field(robinhood; Rec.robinhood)
                {
                    ToolTip = 'Specifies the value of the robinhood field.';
                }
                field("SCB QR"; Rec."SCB QR")
                {
                    ToolTip = 'Specifies the value of the SCB QR field.';
                }
                field(Claim; Rec.Claim)
                {
                    ToolTip = 'Specifies the value of the Claim field.';
                    Caption = 'CLAIM (เคลม)';
                }
                field("SPF Credit"; Rec."SPF Credit")
                {
                    ToolTip = 'Specifies the value of the SPF Credit field.';
                }
                field("Hungry Hub"; Rec."Hungry Hub")
                {
                    ToolTip = 'Specifies the value of the Hungry Hub field.';
                }
                field("E-Voucher 600"; Rec."E-Voucher 600")
                {
                    ToolTip = 'Specifies the value of the E-Voucher 600 field.';
                }
                field(PGS1000; Rec.PGS1000)
                {
                    ToolTip = 'Specifies the value of the PGS1000 field.';
                    Caption = 'PGS(CRM) 1000';
                }
                field("PGS(CRM) 500"; Rec."PGS(CRM) 500")
                {
                    ToolTip = 'Specifies the value of the PGS(CRM) 500 field.';
                }
                field("E-Voucher AIA 150"; Rec."E-Voucher AIA 150")
                {
                    ToolTip = 'Specifies the value of the E-Voucher AIA 150 field.';
                }
                field("Payment Amount"; Rec."Payment Amount")
                {
                    ToolTip = 'Specifies the value of the Payment Amount field.';
                    Caption = 'ยอดชำระ';
                }
                field("Difference Amount"; Rec."Difference Amount")
                {
                    ToolTip = 'Specifies the value of the Difference Amount field.';
                    Caption = 'ส่วนต่าง';
                }
                field("Average Per Bill"; Rec."Average Per Bill")
                {
                    ToolTip = 'Specifies the value of the Average Per Bill field.';
                    Caption = 'เฉลี่ยต่อบิล';
                }
                field("Average Per Capita"; Rec."Average Per Capita")
                {
                    ToolTip = 'Specifies the value of the Average Per Capita field.';
                    Caption = 'เฉลี่ยต่อหัว';
                }
            }
        }
    }
    actions
    {
        area(processing)
        {
            action("&Import")
            {
                Caption = '&Import';
                Image = ImportExcel;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                ToolTip = 'Import data from excel.';

                trigger OnAction()
                var
                begin
                    ImportExcel.ReadExcelSheet();
                    ImportExcel.ImportSummarySalebyDay();
                end;
            }
        }
    }
    var
        ImportExcel: Codeunit "Import Excel";
}
